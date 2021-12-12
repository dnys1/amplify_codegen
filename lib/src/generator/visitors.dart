import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

import 'model.dart';
import 'enum.dart';
import '../helpers/types.dart';

/// A visitor for top-level GraphQL definitions which produces a [Library] for
/// each one. Specifically, this targets object `type` definitions and `enum`
/// definitions.
class LibraryVisitor extends SimpleVisitor<Library> {
  LibraryVisitor(this.allModels);

  final List<Model> allModels;

  @override
  Library visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) {
    return EnumGenerator(node).generate();
  }

  @override
  Library? visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) {
    return ModelGenerator(node, allModels).generate();
  }
}

/// A visitor of GraphQL types which produces corresponding [TypeReference]
/// objects.
class TypeVisitor extends SimpleVisitor<TypeReference> {
  @override
  TypeReference visitListTypeNode(ListTypeNode node) {
    return TypeReference((t) {
      t.symbol = 'List';
      t.isNullable = !node.isNonNull;
      t.types.add(node.type.accept(this)!);
    });
  }

  @override
  TypeReference visitNamedTypeNode(NamedTypeNode node) {
    return AWSType.values
        .firstWhere((type) => node.name.value == type.name,
            orElse: () => AWSType.Model)
        .typeRef(node.name.value)
        .rebuild((t) => t.isNullable = !node.isNonNull);
  }
}
