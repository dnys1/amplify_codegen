import 'dart:io';

import 'package:path/path.dart' as path;

Map<String, String> loadGolden(String schemaName) {
  // Load the golden file
  final dir = Directory.current.path;
  var goldenPath = 'goldens/lib/$schemaName';
  if (path.basename(dir) != 'test') {
    goldenPath = 'test/$goldenPath';
  }
  final goldenDir = Directory.current.uri.resolve(goldenPath);
  final files = Directory.fromUri(goldenDir).listSync();

  final output = <String, String>{};
  for (var file in files) {
    if (file.statSync().type == FileSystemEntityType.directory ||
        path.extension(file.path) != '.dart') {
      continue;
    }
    final filename = file.path;
    final name = path.basenameWithoutExtension(filename);
    final contents = File(filename).readAsStringSync();
    output['models.$name'] = contents;
  }
  return output;
}
