import 'package:build_cli_annotations/build_cli_annotations.dart';

part 'options.g.dart';

@CliOptions()
class CodegenOptions {
  CodegenOptions({
    this.useOld = false,
  });

  @CliOption(help: 'Uses the old build system.')
  final bool useOld;
}
