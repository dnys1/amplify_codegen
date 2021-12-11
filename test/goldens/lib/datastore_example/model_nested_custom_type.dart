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

/// This is an auto generated class representing the ModelNestedCustomType type in your schema.
@immutable
class ModelNestedCustomType extends Model {
  factory ModelNestedCustomType(
      {String? id,
      required AllScalarTypesCustomType customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue}) {
    return ModelNestedCustomType._internal(
        id: id ?? UUID.getUUID(),
        customTypeValue: customTypeValue,
        listCustomTypeValue: listCustomTypeValue != null
            ? List.unmodifiable(listCustomTypeValue)
            : null);
  }

  const ModelNestedCustomType._internal(
      {required this.id,
      required AllScalarTypesCustomType customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue})
      : _customTypeValue = customTypeValue,
        _listCustomTypeValue = listCustomTypeValue;

  factory ModelNestedCustomType.fromJson(Map<String, Object?> json) {
    return ModelNestedCustomType._internal(
        id: (json['id'] as String),
        customTypeValue:
            AllScalarTypesCustomType.fromJson(json['customTypeValue']),
        listCustomTypeValue: (json['listCustomTypeValue'] as List?)
            ?.cast<Map>()
            ?.map((el) =>
                el != null ? AllScalarTypesListCustomType.fromJson(el) : null));
  }

  static const _ModelNestedCustomTypeModelType classType =
      _ModelNestedCustomTypeModelType();

  final String id;

  final AllScalarTypesCustomType? _customTypeValue;

  final List<AllScalarTypesListCustomType?>? _listCustomTypeValue;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'ModelNestedCustomType';
    modelSchemaDefinition.pluralName = 'ModelNestedCustomTypes';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

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
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ModelNestedCustomType &&
          id == other.id &&
          _customTypeValue == other._customTypeValue &&
          _listCustomTypeValue == other._listCustomTypeValue;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('ModelNestedCustomType {');
    buffer.write('id=$id, ');
    buffer.write('customTypeValue=$_customTypeValue, ');
    buffer.write('listCustomTypeValue=$_listCustomTypeValue');
    buffer.write('}');

    return buffer.toString();
  }

  ModelNestedCustomType copyWith(
      {String? id,
      AllScalarTypesCustomType? customTypeValue,
      List<AllScalarTypesListCustomType?>? listCustomTypeValue}) {
    return ModelNestedCustomType(
        id: id ?? this.id,
        customTypeValue: customTypeValue ?? this.customTypeValue,
        listCustomTypeValue: listCustomTypeValue ?? this.listCustomTypeValue);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'customTypeValue': _customTypeValue.toJson(),
        'listCustomTypeValue':
            _listCustomTypeValue?.map((el) => el?.toJson())?.toList()
      };
  @override
  _ModelNestedCustomTypeModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _ModelNestedCustomTypeModelType extends ModelType<ModelNestedCustomType> {
  const _ModelNestedCustomTypeModelType();

  @override
  ModelNestedCustomType fromJson(Map<String, Object?> jsonData) {
    return ModelNestedCustomType.fromJson(jsonData);
  }
}
