import 'dart:io';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generate.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:gql/language.dart';

void main() {
  final schemaDir = Directory.fromUri(Platform.script.resolve('../schemas'));
  for (var entity in schemaDir.listSync()) {
    final file = File(entity.path);
    final schema = file.readAsStringSync();
    print(generateForSchema(schema));
  }
}
