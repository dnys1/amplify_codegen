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

library models.has_many_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'has_many_child_model.dart';

/// This is an auto generated class representing the HasManyModel type in your schema.
@immutable
class HasManyModel extends Model {
  factory HasManyModel(
      {String? id,
      required String name,
      List<HasManyChildModel?>? children,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        children: children != null ? List.unmodifiable(children) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const HasManyModel._internal(
      {required this.id,
      required String name,
      List<HasManyChildModel?>? children,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _children = children,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory HasManyModel.fromJson(Map<String, Object?> json) {
    return HasManyModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        children: (json['children'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? HasManyChildModel.fromJson(
                    ((el as Map)['serializedData'] as Map)
                        .cast<String, Object?>())
                : null)
            .toList(),
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _HasManyModelModelType classType = _HasManyModelModelType();

  final String id;

  final String? _name;

  final List<HasManyChildModel?>? _children;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'hasManyModel.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const children$ = QueryField<dynamic>(
      fieldName: 'children',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'HasManyChildModel'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'HasManyModel';
    modelSchemaDefinition.pluralName = 'HasManyModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: children$,
        ofModelName: 'HasManyChildModel',
        associatedKey: HasManyChildModel.parent$));
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
  _HasManyModelModelType getInstanceType() => classType;
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

  List<HasManyChildModel?>? get children => _children;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is HasManyModel &&
          id == other.id &&
          _name == other._name &&
          _children == other._children &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('HasManyModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('children=$_children, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  HasManyModel copyWith(
      {String? id,
      String? name,
      List<HasManyChildModel?>? children,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return HasManyModel(
        id: id ?? this.id,
        name: name ?? this.name,
        children: children ?? this.children,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'children': _children?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _HasManyModelModelType extends ModelType<HasManyModel> {
  const _HasManyModelModelType();

  @override
  String modelName() => 'HasManyModel';
  @override
  HasManyModel fromJson(Map<String, Object?> jsonData) {
    return HasManyModel.fromJson(jsonData);
  }
}
