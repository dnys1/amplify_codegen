import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:amplify_codegen/src/parser/connection.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:protobuf/protobuf.dart';

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
    final authRules = modelDefinition.directives.authRules;
    final primaryKey = modelDefinition.primaryKeyField;
    var model = Model()
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
    if (model.fields.every((f) => !f.isPrimaryKey)) {
      model.fields.insert(
        0,
        ModelField()
          ..name = 'id'
          ..isReadOnly = false
          ..isPrimaryKey = true
          ..type = ModelField_TypeInfo(
            graphqlType: GraphQLType.TYPE_ID,
            isArray: false,
            isRequired: true,
          ),
      );
    }
    models[model.name] = model;
  }

  // Second pass to establish hasMany/hasOne/belongsTo relationships
  for (var modelDefinition in _models.values) {
    if (modelDefinition.isCustom) {
      continue;
    }
    final nodeFields = modelDefinition.fields;
    final model = models[modelDefinition.name.value]!;
    final syntheticFields = <String>{};
    final updatedModel = model.deepCopy()
      ..fields.clear()
      ..fields.addAll(model.fields.map((field) {
        final fieldNode =
            nodeFields.singleWhereOrNull((f) => f.wireName == field.name);

        // Field node will be null for injected fields such as `createdAt`.
        // These fields will not have relationships.
        if (fieldNode == null || !fieldNode.hasRelationship) {
          return field;
        }

        final isV1 = fieldNode.hasDirective('connection');

        // Get the connected field in the current model, if any.
        final connectionFields = fieldNode.connectionFields;
        final connectionName = fieldNode.connectionName;

        // Get the model referred to by this relationship.
        var relatedModel = models[fieldNode.type.typeName]!;
        final relatedModelNode = _models[fieldNode.type.typeName]!;

        String? relatedFieldName;
        FieldDefinitionNode? relatedFieldNode;
        ModelField? relatedField;

        // Get foreign field by connectionName
        if (connectionName != null) {
          relatedFieldNode ??= relatedModelNode.fields.singleWhere(
            (f) =>
                f.relationshipDirective
                    ?.argumentNamed(isV1 ? 'name' : 'indexName')
                    ?.stringValue ==
                connectionName,
          );
        }

        // Get foreign field by key/index.
        final indexName = fieldNode.indexName;
        final indexFields = relatedModelNode.indexFields[indexName];
        final connectedFieldName =
            indexFields?.firstOrNull ?? relatedModel.primaryKeyField.name;

        relatedFieldNode ??= relatedModelNode.fields.firstWhereOrNull((f) {
          return f.relationshipDirective
                  ?.argumentNamed('fields')
                  ?.stringListValue
                  .first ==
              connectedFieldName;
        });

        // Get foreign field by relationship equality.
        relatedFieldNode ??= relatedModelNode.fields.singleWhereOrNull((f) {
          // V2
          if (fieldNode.isHasOne) {
            return f.isBelongsTo && f.type.typeName == model.name;
          }
          if (fieldNode.isHasMany) {
            return f.isBelongsTo && f.type.typeName == model.name;
          }
          if (fieldNode.isBelongsTo) {
            return (f.isHasOne || f.isHasMany) && f.type.typeName == model.name;
          }

          // V1
          return f.hasDirective('connection') && f.type.typeName == model.name;
        });

        // Get foreign field by field name.
        relatedFieldNode ??= relatedModelNode.fields
            .singleWhereOrNull((f) => f.wireName == connectedFieldName);

        // Create field if it doesn't exist
        relatedFieldName = relatedFieldNode?.name.value ??
            makeConnectionAttributeName(model.name, field.name);
        relatedField = relatedModel.maybeFieldNamed(relatedFieldName) ??
            (ModelField()
              ..name = relatedFieldName
              ..isSynthetic = true
              ..type = ModelField_TypeInfo(
                graphqlType: GraphQLType.TYPE_ID,
                isRequired: false,
                isArray: false,
              ));

        final isNewField =
            relatedModel.maybeFieldNamed(relatedFieldName) == null;
        if (isNewField) {
          relatedModel.fields.add(relatedField);
          models[relatedModel.name] = relatedModel;
        }

        final targetName = connectionFields?.first ??
            makeConnectionAttributeName(model.name, field.name);
        field.targetName = targetName;

        // hasMany
        final isHasMany =
            // V1
            field.type.isArray && !relatedField.type.isArray ||
                // V2
                fieldNode.hasDirective('hasMany');
        if (isHasMany) {
          field
            ..association = ModelAssociation.IS_HAS_MANY
            ..associatedType = relatedModel.name
            ..associatedName = relatedFieldName;
          return field;
        }

        // hasOne
        final isHasOne =
            // V1
            (!field.type.isRequired && relatedField.type.isRequired) ||
                // V2
                fieldNode.hasDirective('hasOne');
        if (isHasOne) {
          field
            ..association = ModelAssociation.IS_HAS_ONE
            ..associatedType = relatedModel.name
            ..associatedName = relatedFieldName;
          return field;
        }

        // belongsTo
        final isBelongsTo =
            // V1
            relatedField.type.isArray ||
                isNewField ||
                (field.type.isRequired && !relatedField.type.isRequired) ||
                // V2
                fieldNode.hasDirective('belongsTo');
        if (isBelongsTo) {
          // Do not codegen target since it will be autogenerated by client
          // libraries, and thus will conflict with them if included.
          syntheticFields.add(targetName);
          field.association = ModelAssociation.IS_BELONGS_TO;
          return field;
        }

        throw StateError('Invalid connection type');
      }));

    // Update synthetic fields.
    for (var field in updatedModel.fields) {
      field.isSynthetic =
          field.isSynthetic || syntheticFields.contains(field.name);
    }

    models[model.name] = updatedModel;
  }

  return models;
}
