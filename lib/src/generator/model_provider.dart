import 'dart:convert';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

class ModelProviderGenerator extends Generator<Library> {
  ModelProviderGenerator(this.schema);

  final String schema;
  late final List<Model> models = parseSchema(schema).values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));
  late final List<EnumTypeDefinitionNode> enums = parseString(schema)
      .definitions
      .whereType<EnumTypeDefinitionNode>()
      .toList();

  @override
  Library generate() {
    final exportFilenames = [
      for (var model in models) model.libraryName + '.dart',
      for (var enum$ in enums) enum$.libraryName + '.dart'
    ]..sort();
    return Library((l) => l
      ..name = 'models.model_provider'
      ..directives.addAll([
        ...exportFilenames.map(Directive.export),
      ])
      ..body.add(_class));
  }

  Class get _class {
    return Class(
      (c) => c
        ..name = 'ModelProvider'
        ..extend = refer('ModelProviderInterface', datastoreUri)
        ..fields.addAll(_fields)
        ..methods.addAll(_methods),
    );
  }

  Iterable<Field> get _fields sync* {
    yield Field(
      (f) => f
        ..static = true
        ..modifier = FieldModifier.final$
        ..name = 'instance'
        ..assignment =
            refer('ModelProvider', datastoreUri).newInstance([]).code,
    );
  }

  /// Generate a consistent hash for [schema]. This will be consistent across
  /// transformer version changes as well as semantic-only schema updates.
  List<int> get _schemaHash {
    return sha1.convert(jsonEncode(models).codeUnits).bytes;
  }

  Iterable<Method> get _methods sync* {
    // version
    final version = hex.encode(_schemaHash);
    yield Method(
      (m) => m
        ..annotations.add(refer('override'))
        ..name = 'version'
        ..returns = refer('String')
        ..type = MethodType.getter
        ..lambda = true
        ..body = literalString(version).code,
    );

    // modelSchemas
    yield Method(
      (m) => m
        ..annotations.add(refer('override'))
        ..name = 'modelSchemas'
        ..returns = listOf(refer('ModelSchema', datastoreUri))
        ..type = MethodType.getter
        ..lambda = true
        ..body = literalList([
          for (var model in models.where((m) => !m.isCustom))
            refer(
              model.className,
              model.libraryName + '.dart',
            ).property('schema')
        ]).code,
    );

    // customTypeSchemas
    yield Method(
      (m) => m
        ..annotations.add(refer('override'))
        ..name = 'customTypeSchemas'
        ..returns = listOf(refer('ModelSchema', datastoreUri))
        ..type = MethodType.getter
        ..lambda = true
        ..body = literalList([
          for (var model in models.where((m) => m.isCustom))
            refer(
              model.className,
              model.libraryName + '.dart',
            ).property('schema')
        ]).code,
    );

    // // getModelType
    // final modelTypeT = TypeReference((t) => t
    //   ..symbol = 'ModelType'
    //   ..url = datastoreUri
    //   ..types.add(refer('T')));
    // yield Method((m) {
    //   m
    //     ..annotations.add(refer('override'))
    //     ..returns = modelTypeT
    //     ..name = 'getModelType'
    //     ..types.add(refer('T')
    //         .typeRef
    //         .rebuild((t) => t.bound = refer('Model', datastoreUri)));

    //   m.body = Block.of([
    //     const Code('switch (T) {'),
    //     for (var model in models.where((m) => !m.isCustom)) ...[
    //       Code('case ${model.className}:'),
    //       refer(model.className)
    //           .property('classType')
    //           .asA(modelTypeT)
    //           .returned
    //           .statement,
    //     ],
    //     const Code('default:'),
    //     refer('ArgumentError')
    //         .newInstance([
    //           literalString(
    //               'Failed to find model in model provider for model type: \$T')
    //         ])
    //         .thrown
    //         .statement,
    //     const Code('}'),
    //   ]);
    // });

    // getModelTypeByModelName
    yield Method((m) {
      m
        ..annotations.add(refer('override'))
        ..returns = refer('ModelType', datastoreUri)
        ..name = 'getModelTypeByModelName'
        ..requiredParameters.add(Parameter((p) => p
          ..type = refer('String')
          ..name = 'modelName'));

      m.body = Block.of([
        const Code('switch (modelName) {'),
        for (var model in models.where((m) => !m.isCustom)) ...[
          Code("case '${model.name}':"),
          refer(model.className).property('classType').returned.statement,
        ],
        const Code('default:'),
        refer('ArgumentError')
            .newInstance([
              literalString(
                      'Failed to find model in model provider for model name: ')
                  .operatorAdd(refer('modelName'))
            ])
            .thrown
            .statement,
        const Code('}'),
      ]);
    });
  }
}
