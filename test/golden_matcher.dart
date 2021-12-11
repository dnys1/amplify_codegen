import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

const matchesGolden = _GoldenMatcher.new;

class _GoldenMatcher extends Matcher {
  const _GoldenMatcher(this.schemaName);

  final String schemaName;

  @override
  Description describe(Description description) {
    return description.add('Matches the generated golden file for $schemaName');
  }

  @override
  bool matches(Object? item, Map matchState) {
    if (item is! Map<String, String>) {
      return false;
    }
    // Load the golden file
    final dir = Directory.current.path;
    var goldenPath = 'goldens/lib/$schemaName';
    if (path.basename(dir) != 'test') {
      goldenPath = 'test/$goldenPath';
    }
    final goldenDir = Directory.current.uri.resolve(goldenPath);
    for (var entity in Directory.fromUri(goldenDir).listSync()) {
      final filename = entity.path;
      final name = path.basenameWithoutExtension(filename);
      final contents = File(filename).readAsStringSync();
      if (contents != item['models.$name']) {
        return false;
      }
    }
    return true;
  }
}
