import 'package:amplify_codegen/src/generator/model_provider.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:amplify_codegen/src/parse.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

import 'enum.dart';
import 'model.dart';

/// Generates all the code builder [Library] definitions for [schema].
Map<String, Library> librariesForSchema(String schema) {
  // Parse all models before starting
  final allModels = parseSchema(schema);

  // Generate libraries for model types and enums
  var libraries = parseString(schema)
      .definitions
      .map((definition) {
        return definition.accept(LibraryVisitor(allModels));
      })
      .whereType<Library>()
      .toList();

  // Create ModelProvider
  libraries.add(ModelProviderGenerator(schema).generate());

  return {
    for (var library in libraries) library.name!: library,
  };
}

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
