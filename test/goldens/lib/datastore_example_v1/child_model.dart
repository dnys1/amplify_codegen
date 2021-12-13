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

library models.child_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'parent_model.dart';

/// This is an auto generated class representing the ChildModel type in your schema.
@immutable
class ChildModel extends Model {
  factory ChildModel(
      {String? id,
      required String name,
      required ParentModel parent,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ChildModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        parent: parent,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const ChildModel._internal(
      {required this.id,
      required String name,
      required ParentModel parent,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _parent = parent,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  ChildModel.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _parent = ((json['parent'] as Map?)?['serializedData'] as Map?) != null
            ? ParentModel.fromJson(
                ((json['parent'] as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _ChildModelModelType classType = _ChildModelModelType();

  final String id;

  final String? _name;

  final ParentModel? _parent;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'childModel.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const parent$ = QueryField<dynamic>(
      fieldName: 'parent',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ParentModel'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'ChildModel';
    modelSchemaDefinition.pluralName = 'ChildModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: true,
        key: parent$,
        ofModelName: 'ParentModel',
        targetName: 'childModelParentId'));
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
  _ChildModelModelType getInstanceType() => classType;
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

  ParentModel get parent {
    if (_parent == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _parent!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ChildModel &&
          id == other.id &&
          _name == other._name &&
          _parent == other._parent &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('ChildModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('parent=$_parent, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  ChildModel copyWith(
      {String? id,
      String? name,
      ParentModel? parent,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ChildModel(
        id: id ?? this.id,
        name: name ?? this.name,
        parent: parent ?? this.parent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'parent': _parent?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _ChildModelModelType extends ModelType<ChildModel> {
  const _ChildModelModelType();

  @override
  String modelName() => 'ChildModel';
  @override
  ChildModel fromJson(Map<String, Object?> jsonData) {
    return ChildModel.fromJson(jsonData);
  }
}
