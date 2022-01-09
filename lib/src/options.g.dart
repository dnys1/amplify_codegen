// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// CliGenerator
// **************************************************************************

CodegenOptions _$parseCodegenOptionsResult(ArgResults result) =>
    CodegenOptions(useOld: result['use-old'] as bool);

ArgParser _$populateCodegenOptionsParser(ArgParser parser) =>
    parser..addFlag('use-old', help: 'Uses the old build system.');

final _$parserForCodegenOptions = _$populateCodegenOptionsParser(ArgParser());

CodegenOptions parseCodegenOptions(List<String> args) {
  final result = _$parserForCodegenOptions.parse(args);
  return _$parseCodegenOptionsResult(result);
}
