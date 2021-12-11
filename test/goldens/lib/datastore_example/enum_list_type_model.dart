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

library models.enum_list_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the EnumListTypeModel type in your schema.
@immutable
class EnumListTypeModel extends Model {
  factory EnumListTypeModel({String? id, List<EnumModel?>? value}) {
    return EnumListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null);
  }

  const EnumListTypeModel._internal({required this.id, List<EnumModel?>? value})
      : _value = value;

  factory EnumListTypeModel.fromJson(Map<String, Object?> json) {
    return EnumListTypeModel._internal(
        id: (json['id'] as String),
        value: (json['value'] as List?)
            ?.cast<Map>()
            ?.map((el) => el != null ? EnumModel.fromJson(el) : null));
  }

  static const _EnumListTypeModelModelType classType =
      _EnumListTypeModelModelType();

  final String id;

  final List<EnumModel?>? _value;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'EnumListTypeModel';
    modelSchemaDefinition.pluralName = 'EnumListTypeModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  List<EnumModel?>? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is EnumListTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('EnumListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  EnumListTypeModel copyWith({String? id, List<EnumModel?>? value}) {
    return EnumListTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'value': _value?.map((el) => el?.toJson())?.toList()};
  @override
  _EnumListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _EnumListTypeModelModelType extends ModelType<EnumListTypeModel> {
  const _EnumListTypeModelModelType();

  @override
  EnumListTypeModel fromJson(Map<String, Object?> jsonData) {
    return EnumListTypeModel.fromJson(jsonData);
  }
}
