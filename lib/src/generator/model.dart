import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/generator/types.dart';
import 'package:amplify_codegen/src/generator/visitors.dart';
import 'package:amplify_codegen/src/parse.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

import '../helpers/field.dart';

/// Generates libraries for model types. Generally, a library consists of two
/// classes: the Model class and the ModelType class.
class ModelGenerator extends LibraryGenerator<ObjectTypeDefinitionNode> {
  ModelGenerator(ObjectTypeDefinitionNode node, this.allModels) : super(node);

  final List<Model> allModels;
  late final Model model =
      allModels.singleWhere((model) => model.name == wireName);

  String get modelTypeName => '_${typeName}ModelType';

  @override
  Library generate() {
    builder.body.add(Class((c) {
      c.docs.add(
        '/** This is an auto generated class representing the $typeName '
        'type in your schema. */',
      );
      c.annotations.add(refer('immutable').expression);
      c.name = typeName;

      if (!model.isCustom) {
        c.extend = refer('Model', datastoreUri);
      }

      // Add `classType` for model types
      if (!model.isCustom) {
        c.fields.add(Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..type = refer(modelTypeName)
            ..name = 'classType'
            ..assignment = refer(modelTypeName).constInstance([]).code,
        ));
      }

      c.fields.addAll(_modelFields);
      c.methods.addAll(_instanceMethods);

      if (!model.isCustom) {
        c.methods.addAll(_modelMethods);
      }

      c.constructors.addAll([
        _unnamedConstructor,
        _internalConstructor,
        _fromJsonConstructor,
      ]);

      c.fields.add(_schemaField);
    }));

    if (!model.isCustom) {
      _buildModelType();
    }

