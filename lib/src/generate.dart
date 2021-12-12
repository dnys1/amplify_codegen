import 'package:amplify_codegen/src/generator/visitors.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

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

// ignore_for_file: constant_identifier_names
''';

/// Generates a Dart file for each model type and enum in [schema].
///
/// Returns a map from the library name to its formatted definition file.
Map<String, String> generateForSchema(String schema) {
  final libraries = librariesForSchema(schema);
  final formatter = DartFormatter(fixes: StyleFix.all);
  return libraries.map((libraryName, library) {
    final emitter = DartEmitter(
      allocator: Allocator(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    return MapEntry(
      libraryName,
      formatter.format('$header\n${library.accept(emitter)}'),
    );
  });
}
