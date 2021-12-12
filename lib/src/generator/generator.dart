import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

abstract class Generator<T> {
  T generate();
}

abstract class LibraryGenerator<T extends TypeDefinitionNode>
    extends Generator<Library?> {
  LibraryGenerator(this.node)
      : builder = LibraryBuilder()
          ..name = 'models.${node.name.value.snakeCase}';

  final LibraryBuilder builder;
  final T node;

  String get typeName => wireName.pascalCase;

  String get wireName => node.name.value;
}
