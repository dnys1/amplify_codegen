import 'dart:convert';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

class ModelProviderGenerator extends Generator<Library> {
  ModelProviderGenerator(this.schema);

  final String schema;
  late final List<Model> models = parseSchema(schema);
  late final List<EnumTypeDefinitionNode> enums = parseString(schema)
      .definitions
      .whereType<EnumTypeDefinitionNode>()
      .toList();

  @override
  Library generate() {
    final importFilenames = [
      for (var model in models) model.name.snakeCase + '.dart'
    ]..sort();
    final exportFilenames = [
      for (var model in models) model.name.snakeCase + '.dart',
      for (var enum$ in enums) enum$.name.value.snakeCase + '.dart'
    ]..sort();
    return Library((l) => l
      ..name = 'models.model_provider'
      ..directives.addAll([
        Directive.import(datastoreUri),
        ...importFilenames.map(Directive.import),
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
        ..assignment = refer('ModelProvider').newInstance([]).code,
    );
  }

  /// Generate a consistent hash for [schema]. This will be consistent across
  /// transformer version changes as well as semantic-only schema updates.
  List<int> get _schemaHash {
    final models = this.models..sort((a, b) => a.name.compareTo(b.name));
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
              model.name.pascalCase,
              model.name.snakeCase + '.dart',
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
              model.name.pascalCase,
              model.name.snakeCase + '.dart',
            ).property('schema')
        ]).code,
    );

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
          refer(model.name.pascalCase).property('classType').returned.statement,
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
