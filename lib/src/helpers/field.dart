import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

extension ModelFieldHelpers on ModelField {
  /// The Dart identifier for this field.
  String get dartName => name.camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name;

  /// The non-throwing getter for this field.
  String get getter => isPrimaryKey ? dartName : '_$dartName';
}

extension FieldHelpers on FieldDefinitionNode {
  /// Whether this field represents the primary key, or ID field.
  bool get isPrimaryKey =>
      (name.value == 'id' && type.awsType == AWSType.ID) ||
      directives.any((directive) => directive.name.value == 'primaryKey');

  /// Whether this field has a directive named [directiveName].
  bool hasDirective(String directiveName) =>
      directives.any((directive) => directive.name.value == directiveName);

  /// Whether this field has a foreign relationship.
  bool get hasRelationship =>
      hasDirective('connection') ||
      hasDirective('hasOne') ||
      hasDirective('belongsTo') ||
      hasDirective('hasMany');

  /// The foreign relationship directive, if any.
  DirectiveNode? get relationshipDirective {
    if (!hasRelationship) {
      return null;
    }
    return directives.singleWhere((directive) =>
        directive.name.value == 'connection' ||
        directive.name.value == 'hasOne' ||
        directive.name.value == 'belongsTo' ||
        directive.name.value == 'hasMany');
  }

  //// The local field for the foreign relationship, if any.
  String? get relationshipField {
    if (!hasRelationship) {
      return null;
    }
    return ((relationshipDirective!.arguments
                .singleWhereOrNull((arg) => arg.name.value == 'fields')
                ?.value as ListValueNode?)
            ?.values
            .single as StringValueNode?)
        ?.value;
  }

  /// The re-cased Dart name (camelCase).
  String get dartName => ReCase(name.value).camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name.value;

  /// The non-throwing getter for this field.
  String get getter => isPrimaryKey ? dartName : '_$dartName';

  /// Whether this field represents a `hasMany` relationship.
  bool get isHasMany =>
      // v2
      hasDirective('hasMany') ||
      // v1
      (hasDirective('connection') && type.isList);

  /// Whether this field represents a `hasOne` relationship.
  bool get isHasOne =>
      // v2
      hasDirective('hasOne') ||
      // v1 (cannot determine)
      false;

  /// Whether this field represents a `belongsTo` relationship.
  bool get isBelongsTo =>
      // v2
      hasDirective('belongsTo') ||
      // v1 (cannot determine)
      false;
}
