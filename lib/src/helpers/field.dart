import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

extension FieldHelpers on FieldDefinitionNode {
  /// Whether this field represents the primary key, or ID field.
  bool get isID =>
      name.value == 'id' ||
      directives.any((directive) => directive.name.value == 'primaryKey');

  /// The re-cased Dart name (camelCase).
  String get dartName => ReCase(name.value).camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name.value;

  /// The non-throwing getter for this field.
  String get getter => isID ? dartName : '_$dartName';

  /// Whether this field represents a `hasMany` relationship.
  bool get isHasMany =>
      directives.any((directive) => directive.name.value == 'hasMany');

  /// Whether this field represents a `hasOne` relationship.
  bool get isHasOne =>
      directives.any((directive) => directive.name.value == 'hasOne');

  /// Whether this field represents a `belongsTo` relationship.
  bool get isBelongsTo =>
      directives.any((directive) => directive.name.value == 'belongsTo');

  // String modelFieldDefinitionType() {
  //   if (isHasMany) {
  //     return 'hasMany';
  //   }
  //   if (isHasOne) {
  //     return 'hasOne';
  //   }
  //   if (isBelongsTo) {
  //     return 'belongsTo';
  //   }
  //   if (isID) {
  //     return 'id';
  //   }
  // }
}
