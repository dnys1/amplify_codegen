import 'package:amplify_codegen/src/generate.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/parse.dart';
import 'package:amplify_codegen/src/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

/// Generates libraries for model types. Generally, a library consists of two
/// classes: the Model class and the ModelType class.
class ModelTypeGenerator extends LibraryGenerator<ObjectTypeDefinitionNode> {
  ModelTypeGenerator(ObjectTypeDefinitionNode node) : super(node);

  String get modelTypeName => '_${typeName}ModelType';

  @override
  Library generate() {
    builder.body.add(Class((c) {
      c.docs.add(
        '/** This is an auto generated class representing the $typeName '
        'type in your schema. */',
      );
      c.annotations.add(refer('immutable').expression);
      c.name = node.name.value;

      // Add `classType` for model types
      if (node.isModel) {
        c.fields.add(Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..type = refer(modelTypeName)
            ..name = 'classType'
            ..assignment = refer(typeName).constInstance([]).code,
        ));
      }

      c.fields.addAll(_modelFields);

      c.constructors.addAll([
        _internalConstructor,
        _factoryConstructor,
      ]);

      c.methods.addAll(_instanceMethods);
    }));

    if (node.isModel) {
      _buildModelType();
    }

    return builder.build();
  }

  /// Adds `final` fields to the class.
  Iterable<Field> get _modelFields sync* {
    for (var field in node.fields) {
      yield Field(
        (f) {
          final description = field.description?.value;
          if (description != null) {
            f.docs.add(description);
          }
          f.name = field.name.value;
          f.type = field.type.accept(TypeVisitor());
          f.modifier = FieldModifier.final$;
        },
      );
    }
  }

  Constructor get _internalConstructor => Constructor((ctor) => ctor
    ..name = '_internal'
    ..constant = true
    ..optionalParameters.addAll([
      for (var field in node.fields)
        Parameter(
          (p) {
            final type = field.type.accept(TypeVisitor());
            final isID = field.name.value == 'id';
            p
              ..name = field.name.value
              ..named = true
              ..type = isID ? null : type
              ..required = field.type.isNonNull
              ..toThis = isID;
          },
        ),
    ])
    ..initializers.addAll([
      for (var field in node.fields.where((field) => field.name.value != 'id'))
        Code('_${field.name.value} = ${field.name.value}'),
    ]));

  Expression _assignmentFor(FieldDefinitionNode field) {
    final name = field.name.value;
    // TODO: Better way to handle code expression?
    if (name == 'id') {
      return refer('id == null ? UUID.getUUID() : null').expression;
    }
    if (field.type is ListTypeNode) {
      return refer('$name != null ? List.unmodifiable($name) : null')
          .expression;
    }
    return refer(name).expression;
  }

  Constructor get _factoryConstructor => Constructor((ctor) {
        ctor
          ..factory = true
          ..lambda = false
          ..optionalParameters.addAll([
            for (var field in node.fields)
              Parameter((p) {
                final name = field.name.value;
                final type = field.type.accept(TypeVisitor())!;
                final isID = name == 'id';
                p
                  ..name = name
                  ..named = true
                  ..type =
                      type.rebuild((t) => t.isNullable = t.isNullable! && !isID)
                  ..required = isID || field.type.isNonNull
                  ..toThis = false;
              }),
          ]);

        // Gather the parameters needed to construct the `_internal` call.
        final Map<String, Expression> params = {
          for (var field in node.fields)
            field.name.value: _assignmentFor(field),
        };
        ctor.body = refer(typeName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  Iterable<Method> get _instanceMethods sync* {
    // getInstanceType
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'getInstanceType'
        ..lambda = true
        ..returns = refer(modelTypeName)
        ..body = const Code('classType'),
    );

    // getId
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'getId'
        ..returns = refer('String')
        ..body = const Code('return id;'),
    );

    // equals
    yield Method(
      (m) => m
        ..name = 'equals'
        ..requiredParameters.add(
          Parameter((p) => p
            ..name = 'other'
            ..type = TypeReference((t) => t
              ..symbol = 'Object'
              ..isNullable = true)),
        )
        ..returns = refer('bool')
        ..body = const Code('return this == other;'),
    );

    // ==
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'operator =='
        ..returns = refer('bool')
        ..requiredParameters.add(
          Parameter((p) => p
            ..name = 'other'
            ..type = TypeReference((t) => t
              ..symbol = 'Object'
              ..isNullable = true)),
        )
        ..lambda = true
        ..body = Code('identical(this, other) || other is $typeName && ' +
            node.fields.map((field) {
              final name = field.name.value;
              return '$name == other.$name';
            }).join('&&')),
    );

    // hashCode
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'hashCode'
        ..returns = refer('int')
        ..type = MethodType.getter
        ..lambda = true
        ..body = const Code('toString().hashCode'),
    );

    // toString
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'toString'
        ..returns = refer('String')
        ..lambda = false
        ..body = Code('''
        final buffer = StringBuffer();

        buffer.write('$typeName {');
        ''' +
            node.fields.mapIndexed((index, field) {
              final name = field.name.value;
              if (index == node.fields.length - 1) {
                return "buffer.write('$name=\$$name');";
              }
              return "buffer.write('$name=\$$name, ');";
            }).join('\n') +
            '''
        buffer.write('}');

        return buffer.toString();
        '''),
    );

    // copyWith
    yield Method((m) {
      m
        ..name = 'copyWith'
        ..returns = refer(typeName)
        ..lambda = false
        ..optionalParameters.addAll([
          for (var field in node.fields)
            Parameter(
              (p) => p
                ..name = field.name.value
                ..required = false
                ..named = true
                ..type = field.type
                    .accept(TypeVisitor())!
                    .rebuild((t) => t.isNullable = true),
            )
        ]);

      final ctorParams = <String, Expression>{};
      for (var field in node.fields) {
        final name = field.name.value;
        ctorParams[name] = refer('$name ?? this.$name').expression;
      }
      m.body = refer(typeName).newInstance([], ctorParams).returned.statement;
    });

    // toJson
    yield Method((m) {
      m
        ..name = 'toJson'
        ..returns = mapOf('String', 'Object?')
        ..lambda = true
        ..body = literalMap({
          for (var field in node.fields) field.name.value: field.name.value,
        }).code;
    });
  }

  /// Generates a `ModelType` class for all model types which extends
  /// `ModelType` and provides the `ModelType.fromJson` implementation.
  void _buildModelType() {
    builder.body.add(Class((c) {
      c.name = modelTypeName;
      c.extend = AWSTypes.modelType(typeName).reference;
      c.constructors.add(Constructor((ctor) => ctor.constant = true));
      c.methods.add(Method(
        (m) => m
          ..annotations.add(
            refer('override').expression,
          )
          ..name = 'fromJson'
          ..requiredParameters.add(Parameter(
            (p) => p
              ..name = 'jsonData'
              ..type = mapOf('String', 'dynamic')
              ..named = false,
          ))
          ..returns = refer(typeName)
          ..body = Code('return $typeName.fromJson(jsonData);'),
      ));
    }));
  }
}
