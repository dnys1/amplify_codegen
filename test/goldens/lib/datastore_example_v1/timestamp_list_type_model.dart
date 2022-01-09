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

library models.timestamp_list_type_model;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the TimestampListTypeModel type in your schema.
@immutable
class TimestampListTypeModel extends Model {
  factory TimestampListTypeModel(
      {String? id,
      List<TemporalTimestamp?>? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return TimestampListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const TimestampListTypeModel._internal(
      {required this.id,
      List<TemporalTimestamp?>? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _value = value,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  TimestampListTypeModel.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _value = (json['value'] as List?)
            ?.cast<int?>()
            .map((el) => el != null ? TemporalTimestamp.fromSeconds(el) : null)
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _TimestampListTypeModelModelType classType =
      _TimestampListTypeModelModelType();

  final String id;

  final List<TemporalTimestamp?>? _value;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ =
      QueryField<dynamic>(fieldName: 'timestampListTypeModel.id');

  static const value$ = QueryField<dynamic>(fieldName: 'value');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'TimestampListTypeModel';
    modelSchemaDefinition.pluralName = 'TimestampListTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: value$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: 'timestamp'),
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

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x16,
    0x54,
    0x69,
    0x6d,
    0x65,
    0x73,
    0x74,
    0x61,
    0x6d,
    0x70,
    0x4c,
    0x69,
    0x73,
    0x74,
    0x54,
    0x79,
    0x70,
    0x65,
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
    0x1d,
    0x0a,
    0x05,
    0x76,
    0x61,
    0x6c,
    0x75,
    0x65,
    0x12,
    0x0e,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x04,
    0x08,
    0x09,
    0x10,
    0x00,
    0x2a,
    0x00,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
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
  _TimestampListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  List<TemporalTimestamp?>? get value => _value;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is TimestampListTypeModel &&
          id == other.id &&
          _value == other._value &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('TimestampListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  TimestampListTypeModel copyWith(
      {String? id,
      List<TemporalTimestamp?>? value,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return TimestampListTypeModel(
        id: id ?? this.id,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'value': _value?.map((el) => el?.toSeconds()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _TimestampListTypeModelModelType
    extends ModelType<TimestampListTypeModel> {
  const _TimestampListTypeModelModelType();

  @override
  String modelName() => 'TimestampListTypeModel';
  @override
  TimestampListTypeModel fromJson(Map<String, Object?> jsonData) {
    return TimestampListTypeModel.fromJson(jsonData);
  }
}
