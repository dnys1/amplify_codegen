import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

/// A general purpose generator.
abstract class Generator<T> {
  T generate();
}

/// A generator for [Library] definitions.
abstract class LibraryGenerator<T extends TypeDefinitionNode>
    extends Generator<Library?> {
  LibraryGenerator(this.node)
      : builder = LibraryBuilder()..name = 'models.${node.libraryName}';

  final LibraryBuilder builder;
  final T node;

  String get wireName => node.name.value;
}
