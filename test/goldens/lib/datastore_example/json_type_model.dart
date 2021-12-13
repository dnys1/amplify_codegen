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

library models.json_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the JsonTypeModel type in your schema.
@immutable
class JsonTypeModel extends Model {
  factory JsonTypeModel(
      {String? id,
      String? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return JsonTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const JsonTypeModel._internal(
      {required this.id,
      String? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _value = value,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory JsonTypeModel.fromJson(Map<String, Object?> json) {
    return JsonTypeModel._internal(
        id: (json['id'] as String),
        value: (json['value'] as String?),
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _JsonTypeModelModelType classType = _JsonTypeModelModelType();

  final String id;

  final String? _value;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'jsonTypeModel.id');

  static const value$ = QueryField<dynamic>(fieldName: 'value');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'JSONTypeModel';
    modelSchemaDefinition.pluralName = 'JSONTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: value$,
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
  _JsonTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String? get value => _value;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is JsonTypeModel &&
          id == other.id &&
          _value == other._value &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('JsonTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  JsonTypeModel copyWith(
      {String? id,
      String? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return JsonTypeModel(
        id: id ?? this.id,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'value': _value,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _JsonTypeModelModelType extends ModelType<JsonTypeModel> {
  const _JsonTypeModelModelType();

  @override
  String modelName() => 'JSONTypeModel';
  @override
  JsonTypeModel fromJson(Map<String, Object?> jsonData) {
    return JsonTypeModel.fromJson(jsonData);
  }
}
