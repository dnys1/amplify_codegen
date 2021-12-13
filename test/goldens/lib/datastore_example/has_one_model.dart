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

// ignore_for_file: constant_identifier_names

library models.has_one_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'child_model.dart';

/// This is an auto generated class representing the HasOneModel type in your schema.
@immutable
class HasOneModel extends Model {
  factory HasOneModel(
      {String? id,
      required String name,
      required String childId,
      ChildModel? child,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasOneModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        childId: childId,
        child: child,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const HasOneModel._internal(
      {required this.id,
      required String name,
      required String childId,
      ChildModel? child,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _childId = childId,
        _child = child,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory HasOneModel.fromJson(Map<String, Object?> json) {
    return HasOneModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        childId: (json['childID'] as String),
        child: json['child'] != null
            ? ChildModel.fromJson(
                (json['child'] as Map).cast<String, Object?>())
            : null,
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _HasOneModelModelType classType = _HasOneModelModelType();

  final String id;

  final String? _name;

  final String? _childId;

  final ChildModel? _child;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'hasOneModel.id');

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const CHILD_ID = QueryField<dynamic>(fieldName: 'childID');

  static const CHILD = QueryField<dynamic>(
      fieldName: 'child',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ChildModel'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'HasOneModel';
    modelSchemaDefinition.pluralName = 'HasOneModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: CHILD_ID,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        isRequired: false,
        key: CHILD,
        ofModelName: 'ChildModel',
        associatedKey: ChildModel.ID));
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
  _HasOneModelModelType getInstanceType() => classType;
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

  String get childId {
    if (_childId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _childId!;
  }

  ChildModel? get child => _child;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is HasOneModel &&
          id == other.id &&
          _name == other._name &&
          _childId == other._childId &&
          _child == other._child &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('HasOneModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('childId=$_childId, ');
    buffer.write('child=$_child, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  HasOneModel copyWith(
      {String? id,
      String? name,
      String? childId,
      ChildModel? child,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasOneModel(
        id: id ?? this.id,
        name: name ?? this.name,
        childId: childId ?? this.childId,
        child: child ?? this.child,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'childID': _childId,
        'child': _child?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _HasOneModelModelType extends ModelType<HasOneModel> {
  const _HasOneModelModelType();

  @override
  HasOneModel fromJson(Map<String, Object?> jsonData) {
    return HasOneModel.fromJson(jsonData);
  }
}
