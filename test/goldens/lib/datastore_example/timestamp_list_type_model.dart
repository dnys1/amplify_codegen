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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the TimestampListTypeModel type in your schema.
@immutable
class TimestampListTypeModel extends Model {
  factory TimestampListTypeModel(
      {String? id, List<TemporalTimestamp?>? value}) {
    return TimestampListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null);
  }

  const TimestampListTypeModel._internal(
      {required this.id, List<TemporalTimestamp?>? value})
      : _value = value;

  factory TimestampListTypeModel.fromJson(Map<String, Object?> json) {
    return TimestampListTypeModel._internal(
        id: (json['id'] as String),
        value: (json['value'] as List?)
            ?.cast<AWSTimestamp>()
            ?.map((el) => (el as TemporalTimestamp?)));
  }

  static const _TimestampListTypeModelModelType classType =
      _TimestampListTypeModelModelType();

  final String id;

  final List<TemporalTimestamp?>? _value;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'TimestampListTypeModel';
    modelSchemaDefinition.pluralName = 'TimestampListTypeModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  List<TemporalTimestamp?>? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is TimestampListTypeModel &&
          id == other.id &&
          _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('TimestampListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  TimestampListTypeModel copyWith(
      {String? id, List<TemporalTimestamp?>? value}) {
    return TimestampListTypeModel(
        id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'value': _value?.map((el) => el)?.toList()};
  @override
  _TimestampListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _TimestampListTypeModelModelType
    extends ModelType<TimestampListTypeModel> {
  const _TimestampListTypeModelModelType();

  @override
  TimestampListTypeModel fromJson(Map<String, Object?> jsonData) {
    return TimestampListTypeModel.fromJson(jsonData);
  }
}
