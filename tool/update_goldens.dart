import 'dart:convert';
import 'dart:io';

import 'package:amplify_codegen/src/generate.dart';
import 'package:amplify_codegen/src/parse.dart';
import 'package:path/path.dart' as path;

void main() {
  final schemaDir = Directory.fromUri(
    Platform.script.resolve('../test/schemas'),
  );
  for (var entity in schemaDir.listSync()) {
    final schema = File(entity.path).readAsStringSync();
    final schemaName = path.basenameWithoutExtension(entity.path);
    print('Parsing schema for $schemaName');
    final schemaMap = parseSchema(schema);
    print('Generating models for $schemaName');
    final generated = generateForSchema(schema);
    final outputDir = Directory.fromUri(
      Platform.script.resolve('../test/goldens/lib/$schemaName'),
    )..createSync();
    for (var entry in generated.entries) {
      final filename = entry.key.split('.').last + '.dart';
      print('-- Generated $filename');
      final file = File.fromUri(outputDir.uri.resolve(filename));
      file.writeAsStringSync(entry.value);
    }

    // Write schema JSON to assets
    final schemaFile = File.fromUri(outputDir.uri.resolve('schema.json'));
    const encoder = JsonEncoder.withIndent('  ');
    final schemaJson = schemaMap.map((name, model) {
      return MapEntry(name, model.toProto3Json());
    });
    schemaFile.writeAsStringSync(encoder.convert(schemaJson));
    print('-- Wrote schema to schema.json');
  }
}
