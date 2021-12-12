import 'dart:io';

import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import 'golden_util.dart';

void main() {
  final schemaDir =
      Directory.fromUri(Directory.current.uri.resolve('test/schemas'));
  if (!schemaDir.existsSync()) {
    throw Exception('Could not find schemas directory');
  }

  group('Goldens', () {
    for (var entity in schemaDir.listSync()) {
      final schemaPath = entity.path;
      final schemaName = path.basenameWithoutExtension(schemaPath);
      test(schemaName, () {
        final schema = File(schemaPath).readAsStringSync();
        final generated = generateForSchema(schema);
        final goldens = loadGolden(schemaName);
        expect(generated.keys, unorderedEquals(goldens.keys));

        for (var entry in generated.entries) {
          final name = entry.key;
          final library = entry.value;
          final golden = goldens[name]!;
          expect(library, equalsIgnoringWhitespace(golden));
        }
      });
    }

    // V1 and V2 schemas should produce the same result if they are semantically
    // equal to each other.
    test('v1 -> v2', () {
      const habitrV1 = 'habitr_v1.graphql';
      const habitrV2 = 'habitr_v2.graphql';

      final habitrV1Schema =
          File.fromUri(schemaDir.uri.resolve(habitrV1)).readAsStringSync();
      final habitrV2Schema =
          File.fromUri(schemaDir.uri.resolve(habitrV2)).readAsStringSync();

      final habitrV1Generated = generateForSchema(habitrV1Schema);
      final habitrV2Generated = generateForSchema(habitrV2Schema);

      expect(habitrV1Generated.keys, unorderedEquals(habitrV2Generated.keys));

      for (var key in habitrV1Generated.keys) {
        final v1Library = habitrV1Generated[key]!;
        final v2Library = habitrV2Generated[key]!;

        expect(v1Library, equals(v2Library));
      }
    });
  });
}
