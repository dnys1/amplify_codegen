import 'package:amplify_codegen/src/generator/class.dart';
import 'package:amplify_codegen/src/generator/enum.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

import 'types.dart';

const header = '''
/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';
''';

/// Generates a Dart file for each type and enum in [schema].
///
/// Returns a map from the type name to its formatted definition file.
Map<String, String> generateForSchema(String schema) {
  final libraries = parseString(schema).definitions.map((definition) {
    return definition.accept(LibraryVisitor());
  }).whereType<Library>();
  final emitter = DartEmitter(useNullSafetySyntax: true);
  return {
    for (var library in libraries)
      library.name!: DartFormatter(fixes: StyleFix.all)
          .format('${library.accept(emitter)}'),
  };
}

/// A visitor for top-level GraphQL definitions which produces a [Library] for
/// each one. Specifically, this targets object `type` definitions and `enum`
/// definitions.
class LibraryVisitor extends SimpleVisitor<Library> {
  @override
  Library visitEnumTypeDefinitionNode(EnumTypeDefinitionNode node) {
    return EnumGenerator(node).generate();
  }

  @override
  Library visitObjectTypeDefinitionNode(ObjectTypeDefinitionNode node) {
    return ModelTypeGenerator(node).generate();
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
    return AWSTypes.parse(node.name.value)
        .reference
        .rebuild((t) => t.isNullable = !node.isNonNull);
  }
}
