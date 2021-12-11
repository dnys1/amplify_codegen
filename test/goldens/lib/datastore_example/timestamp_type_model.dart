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

library models.timestamp_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the TimestampTypeModel type in your schema.
@immutable
class TimestampTypeModel extends Model {
  factory TimestampTypeModel({String? id, TemporalTimestamp? value}) {
    return TimestampTypeModel._internal(id: id ?? UUID.getUUID(), value: value);
  }

  const TimestampTypeModel._internal(
      {required this.id, TemporalTimestamp? value})
      : _value = value;

  factory TimestampTypeModel.fromJson(Map<String, Object?> json) {
    return TimestampTypeModel._internal(
        id: (json['id'] as String),
        value: (json['value'] as TemporalTimestamp?));
  }

  static const _TimestampTypeModelModelType classType =
      _TimestampTypeModelModelType();

  final String id;

  final TemporalTimestamp? _value;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'TimestampTypeModel';
    modelSchemaDefinition.pluralName = 'TimestampTypeModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  TemporalTimestamp? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is TimestampTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('TimestampTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  TimestampTypeModel copyWith({String? id, TemporalTimestamp? value}) {
    return TimestampTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() => {'id': id, 'value': _value};
  @override
  _TimestampTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _TimestampTypeModelModelType extends ModelType<TimestampTypeModel> {
  const _TimestampTypeModelModelType();

  @override
  TimestampTypeModel fromJson(Map<String, Object?> jsonData) {
    return TimestampTypeModel.fromJson(jsonData);
  }
}
