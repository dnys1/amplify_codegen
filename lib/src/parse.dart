import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:amplify_codegen/src/models/auth_rule.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

/// Parses [schema] into a list of [Model] objects.
List<Model> parseSchema(String schema) {
  final doc = parseString(schema);
  final models = <Model>[];
  for (var definition in doc.definitions) {
    final isModel = definition is ObjectTypeDefinitionNode &&
        !const ['Query', 'Mutation', 'Subscription']
            .contains(definition.name.value);
    if (!isModel) {
      continue;
    }
    final isCustom = definition.directives
        .every((directive) => directive.name.value != 'model');
    final model = Model((b) {
      final authRules = definition.directives.authRules;
      final v1PrimaryKey = ((definition.directives
                  .firstWhereOrNull((directive) {
                    return directive.name.value == 'key' &&
                        directive.arguments
                            .every((arg) => arg.name.value != 'name');
                  })
                  ?.arguments
                  .singleWhere((arg) => arg.name.value == 'fields')
                  .value as ListValueNode?)
              ?.values
              .first as StringValueNode?)
          ?.value;
      b
        ..name = definition.name.value
        ..authRules.addAll(authRules)
        ..fields.addAll(definition.modelFields(
            primaryKey: v1PrimaryKey, isCustom: isCustom))
        ..isCustom = isCustom;

      // Inject ID field, if unspecified
      if (b.fields.build().every((f) => !f.metadata.isPrimaryKey)) {
        b.fields.add(ModelField((f) {
          f
            ..name = 'id'
            ..required = true
            ..readOnly = false
            ..metadata.isPrimaryKey = true
            ..metadata.isList = false
            ..metadata.type = AWSType.ID;
        }));
      }
    });
    models.add(model);
  }

  // Second pass to establish hasMany/hasOne/belongsTo relationships
  for (var definition in doc.definitions) {
    final isModel = definition is ObjectTypeDefinitionNode;
    if (!isModel) {
      continue;
    }
    final isCustom = definition.directives
        .every((directive) => directive.name.value != 'model');
    if (isCustom) {
      continue;
    }
    final nodeFields = definition.fields;
    final model =
        models.singleWhere((model) => model.name == definition.name.value);
    models.remove(model);
    final updatedModel = model.rebuild((m) {
      final oldFields = m.fields.build();
      m.fields.clear();
      for (var field in oldFields) {
        m.fields.add(field.rebuild((field) {
          final nodeField =
              nodeFields.singleWhereOrNull((f) => f.wireName == field.name);
          if (nodeField == null || !nodeField.hasRelationship) {
            field.metadata
              ..isBelongsTo = false
              ..isHasMany = false
              ..isHasOne = false;
            return;
          }

          // Get the field name of the current model field.
          final relationFieldName = nodeField.relationshipField;

          // Get the model referred to by this relationship.
          final relationModel =
              models.singleWhere((m) => m.name == nodeField.type.typeName);

          // Get the foreign field of the relationship.
          final foreignModelField = relationModel.fields.firstWhereOrNull((f) {
            return f.metadata.modelName == m.name;
          });

          // For hasOne relationships, use the ID field as the associated field.
          final foreignIdField =
              relationModel.fields.singleWhere((f) => f.metadata.isPrimaryKey);

          // One-way relationship
          final isHasOne =
              foreignModelField == null && relationFieldName != null;
          if (isHasOne) {
            field.metadata
              ..isBelongsTo = false
              ..isHasMany = false
              ..isHasOne = true;
            field.metadata
              ..associatedType = relationModel.name
              ..associatedName = foreignModelField?.name ?? foreignIdField.name;
            return;
          }

          final isBelongsTo = foreignModelField == null ||
              foreignModelField.metadata.isList && !field.metadata.isList!;
          if (isBelongsTo) {
            // belongsTo
            field.metadata
              ..isBelongsTo = true
              ..isHasMany = false
              ..isHasOne = false;
            field.metadata.targetName = relationFieldName ?? 'id';
          } else {
            // hasMany
            field.metadata
              ..isBelongsTo = false
              ..isHasMany = true
              ..isHasOne = false;
            field.metadata
              ..associatedType = relationModel.name
              ..associatedName = foreignModelField.name;
          }
        }));
      }
    });
    models.add(updatedModel);
  }

  return models;
}

