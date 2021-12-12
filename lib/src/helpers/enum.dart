import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:gql/ast.dart';

extension EnumHelpers on EnumValueDefinitionNode {
  String get wireValue => name.value;

  String get dartName => wireValue.camelCase;
}
