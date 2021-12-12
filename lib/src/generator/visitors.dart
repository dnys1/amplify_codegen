import 'package:amplify_codegen/src/models/model.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

import 'enum.dart';
import 'model.dart';

/// A visitor for top-level GraphQL definitions which produces a [Library] for
/// each one. Specifically, this targets object `type` definitions and `enum`
/// definitions.
class LibraryVisitor extends SimpleVisitor<Library> {
  LibraryVisitor(this.allModels);

  final Map<String, Model> allModels;

  @override
  Library visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) {
    return EnumGenerator(node).generate();
  }

  @override
  Library? visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) {
    return ModelGenerator(node, allModels).generate();
  }
}
