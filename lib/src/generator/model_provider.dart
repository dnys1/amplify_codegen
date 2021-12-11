import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/generator/types.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:code_builder/code_builder.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:recase/recase.dart';

class ModelProviderGenerator extends Generator<Library> {
  ModelProviderGenerator(this.schema);

  final String schema;
  late final List<Model> models = parseSchema(schema);

  @override
  Library generate() {
    return Library((l) => l
      ..name = 'models.model_provider'
      ..directives.addAll([
        Directive.import(datastoreUri),
        for (var model in models)
          Directive.import(ReCase(model.name).snakeCase + '.dart'),
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

  Iterable<Method> get _methods sync* {
    // version
    final version = hex.encode(sha1.convert(schema.codeUnits).bytes);
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
