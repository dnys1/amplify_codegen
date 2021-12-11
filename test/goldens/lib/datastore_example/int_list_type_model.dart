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

library models.int_list_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the IntListTypeModel type in your schema.
@immutable
class IntListTypeModel extends Model {
  factory IntListTypeModel({String? id, List<int?>? value}) {
    return IntListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null);
  }

  const IntListTypeModel._internal({required this.id, List<int?>? value})
      : _value = value;

  factory IntListTypeModel.fromJson(Map<String, Object?> json) {
    return IntListTypeModel._internal(
        id: (json['id'] as String),
        value:
            (json['value'] as List?)?.cast<Int>()?.map((el) => (el as int?)));
  }

  static const _IntListTypeModelModelType classType =
      _IntListTypeModelModelType();

  final String id;

  final List<int?>? _value;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'IntListTypeModel';
    modelSchemaDefinition.pluralName = 'IntListTypeModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  List<int?>? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is IntListTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('IntListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  IntListTypeModel copyWith({String? id, List<int?>? value}) {
    return IntListTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'value': _value?.map((el) => el)?.toList()};
  @override
  _IntListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _IntListTypeModelModelType extends ModelType<IntListTypeModel> {
  const _IntListTypeModelModelType();

  @override
  IntListTypeModel fromJson(Map<String, Object?> jsonData) {
    return IntListTypeModel.fromJson(jsonData);
  }
}