extension ModelFields on ObjectTypeDefinitionNode {
  /// Returns whether `this` is a [Model].
  bool get isModel =>
      directives.any((directive) => directive.name.value == 'model');

  /// Returns all fields as [ModelField] objects.
  Iterable<ModelField> modelFields({
    required String? primaryKey,
    required bool isCustom,
  }) sync* {
    for (var field in fields) {
      yield ModelField(
        (f) {
          f
            ..name = field.name.value
            ..required = field.type.isNonNull
            ..readOnly = false
            ..authRules.addAll(field.directives.authRules);

          _buildTypeFor(f.metadata, field.type);

          final isPrimaryKey =
              field.wireName == primaryKey || field.isPrimaryKey;
          if (isPrimaryKey) {
            primaryKey ??= field.wireName;
          }
          f.metadata
            ..isPrimaryKey = isPrimaryKey
            ..isBelongsTo = field.isBelongsTo
            ..isHasOne = field.isHasOne
            ..isHasMany = field.isHasMany;

          if (field.isBelongsTo) {
            f.metadata.targetName = f.metadata.modelName;
          }
          if (field.isHasOne || field.isHasMany) {
            f.metadata
              ..associatedName = ''
              ..associatedType = f.metadata.modelName;
          }
        },
      );
    }

    if (!isCustom) {
      // createdAt
      yield ModelField(
        (f) => f
          ..name = 'createdAt'
          ..required = false
          ..readOnly = true
          ..metadata.isList = false
          ..metadata.type = AWSType.AWSDateTime,
      );

      // updatedAt
      yield ModelField(
        (f) => f
          ..name = 'updatedAt'
          ..required = false
          ..readOnly = true
          ..metadata.isList = false
          ..metadata.type = AWSType.AWSDateTime,
      );
    }
  }
}

void _buildTypeFor(ModelFieldMetadataBuilder builder, TypeNode node) {
  if (node is NamedTypeNode) {
    builder.isList ??= false;
    builder.type = AWSType.values.firstWhere(
      (el) => el.name == node.name.value,
      orElse: () {
        builder.modelName = node.name.value;
        return AWSType.Model;
      },
    );
    return;
  } else if (node is ListTypeNode) {
    builder.isList ??= true;
    _buildTypeFor(builder, node.type);
    return;
  }
  throw ArgumentError(node.runtimeType);
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
            rule.allow = AuthStrategy.deserialize(_valueOf(node))!;
            break;
          case 'provider':
            rule.provider = AuthProvider.deserialize(_valueOf(node))!;
            break;
          case 'ownerField':
            rule.ownerField = _valueOf(node);
            break;
          case 'identityClaim':
            rule.identityClaim = _valueOf(node);
            break;
          case 'groupClaim':
            rule.groupClaim = _valueOf(node);
            break;
          case 'groups':
            rule.groups.addAll(_listValueOf(node));
            break;
          case 'groupsField':
            rule.groupsField = _valueOf(node);
            break;
          case 'operations':
            rule.operations.addAll((node as ListValueNode).values.map((node) {
              return ModelOperation.deserialize(_valueOf(node))!;
            }));
            break;
          default:
            throw StateError('Unknown key: ${field.name.value}');
        }
        yield rule.build();
      }
    }
  }
}

String _valueOf(ValueNode node) {
  if (node is EnumValueNode) {
    return node.name.value;
  } else if (node is StringValueNode) {
    return node.value;
  }
  throw ArgumentError(node.runtimeType);
}

List<String> _listValueOf(ValueNode node) {
  if (node is! ListValueNode) {
    throw ArgumentError(node.runtimeType);
  }
  return node.values.map(_valueOf).toList();
}
