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

import 'dart:typed_data';

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
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyChildModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        parent: parent,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const HasManyChildModel._internal(
      {required this.id,
      required String name,
      HasManyModel? parent,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _parent = parent,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  HasManyChildModel.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _parent = ((json['parent'] as Map?)?['serializedData'] as Map?) != null
            ? HasManyModel.fromJson(
                ((json['parent'] as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _HasManyChildModelModelType classType =
      _HasManyChildModelModelType();

  final String id;

  final String? _name;

  final HasManyModel? _parent;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'hasManyChildModel.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const parent$ = QueryField<dynamic>(
      fieldName: 'parent',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: 'HasManyModel'));

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

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x11,
    0x48,
    0x61,
    0x73,
    0x4d,
    0x61,
    0x6e,
    0x79,
    0x43,
    0x68,
    0x69,
    0x6c,
    0x64,
    0x4d,
    0x6f,
    0x64,
    0x65,
    0x6c,
    0x12,
    0x10,
    0x0a,
    0x02,
    0x69,
    0x64,
    0x12,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x01,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x12,
    0x0a,
    0x04,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x12,
    0x04,
    0x08,
    0x02,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x30,
    0x0a,
    0x06,
    0x70,
    0x61,
    0x72,
    0x65,
    0x6e,
    0x74,
    0x12,
    0x14,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x0c,
    0x48,
    0x61,
    0x73,
    0x4d,
    0x61,
    0x6e,
    0x79,
    0x4d,
    0x6f,
    0x64,
    0x65,
    0x6c,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x08,
    0x70,
    0x61,
    0x72,
    0x65,
    0x6e,
    0x74,
    0x49,
    0x44,
    0x50,
    0x00,
    0x12,
    0x16,
    0x0a,
    0x08,
    0x70,
    0x61,
    0x72,
    0x65,
    0x6e,
    0x74,
    0x49,
    0x44,
    0x12,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x01,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x63,
    0x72,
    0x65,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x75,
    0x70,
    0x64,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x20,
    0x00
  ]);

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
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  HasManyChildModel copyWith(
      {String? id,
      String? name,
      HasManyModel? parent,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyChildModel(
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

class _HasManyChildModelModelType extends ModelType<HasManyChildModel> {
  const _HasManyChildModelModelType();

  @override
  String modelName() => 'HasManyChildModel';
  @override
  HasManyChildModel fromJson(Map<String, Object?> jsonData) {
    return HasManyChildModel.fromJson(jsonData);
  }
}
