import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/model.dart';
import 'package:amplify_codegen/src/helpers/language.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

import 'node.dart';

/// Returns the query field name for [fieldName].
String queryFieldName(String fieldName) => (fieldName + '\$').camelCase;

extension ModelFieldHelpers on ModelField {
  /// The Dart identifier for this field.
  String get dartName {
    final fieldName = name.camelCase;
    if (softReservedWords.contains(fieldName) ||
        hardReservedWords.contains(fieldName)) {
      return '$fieldName\$';
    }
    return fieldName;
  }

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

extension ModelFieldTypes on ModelField {
  TypeReference get typeReference => type.typeReference;

  ModelFieldType modelFieldType({
    required bool isCustom,
    required Map<String, Model> models,
  }) =>
      type.modelFieldType(isCustom: isCustom, models: models);
}

extension FieldHelpers on FieldDefinitionNode {
  /// Whether this field represents the primary key, or ID field.
  bool get isPrimaryKey =>
      (name.value == 'id' && type.graphqlType == GraphQLType.TYPE_ID) ||
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
    return (isV1 ? directiveNamed('connection') : directiveNamed('index'))
        ?.argumentNamed('name')
        ?.stringValue;
  }

  /// The name of the connection `keyName` (V1) or `indexName` (V2) property,
  /// if any.
  String? get indexName {
    if (!hasRelationship) {
      return null;
    }
    return relationshipDirective?.arguments
        .singleWhereOrNull((arg) =>
            arg.name.value == 'keyName' || arg.name.value == 'indexName')
        ?.stringValue;
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
      // v1 (cannot determine)
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
      final rule = AuthRule();
      for (var field in ruleValue.fields) {
        final node = field.value;
        switch (field.name.value) {
          case 'allow':
            rule.allow = AuthStrategyX.valueOf(
              node.stringValue,
              orElse: () => throw StateError(
                  'No strategy for ALLOW_${node.stringValue.constantCase}'),
            );
            break;
          case 'provider':
            rule.provider = AuthProviderX.valueOf(
              node.stringValue,
              orElse: () => throw StateError(
                  'No provider for BY_${node.stringValue.constantCase}'),
            );
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
            rule.operations.addAll(
              node.listValue.map(
                (value) => ModelOperationX.valueOf(value,
                    orElse: () => throw StateError(
                        'No operation for OP_${value.constantCase}')),
              ),
            );
            break;
          default:
            throw StateError('Unknown key: ${field.name.value}');
        }
      }

      // Set default values for missing attributes.
      if (!rule.hasProvider()) {
        rule.provider = rule.allow.defaultProvider;
      }
      if (rule.operations.isEmpty) {
        rule.operations.addAll(ModelOperationX.values);
      }

      switch (rule.allow) {
        case AuthStrategy.ALLOW_GROUPS:
          if (!rule.hasGroupClaim()) {
            rule.groupClaim = 'cognito:groups';
          }
          if (rule.groups.isNotEmpty && rule.hasGroupsField()) {
            throw ArgumentError.value(
              rule.groups,
              'Groups',
              'cannot use both static and dynamic group authorization',
            );
          }
          if (!rule.hasGroupsField()) {
            rule.groupsField = 'groups';
          }
          break;
        case AuthStrategy.ALLOW_OWNER:
          if (!rule.hasOwnerField()) {
            rule.ownerField = 'owner';
          }
          if (!rule.hasIdentityClaim()) {
            rule.identityClaim = 'cognito:username';
          }
          break;
        case AuthStrategy.ALLOW_PRIVATE:
        case AuthStrategy.ALLOW_PUBLIC:
        case AuthStrategy.ALLOW_CUSTOM:
        case AuthStrategy.ALLOW_UNSPECIFIED:
          break;
      }

      yield rule;
    }
  }
}
