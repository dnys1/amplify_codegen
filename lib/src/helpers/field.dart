import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

import 'node.dart';

/// Returns the query field name for [fieldName].
String queryFieldName(String fieldName) => fieldName.camelCase + '\$';

extension ModelFieldHelpers on ModelField {
  /// The Dart identifier for this field.
  String get dartName => name.camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name;

  /// The non-throwing getter for this field.
  String get getter => isPrimaryKey ? dartName : '_$dartName';
}

extension ArgumentHelpers on ArgumentNode {
  /// Returns the argument's value as a string.
  String get stringValue => (value as StringValueNode).value;

  /// Returns the argument's value as a list of strings.
  List<String> get stringListValue => (value as ListValueNode)
      .values
      .cast<StringValueNode>()
      .map((el) => el.value)
      .toList();
}

extension DirectiveHelpers on DirectiveNode {
  /// Whether the argument named [argumentName] is defined.
  bool hasArgument(String argumentName) =>
      arguments.any((arg) => arg.name.value == argumentName);

  /// Gets the argument named [argumentName], if present.
  ArgumentNode? argumentNamed(String argumentName) =>
      arguments.firstWhereOrNull((arg) => arg.name.value == argumentName);
}

extension FieldHelpers on FieldDefinitionNode {
  /// Whether this field represents the primary key, or ID field.
  bool get isPrimaryKey =>
      (name.value == 'id' && type.awsType == AWSType.ID) ||
      directives.any((directive) => directive.name.value == 'primaryKey');

  /// Whether this field has a directive named [directiveName].
  bool hasDirective(String directiveName) =>
      directives.any((directive) => directive.name.value == directiveName);

  /// Locates the directive named [directiveName], if present.
  DirectiveNode? directiveNamed(String directiveName) => directives
      .firstWhereOrNull((directive) => directive.name.value == directiveName);

  /// Whether this field has a foreign relationship.
  bool get hasRelationship =>
      hasDirective('connection') ||
      hasDirective('hasOne') ||
      hasDirective('belongsTo') ||
      hasDirective('hasMany');

  /// Whether this is a Transformer V1 field.
  bool get isV1 => hasDirective('connection');

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

  /// The name of the connection, if any.
  String? get connectionName {
    if (!hasRelationship) {
      return null;
    }
    return ((isV1 ? directiveNamed('connection') : directiveNamed('index'))
            ?.arguments
            .singleWhereOrNull((arg) => arg.name.value == 'name')
            ?.value as StringValueNode?)
        ?.value;
  }

  /// The name of the connection `keyName` (V1) or `indexName` (V2) property,
  /// if any.
  String? get indexName {
    if (!hasRelationship) {
      return null;
    }
    return (relationshipDirective?.arguments
            .singleWhereOrNull((arg) =>
                arg.name.value == 'keyName' || arg.name.value == 'indexName')
            ?.value as StringValueNode?)
        ?.value;
  }

  /// The value of the connection `fields` property, if any.
  List<String>? get connectionFields {
    if (!hasRelationship) {
      return null;
    }
    return relationshipDirective!.argumentNamed('fields')?.stringListValue;
  }

  /// Whether this field represents a `hasMany` relationship.
  bool get isHasMany =>
      // v2
      hasDirective('hasMany') ||
      // v1
      false;

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

  /// The re-cased Dart name (camelCase).
  String get dartName => ReCase(name.value).camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name.value;

  /// The non-throwing getter for this field.
  String get getter => isPrimaryKey ? dartName : '_$dartName';
}

extension AuthRules on List<DirectiveNode> {
  DirectiveNode? get authRuleDirective {
    return firstWhereOrNull((node) => node.name.value == 'auth');
  }

  Iterable<AuthRule> get authRules sync* {
    final directive = authRuleDirective;
    if (directive == null) {
      return;
    }
    final rulesArg = directive.arguments.single.value as ListValueNode;
    final ruleValues = rulesArg.values.cast<ObjectValueNode>();
    for (var ruleValue in ruleValues) {
      final rule = AuthRuleBuilder();
      for (var field in ruleValue.fields) {
        final node = field.value;
        switch (field.name.value) {
          case 'allow':
            rule.allow = AuthStrategy.deserialize(node.stringValue)!;
            break;
          case 'provider':
            rule.provider = AuthProvider.deserialize(node.stringValue)!;
            break;
          case 'ownerField':
            rule.ownerField = node.stringValue;
            break;
          case 'identityClaim':
            rule.identityClaim = node.stringValue;
            break;
          case 'groupClaim':
            rule.groupClaim = node.stringValue;
            break;
          case 'groups':
            rule.groups.addAll(node.listValue);
            break;
          case 'groupsField':
            rule.groupsField = node.stringValue;
            break;
          case 'operations':
            rule.operations.addAll(node.listValue
                .map(ModelOperation.deserialize)
                .whereType<ModelOperation>());
            break;
          default:
            throw StateError('Unknown key: ${field.name.value}');
        }
      }
      yield rule.build();
    }
  }
}
