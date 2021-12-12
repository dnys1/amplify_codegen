import 'dart:io';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generate.dart';

void main() {
  final schemaDir = Directory.fromUri(Platform.script.resolve('../schemas'));
  for (var entity in schemaDir.listSync()) {
    final file = File(entity.path);
    final schema = file.readAsStringSync();
    print(generateForSchema(schema));
  }
}
