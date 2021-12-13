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

library models.model_nested_custom_type;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'all_scalar_types_custom_type.dart';
import 'all_scalar_types_list_custom_type.dart';

/// This is an auto generated class representing the ModelNestedCustomType type in your schema.
@immutable
class ModelNestedCustomType extends Model {
  factory ModelNestedCustomType(
      {String? id,
      required AllScalarTypesCustomType customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ModelNestedCustomType._internal(
        id: id ?? UUID.getUUID(),
        customTypeValue: customTypeValue,
        listCustomTypeValue: listCustomTypeValue != null
            ? List.unmodifiable(listCustomTypeValue)
            : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const ModelNestedCustomType._internal(
      {required this.id,
      required AllScalarTypesCustomType customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _customTypeValue = customTypeValue,
        _listCustomTypeValue = listCustomTypeValue,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ModelNestedCustomType.fromJson(Map<String, Object?> json) {
    return ModelNestedCustomType._internal(
        id: (json['id'] as String),
        customTypeValue: AllScalarTypesCustomType.fromJson(
            ((json['customTypeValue'] as Map)['serializedData'] as Map)
                .cast<String, Object?>()),
        listCustomTypeValue: (json['listCustomTypeValue'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? AllScalarTypesListCustomType.fromJson(
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

  static const _ModelNestedCustomTypeModelType classType =
      _ModelNestedCustomTypeModelType();

  final String id;

  final AllScalarTypesCustomType? _customTypeValue;

  final List<AllScalarTypesListCustomType?>? _listCustomTypeValue;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'modelNestedCustomType.id');

  static const customTypeValue$ =
      QueryField<dynamic>(fieldName: 'customTypeValue');

  static const listCustomTypeValue$ =
      QueryField<dynamic>(fieldName: 'listCustomTypeValue');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'ModelNestedCustomType';
    modelSchemaDefinition.pluralName = 'ModelNestedCustomTypes';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: true,
        fieldName: 'customTypeValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'AllScalarTypesCustomType'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'listCustomTypeValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection,
            ofCustomTypeName: 'AllScalarTypesListCustomType'),
        isArray: true));
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
  _ModelNestedCustomTypeModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  AllScalarTypesCustomType get customTypeValue {
    if (_customTypeValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _customTypeValue!;
  }

  List<AllScalarTypesListCustomType?>? get listCustomTypeValue =>
      _listCustomTypeValue;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ModelNestedCustomType &&
          id == other.id &&
          _customTypeValue == other._customTypeValue &&
          _listCustomTypeValue == other._listCustomTypeValue &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('ModelNestedCustomType {');
    buffer.write('id=$id, ');
    buffer.write('customTypeValue=$_customTypeValue, ');
    buffer.write('listCustomTypeValue=$_listCustomTypeValue, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  ModelNestedCustomType copyWith(
      {String? id,
      AllScalarTypesCustomType? customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ModelNestedCustomType(
        id: id ?? this.id,
        customTypeValue: customTypeValue ?? this.customTypeValue,
        listCustomTypeValue: listCustomTypeValue ?? this.listCustomTypeValue,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'customTypeValue': _customTypeValue?.toJson(),
        'listCustomTypeValue':
            _listCustomTypeValue?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _ModelNestedCustomTypeModelType extends ModelType<ModelNestedCustomType> {
  const _ModelNestedCustomTypeModelType();

  @override
  String modelName() => 'ModelNestedCustomType';
  @override
  ModelNestedCustomType fromJson(Map<String, Object?> jsonData) {
    return ModelNestedCustomType.fromJson(jsonData);
  }
}
