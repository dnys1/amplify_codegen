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

library models.bool_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the BoolTypeModel type in your schema.
@immutable
class BoolTypeModel extends Model {
  factory BoolTypeModel(
      {String? id,
      bool? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BoolTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const BoolTypeModel._internal(
      {required this.id,
      bool? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _value = value,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  BoolTypeModel.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _value = (json['value'] as bool?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _BoolTypeModelModelType classType = _BoolTypeModelModelType();

  final String id;

  final bool? _value;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'boolTypeModel.id');

  static const value$ = QueryField<dynamic>(fieldName: 'value');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BoolTypeModel';
    modelSchemaDefinition.pluralName = 'BoolTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: value$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.bool),
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
  _BoolTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  bool? get value => _value;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BoolTypeModel &&
          id == other.id &&
          _value == other._value &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('BoolTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  BoolTypeModel copyWith(
      {String? id,
      bool? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BoolTypeModel(
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

class _BoolTypeModelModelType extends ModelType<BoolTypeModel> {
  const _BoolTypeModelModelType();

  @override
  String modelName() => 'BoolTypeModel';
  @override
  BoolTypeModel fromJson(Map<String, Object?> jsonData) {
    return BoolTypeModel.fromJson(jsonData);
  }
}