    return builder.build();
  }

  /// Adds `final` fields to the class.
  Iterable<Field> get _modelFields sync* {
    for (var field in node.fields) {
      if (field.isID) {
        // Public final
        yield Field((f) {
          final description = field.description;
          if (description != null) {
            f.docs.add(description.value);
          }

          f
            ..name = field.dartName
            ..modifier = FieldModifier.final$
            ..type = field.type.reference;
        });
      } else {
        // Private nullable
        yield Field(
          (f) {
            f.name = '_${field.dartName}';
            f.type = field.type
                .accept(TypeVisitor())!
                .rebuild((t) => t.isNullable = true);
            f.modifier = FieldModifier.final$;
          },
        );
      }
    }
  }

  /// Unwraps [expr] in a block which throws for null values.
  Code _unwrap(Expression expr) {
    return Block.of([
      const Code('if ('),
      expr.equalTo(literalNull).code,
      const Code(') {'),
      refer('DataStoreException', datastoreUri)
          .constInstance(
            [
              refer('DataStoreExceptionMessages', datastoreUri)
                  .property('codeGenRequiredFieldForceCastExceptionMessage'),
            ],
            {
              'recoverySuggestion': refer(
                      'DataStoreExceptionMessages', datastoreUri)
                  .property('codeGenRequiredFieldForceCastRecoverySuggestion'),
            },
          )
          .thrown
          .statement,
      const Code('}'),
      expr.nullChecked.returned.statement,
    ]);
  }

  Iterable<Method> get _instanceMethods sync* {
    for (var field in node.fields.where((field) => !field.isID)) {
      // Public getter
      yield Method(
        (m) {
          final description = field.description?.value;
          if (description != null) {
            m.docs.add(description);
          }
          final name = field.dartName;
          m
            ..name = name
            ..returns = field.type.accept(TypeVisitor())
            ..lambda = !field.type.isNonNull
            ..type = MethodType.getter
            ..body = field.type.isNonNull
                ? _unwrap(refer('_$name'))
                : refer('_$name').code;
        },
      );
    }

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
              final getter = field.getter;
              return '$getter == other.$getter';
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
              final dartName = field.dartName;
              final getter = field.getter;
              if (index == node.fields.length - 1) {
                return "buffer.write('$dartName=\$$getter');";
              }
              return "buffer.write('$dartName=\$$getter, ');";
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
                ..name = field.dartName
                ..required = false
                ..named = true
                ..type = field.type
                    .accept(TypeVisitor())!
                    .rebuild((t) => t.isNullable = true),
            )
        ]);

      final ctorParams = <String, Expression>{};
      for (var field in node.fields) {
        final name = field.dartName;
        ctorParams[name] = refer(name).ifNullThen(refer('this').property(name));
      }
      m.body = refer(typeName).newInstance([], ctorParams).returned.statement;
    });

    // toJson
    yield Method((m) {
      if (!model.isCustom) {
        m.annotations.add(refer('override'));
      }
      m
        ..name = 'toJson'
        ..returns = mapOf('String', 'Object?')
        ..lambda = true;

      // Gather toJson fields
      final jsonObj = <String, Object?>{};
      for (var field in node.fields) {
        final jsonName = field.wireName;
        final getter = field.getter;
        final type = field.type;
        jsonObj[jsonName] = _serialize(getter, type);
      }

      m.body = literalMap(jsonObj).code;
    });
  }

  /// Model-specific fields, not valid for custom types.
  Iterable<Method> get _modelMethods sync* {
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
  }

  Constructor get _internalConstructor => Constructor((ctor) => ctor
    ..name = '_internal'
    ..constant = true
    ..optionalParameters.addAll([
      for (var field in node.fields)
        Parameter(
          (p) {
            final type = field.type.accept(TypeVisitor());
            final isID = field.isID;
            p
              ..name = field.dartName
              ..named = true
              ..type = isID ? null : type
              ..required = field.type.isNonNull
              ..toThis = isID;
          },
        ),
    ])
    ..initializers.addAll([
      for (var field in node.fields.where((field) => field.dartName != 'id'))
        Code('_${field.dartName} = ${field.dartName}'),
    ]));

  Expression _assignmentFor(FieldDefinitionNode field) {
    final name = field.dartName;
    if (field.isID) {
      return refer(name).ifNullThen(
        refer('UUID').property('getUUID').call([]),
      );
    }
    if (field.type.isList) {
      return refer('$name != null').conditional(
        refer('List').newInstanceNamed('unmodifiable', [refer(name)]),
        literalNull,
      );
    }
    return refer(name);
  }

  /// Creates the unnamed factory constructor.
  Constructor get _unnamedConstructor => Constructor((ctor) {
        ctor
          ..factory = true
          ..lambda = false
          ..optionalParameters.addAll([
            for (var field in node.fields)
              Parameter((p) {
                final name = field.dartName;
                final type = field.type.accept(TypeVisitor())!.rebuild(
                    (t) => t.isNullable = !field.type.isNonNull || field.isID);
                p
                  ..name = name
                  ..named = true
                  ..type = type
                  ..required = !type.isNullable!;
              }),
          ]);

        // Gather the parameters needed to construct the `_internal` call.
        final Map<String, Expression> params = {
          for (var field in node.fields) field.dartName: _assignmentFor(field),
        };
        ctor.body = refer(typeName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  Constructor get _fromJsonConstructor => Constructor((ctor) {
        ctor
          ..name = 'fromJson'
          ..factory = true
          ..lambda = false
          ..requiredParameters.add(Parameter((p) {
            p
              ..name = 'json'
              ..type = mapOf('String', 'Object?');
          }));

        // Gather fromJson fields
        final Map<String, Expression> params = {};
        for (var field in node.fields) {
          final name = field.dartName;
          final jsonName = field.wireName;
          final jsonProp = refer('json').index(literalString(jsonName));
          params[name] = _deserialize(jsonProp, field.type);
        }
        ctor.body = refer(typeName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  /// Generates the expression to serialize [node] to JSON.
  Expression _serialize(String name, TypeNode type) {
    if (type.isList) {
      final reference = refer(name);
      final closure = Method(
        (m) => m
          ..requiredParameters.add(Parameter((p) => p..name = 'el'))
          ..body = _serialize('el', type.asList.type).code,
      ).closure;
      if (type.isNonNull) {
        return reference
            .property('map')
            .call([
              closure,
            ])
            .property('toList')
            .call([]);
      } else {
        return reference
            .nullSafeProperty('map')
            .call([
              closure,
            ])
            .nullSafeProperty('toList')
            .call([]);
      }
    } else if (type.isModel) {
      return type.isNonNull
          ? refer(name).property('toJson').call([])
          : refer(name).nullSafeProperty('toJson').call([]);
    } else {
      return refer(name);
    }
  }

  /// Generates the expression to deserialize [node] from JSON.
  Expression _deserialize(Expression ref, TypeNode type) {
    if (type.isList) {
      final list = ref.asA(TypeReference((t) => t
        ..symbol = 'List'
        ..isNullable = !type.isNonNull));
      final castArgs = type.isModel ? [refer('Map')] : [refer(type.typeName)];
      final newInst = Method(
        (m) => m
          ..lambda = true
          ..requiredParameters.add(Parameter((p) => p..name = 'el'))
          ..body = _deserialize(refer('el'), type.asList.type).code,
      ).closure;
      if (type.isNonNull) {
        return list
            .property('cast')
            .call([], {}, castArgs)
            .property('map')
            .call([newInst]);
      } else {
        return list
            .nullSafeProperty('cast')
            .call([], {}, castArgs)
            .nullSafeProperty('map')
            .call([newInst]);
      }
    } else if (type.isModel) {
      final newInst = refer(type.typeName).newInstanceNamed('fromJson', [ref]);
      return type.isNonNull
          ? newInst
          : ref.notEqualTo(literalNull).conditional(newInst, literalNull);
    } else {
      return ref.asA(type.reference);
    }
  }

  Field get _schemaField {
    // Build schema definition
    final schemaDefinition = Method((m) {
      m.requiredParameters.add(Parameter((p) => p
        ..name = 'modelSchemaDefinition'
        ..type = refer('ModelSchemaDefinition', datastoreUri)));
      final def = refer('modelSchemaDefinition');

      Code _schemaDefinitionField(FieldDefinitionNode field) {
        final modelFieldType = field.type.modelFieldType(
          isCustom: model.isCustom,
          models: allModels,
        );
        // final modelField =
        // model.fields.singleWhere((f) => field.wireName == f.name);
        Expression fieldDefinition = refer('');
        if (model.isCustom) {
          fieldDefinition = refer('ModelFieldDefinition')
              .property('customTypeField')
              .call([], {
            'fieldName': literalString(field.wireName),
            'isRequired': literalBool(field.type.isNonNull),
            'ofType': refer('ModelFieldType').constInstance([
              refer('ModelFieldTypeEnum').property(modelFieldType.name),
            ]),
          });
        }
        return def.property('addField').call([fieldDefinition]).statement;
      }

      m.body = Block.of([
        // Name + plural name
        def.property('name').assign(literalString(node.name.value)).statement,
        def
            .property('pluralName')
            .assign(literalString(node.name.value + 's'))
            .statement,

        // Fields
        for (var field in node.fields) _schemaDefinitionField(field),
      ]);
    });
    return Field((f) {
      f
        ..name = 'schema'
        ..static = true
        ..modifier = FieldModifier.final$
        ..assignment =
            refer('Model', datastoreUri).property('defineSchema').call([], {
          'define': schemaDefinition.closure,
        }).code;
    });
  }

  /// Generates a `ModelType` class for all model types which extends
  /// `ModelType` and provides the `ModelType.fromJson` implementation.
  void _buildModelType() {
    builder.body.add(Class((c) {
      c.name = modelTypeName;
      c.extend = TypeReference(
        (t) => t
          ..symbol = 'ModelType'
          ..types.add(refer(typeName))
          ..url = datastoreUri,
      );
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
              ..type = mapOf('String', 'Object?')
              ..named = false,
          ))
          ..returns = refer(typeName)
          ..body = Code('return $typeName.fromJson(jsonData);'),
      ));
    }));
  }
}

enum ModelFieldType {
  string,
  int,
  double,
  date,
  dateTime,
  time,
  timestamp,
  bool,
  // below types use ofModelName
  enumeration,
  model,
  collection,
  // below types use ofCustomTypeName
  embedded,
  embeddedCollection,
}
