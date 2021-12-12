import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:recase/recase.dart';

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
    return Library((l) => l
      ..name = 'models.model_provider'
      ..directives.addAll([
        Directive.import(datastoreUri),
        for (var model in models)
          Directive.import(model.name.snakeCase + '.dart'),
        for (var model in models)
          Directive.export(model.name.snakeCase + '.dart'),
        for (var enum$ in enums)
          Directive.export(enum$.name.value.snakeCase + '.dart'),
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

  Iterable<Field> get _fields sync* {}

  /// Generate a consistent hash for [schema].
  List<int> get _schemaHash {
    return sha1.convert(printNode(parseString(schema)).codeUnits).bytes;
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
          for (var model in models)
            refer(
              ReCase(model.name).pascalCase,
              ReCase(model.name).snakeCase + '.dart',
            ).property('schema')
        ]).code,
    );
  }
}
