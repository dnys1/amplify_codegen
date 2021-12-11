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

library models.double_list_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the DoubleListTypeModel type in your schema.
@immutable
class DoubleListTypeModel extends Model {
  factory DoubleListTypeModel({String? id, List<double?>? value}) {
    return DoubleListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null);
  }

  const DoubleListTypeModel._internal({required this.id, List<double?>? value})
      : _value = value;

  factory DoubleListTypeModel.fromJson(Map<String, Object?> json) {
    return DoubleListTypeModel._internal(
        id: (json['id'] as String),
        value: (json['value'] as List?)
            ?.cast<Float>()
            ?.map((el) => (el as double?)));
  }

  static const _DoubleListTypeModelModelType classType =
      _DoubleListTypeModelModelType();

  final String id;

  final List<double?>? _value;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'DoubleListTypeModel';
    modelSchemaDefinition.pluralName = 'DoubleListTypeModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  List<double?>? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is DoubleListTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('DoubleListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  DoubleListTypeModel copyWith({String? id, List<double?>? value}) {
    return DoubleListTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'value': _value?.map((el) => el)?.toList()};
  @override
  _DoubleListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _DoubleListTypeModelModelType extends ModelType<DoubleListTypeModel> {
  const _DoubleListTypeModelModelType();

  @override
  DoubleListTypeModel fromJson(Map<String, Object?> jsonData) {
    return DoubleListTypeModel.fromJson(jsonData);
  }
}
