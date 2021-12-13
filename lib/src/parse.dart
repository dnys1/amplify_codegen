import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:amplify_codegen/src/helpers/model.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:amplify_codegen/src/parser/connection.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

late Map<String, ObjectTypeDefinitionNode> _models;

/// Parses [schema] into a list of [Model] objects.
Map<String, Model> parseSchema(String schema) {
  const rootTypes = ['Query', 'Mutation', 'Subscription'];
  final doc = parseString(schema);
  final models = <String, Model>{};

  _models = Map.fromEntries(
    doc.definitions
        .where((definition) =>
            definition is ObjectTypeDefinitionNode &&
            !rootTypes.contains(definition.name.value))
        .map((el) => MapEntry((el as ObjectTypeDefinitionNode).name.value, el)),
  );

  for (var modelDefinition in _models.values) {
    final isCustom = modelDefinition.isCustom;
    final model = Model((b) {
      final authRules = modelDefinition.directives.authRules;
      final primaryKey = modelDefinition.primaryKeyField;
      b
        ..name = modelDefinition.name.value
        ..authRules.addAll(authRules)
        ..fields.addAll(modelDefinition.modelFields(
          primaryKey: primaryKey,
          isCustom: isCustom,
          models: _models,
        )..sorted((a, b) {
            if (a.isPrimaryKey) return -1;
            if (b.isPrimaryKey) return 1;
            return a.dartName.compareTo(b.dartName);
          }))
        ..isCustom = isCustom;

      // Inject ID field, if unspecified
      if (b.fields.build().every((f) => !f.isPrimaryKey)) {
        b.fields.insert(0, ModelField((f) {
          f
            ..name = 'id'
            ..isReadOnly = false
            ..isPrimaryKey = true;
          f.type
            ..awsType = AWSType.ID
            ..isList = false
            ..isRequired = true;
        }));
      }
    });
    models[model.name] = model;
  }

  // Second pass to establish hasMany/hasOne/belongsTo relationships
  for (var modelDefinition in _models.values) {
    if (modelDefinition.isCustom) {
      continue;
    }
    final nodeFields = modelDefinition.fields;
    final model = models[modelDefinition.name.value]!;
    final updatedModel = model.rebuild((m) {
      m.fields.map((field) => field.rebuild((field) {
            final fieldNode =
                nodeFields.singleWhereOrNull((f) => f.wireName == field.name);

            // Field node will be null for injected fields such as `createdAt`.
            // These fields will not have relationships.
            if (fieldNode == null || !fieldNode.hasRelationship) {
              return;
            }

            final isV1 = fieldNode.hasDirective('connection');
            final isV2 = !isV1;

            // Get the connected field in the current model, if any.
            final connectionFields = fieldNode.connectionFields;
            final connectionName = fieldNode.connectionName;

            // Get the model referred to by this relationship.
            var relatedModel = models[fieldNode.type.typeName]!;
            final relatedModelNode = _models[fieldNode.type.typeName]!;

            String? relatedFieldName;
            FieldDefinitionNode? relatedFieldNode;
            ModelField? relatedField;

            // Get foreign field via key/index.
            if (connectionFields != null || isV2) {
              final indexName = fieldNode.indexName;
              final indexFields = relatedModelNode.indexFields[indexName];
              final connectedFieldName =
                  indexFields?.firstOrNull ?? relatedModel.primaryKeyField.name;

              if (isV1) {
                relatedFieldNode =
                    relatedModelNode.fields.firstWhereOrNull((f) {
                  return f.relationshipDirective
                          ?.argumentNamed('fields')
                          ?.stringListValue
                          .first ==
                      connectedFieldName;
                });

                relatedFieldNode ??= relatedModelNode.fields
                    .singleWhere((f) => f.wireName == connectedFieldName);
              } else {
                relatedFieldNode =
                    relatedModelNode.fields.singleWhereOrNull((f) {
                  if (fieldNode.isHasOne) {
                    return f.isBelongsTo && f.type.typeName == m.name;
                  }
                  if (fieldNode.isHasMany) {
                    return f.isBelongsTo && f.type.typeName == m.name;
                  }
                  if (fieldNode.isBelongsTo) {
                    return (f.isHasOne || f.isHasMany) &&
                        f.type.typeName == m.name;
                  }
                  return false;
                });
                relatedFieldNode ??= relatedModelNode.fields
                    .singleWhereOrNull((f) => f.wireName == connectedFieldName);
              }
            } else if (connectionName != null) {
              relatedFieldNode = relatedModelNode.fields.singleWhere(
                (f) =>
                    f.relationshipDirective
                        ?.argumentNamed(isV1 ? 'name' : 'indexName')
                        ?.stringValue ==
                    connectionName,
              );
            }

            // Create field if it doesn't exist
            relatedFieldName = relatedFieldNode?.name.value ??
                makeConnectionAttributeName(model.name, field.name!);
            relatedField = relatedModel.maybeFieldNamed(relatedFieldName) ??
                ModelField((f) => f
                  ..name = relatedFieldName
                  ..ignore = true
                  ..type.awsType = AWSType.ID
                  ..type.isRequired = false
                  ..type.isList = false);

            final isNewField =
                relatedModel.maybeFieldNamed(relatedFieldName) == null;
            if (isNewField) {
              relatedModel =
                  relatedModel.rebuild((m) => m.fields.add(relatedField!));
              models[relatedModel.name] = relatedModel;
            }

            // hasMany
            final isHasMany =
                // V1
                field.type.isList! && !relatedField.type.isList ||
                    // V2
                    fieldNode.hasDirective('hasMany');
            if (isHasMany) {
              field
                ..isBelongsTo = false
                ..isHasMany = true
                ..isHasOne = false
                ..associatedType = relatedModel.name
                ..associatedName = relatedFieldName;
              return;
            }

            // hasOne
            final isHasOne =
                // V1
                (!field.type.isRequired! && relatedField.type.isRequired) ||
                    // V2
                    fieldNode.hasDirective('hasOne');
            if (isHasOne) {
              field
                ..isBelongsTo = false
                ..isHasMany = false
                ..isHasOne = true
                ..associatedType = relatedModel.name
                ..associatedName = relatedFieldName;
              return;
            }

            // belongsTo
            final isBelongsTo =
                // V1
                relatedField.type.isList ||
                    isNewField ||
                    (field.type.isRequired! && !relatedField.type.isRequired) ||
                    // V2
                    fieldNode.hasDirective('belongsTo');
            if (isBelongsTo) {
              var targetName = connectionFields?.single ??
                  makeConnectionAttributeName(model.name, field.name!);

              field
                ..isBelongsTo = true
                ..isHasMany = false
                ..isHasOne = false
                ..targetName = targetName;
              return;
            }

            throw StateError('Invalid connection type');
          }));
    });
    models[model.name] = updatedModel;
  }

  return models;
}
