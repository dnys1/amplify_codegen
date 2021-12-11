import 'dart:io';

import 'package:amplify_codegen/src/generate.dart';
import 'package:path/path.dart' as path;

void main() {
  final schemaDir = Directory.fromUri(
    Platform.script.resolve('../test/schemas'),
  );
  for (var entity in schemaDir.listSync()) {
    final schema = File(entity.path).readAsStringSync();
    final schemaName = path.basenameWithoutExtension(entity.path);
    final generated = generateForSchema(schema);
    final outputDir = Directory.fromUri(
      Platform.script.resolve('../test/goldens/lib/$schemaName'),
    )..createSync();
    for (var entry in generated.entries) {
      final filename = entry.key.split('.').last + '.dart';
      final file = File.fromUri(outputDir.uri.resolve(filename));
      file.writeAsStringSync(entry.value);
    }
  }
}
