import 'dart:io';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generate.dart';
import 'package:amplify_codegen/src/options.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) {
  final options = parseCodegenOptions(args);
  final workingDir = Directory.current.uri;
  if (!Directory.fromUri(workingDir.resolve('amplify')).existsSync()) {
    stderr.writeln('No amplify folder found. Must run from project root.');
    exit(1);
  }
  final backendDir =
      Directory.fromUri(workingDir.resolve('amplify/backend/api'));
  if (!backendDir.existsSync()) {
    stderr.writeln('No APIs found for this project');
    exit(1);
  }
  final apiDirs = backendDir
      .listSync()
      .where((el) => el.statSync().type == FileSystemEntityType.directory);
  final schemaDir = apiDirs.firstWhereOrNull((dir) => Directory.fromUri(dir.uri)
      .listSync()
      .any((el) => path.basename(el.path) == 'schema.graphql'));
  if (schemaDir == null) {
    stderr.writeln('No GraphQL API found for this project');
    exit(1);
  }
  final schema =
      File.fromUri(schemaDir.uri.resolve('schema.graphql')).readAsStringSync();
  final generated = generateForSchema(schema);

  final modelsDir = workingDir.resolve('lib/models/');
  Directory.fromUri(modelsDir).createSync();

  generated.forEach((key, value) {
    final filename = key.substring('models.'.length) + '.dart';
    final filepath = modelsDir.resolve(filename);
    final output = File.fromUri(filepath);
    output.writeAsStringSync(value);
  });
  print('Successfully generated models');
}
