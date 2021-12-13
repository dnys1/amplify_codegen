/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

library models.has_many_child_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'has_many_model.dart';

/// This is an auto generated class representing the HasManyChildModel type in your schema.
@immutable
class HasManyChildModel extends Model {
  factory HasManyChildModel(
      {String? id,
      required String name,
      HasManyModel? parent,
      required String parentId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyChildModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        parent: parent,
        parentId: parentId,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const HasManyChildModel._internal(
      {required this.id,
      required String name,
      HasManyModel? parent,
      required String parentId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _parent = parent,
        _parentId = parentId,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory HasManyChildModel.fromJson(Map<String, Object?> json) {
    return HasManyChildModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        parent: ((json['parent'] as Map?)?['serializedData'] as Map?) != null
            ? HasManyModel.fromJson(
                ((json['parent'] as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
            : null,
        parentId: (json['parentID'] as String),
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _HasManyChildModelModelType classType =
      _HasManyChildModelModelType();

  final String id;

  final String? _name;

  final HasManyModel? _parent;

  final String? _parentId;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'hasManyChildModel.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const parent$ = QueryField<dynamic>(
      fieldName: 'parent',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: 'HasManyModel'));

  static const parentId$ = QueryField<dynamic>(fieldName: 'parentID');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'HasManyChildModel';
    modelSchemaDefinition.pluralName = 'HasManyChildModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: parent$,
        ofModelName: 'HasManyModel',
        targetName: 'parentID'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: parentId$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        isRequired: false,
        isReadOnly: true,
        fieldName: 'createdAt',
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        isRequired: false,
        isReadOnly: true,
        fieldName: 'updatedAt',
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
  });

  @override
  _HasManyChildModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get name {
    if (_name == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _name!;
  }

  HasManyModel? get parent => _parent;
  String get parentId {
    if (_parentId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _parentId!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is HasManyChildModel &&
          id == other.id &&
          _name == other._name &&
          _parent == other._parent &&
          _parentId == other._parentId &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('HasManyChildModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('parent=$_parent, ');
    buffer.write('parentId=$_parentId, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  HasManyChildModel copyWith(
      {String? id,
      String? name,
      HasManyModel? parent,
      String? parentId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyChildModel(
        id: id ?? this.id,
        name: name ?? this.name,
        parent: parent ?? this.parent,
        parentId: parentId ?? this.parentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'parent': _parent?.toJson(),
        'parentID': _parentId,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _HasManyChildModelModelType extends ModelType<HasManyChildModel> {
  const _HasManyChildModelModelType();

  @override
  String modelName() => 'HasManyChildModel';
  @override
  HasManyChildModel fromJson(Map<String, Object?> jsonData) {
    return HasManyChildModel.fromJson(jsonData);
  }
}
