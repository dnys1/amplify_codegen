import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

abstract class Generator<T> {
  T generate();
}

abstract class LibraryGenerator<T extends TypeDefinitionNode>
    extends Generator<Library> {
  LibraryGenerator(this.node)
      : builder = LibraryBuilder()..name = ReCase(node.name.value).snakeCase;

  final LibraryBuilder builder;
  final T node;

  String get typeName => ReCase(node.name.value).pascalCase;
}
