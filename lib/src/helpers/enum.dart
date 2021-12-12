import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

extension EnumHelpers on EnumValueDefinitionNode {
  String get wireValue => name.value;

  String get dartName => wireValue.camelCase;
}
