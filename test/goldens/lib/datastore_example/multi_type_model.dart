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

library models.multi_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the MultiTypeModel type in your schema.
@immutable
class MultiTypeModel extends Model {
  factory MultiTypeModel(
      {String? id,
      String? stringValue,
      String? altStringValue,
      int? intValue,
      int? altIntValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return MultiTypeModel._internal(
        id: id ?? UUID.getUUID(),
        stringValue: stringValue,
        altStringValue: altStringValue,
        intValue: intValue,
        altIntValue: altIntValue,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const MultiTypeModel._internal(
      {required this.id,
      String? stringValue,
      String? altStringValue,
      int? intValue,
      int? altIntValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _stringValue = stringValue,
        _altStringValue = altStringValue,
        _intValue = intValue,
        _altIntValue = altIntValue,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory MultiTypeModel.fromJson(Map<String, Object?> json) {
    return MultiTypeModel._internal(
        id: (json['id'] as String),
        stringValue: (json['stringValue'] as String),
        altStringValue: (json['altStringValue'] as String),
        intValue: (json['intValue'] as int),
        altIntValue: (json['altIntValue'] as int),
        createdAt: json['createdAt'] == null
            ? null
            : TemporalDateTime.fromString((json['createdAt'] as String)),
        updatedAt: json['updatedAt'] == null
            ? null
            : TemporalDateTime.fromString((json['updatedAt'] as String)));
  }

  static const _MultiTypeModelModelType classType = _MultiTypeModelModelType();

  final String id;

  final String? _stringValue;

  final String? _altStringValue;

  final int? _intValue;

  final int? _altIntValue;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const STRING_VALUE = QueryField<dynamic>(fieldName: 'stringValue');

  static const ALT_STRING_VALUE =
      QueryField<dynamic>(fieldName: 'altStringValue');

  static const INT_VALUE = QueryField<dynamic>(fieldName: 'intValue');

  static const ALT_INT_VALUE = QueryField<dynamic>(fieldName: 'altIntValue');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'MultiTypeModel';
    modelSchemaDefinition.pluralName = 'MultiTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: STRING_VALUE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: ALT_STRING_VALUE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: INT_VALUE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: ALT_INT_VALUE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
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
  _MultiTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String? get stringValue => _stringValue;
  String? get altStringValue => _altStringValue;
  int? get intValue => _intValue;
  int? get altIntValue => _altIntValue;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is MultiTypeModel &&
          id == other.id &&
          _stringValue == other._stringValue &&
          _altStringValue == other._altStringValue &&
          _intValue == other._intValue &&
          _altIntValue == other._altIntValue &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('MultiTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('stringValue=$_stringValue, ');
    buffer.write('altStringValue=$_altStringValue, ');
    buffer.write('intValue=$_intValue, ');
    buffer.write('altIntValue=$_altIntValue, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  MultiTypeModel copyWith(
      {String? id,
      String? stringValue,
      String? altStringValue,
      int? intValue,
      int? altIntValue,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return MultiTypeModel(
        id: id ?? this.id,
        stringValue: stringValue ?? this.stringValue,
        altStringValue: altStringValue ?? this.altStringValue,
        intValue: intValue ?? this.intValue,
        altIntValue: altIntValue ?? this.altIntValue,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'stringValue': _stringValue,
        'altStringValue': _altStringValue,
        'intValue': _intValue,
        'altIntValue': _altIntValue,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _MultiTypeModelModelType extends ModelType<MultiTypeModel> {
  const _MultiTypeModelModelType();

  @override
  MultiTypeModel fromJson(Map<String, Object?> jsonData) {
    return MultiTypeModel.fromJson(jsonData);
  }
}
