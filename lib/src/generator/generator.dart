import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

abstract class Generator<T> {
  T generate();
}

abstract class LibraryGenerator<T extends TypeDefinitionNode>
    extends Generator<Library?> {
  LibraryGenerator(this.node)
      : builder = LibraryBuilder()
          ..name = 'models.${node.name.value.snakeCase}'
          ..directives.addAll([
            Directive.import(datastoreUri),
            Directive.import('package:meta/meta.dart'),
          ]);

  final LibraryBuilder builder;
  final T node;

  String get typeName => wireName.pascalCase;

  String get wireName => node.name.value;
}
