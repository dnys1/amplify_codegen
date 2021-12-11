import 'dart:io';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import 'golden_matcher.dart';

void main() {
  final schemaDir = Directory.current.uri.resolve('test/schemas');
  group('Goldens', () {
    for (var entity in Directory.fromUri(schemaDir).listSync()) {
      final schemaPath = entity.path;
      final schemaName = path.basenameWithoutExtension(schemaPath);
      test(schemaName, () {
        final schema = File(schemaPath).readAsStringSync();
        final generated = generateForSchema(schema);
        expect(generated, matchesGolden(schemaName));
      });
    }
  });
}
