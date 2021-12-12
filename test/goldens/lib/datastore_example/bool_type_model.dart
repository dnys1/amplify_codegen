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

library models.bool_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the BoolTypeModel type in your schema.
@immutable
class BoolTypeModel extends Model {
  factory BoolTypeModel({String? id, bool? value}) {
    return BoolTypeModel._internal(id: id ?? UUID.getUUID(), value: value);
  }

  const BoolTypeModel._internal({required this.id, bool? value})
      : _value = value;

  factory BoolTypeModel.fromJson(Map<String, Object?> json) {
    return BoolTypeModel._internal(
        id: (json['id'] as String), value: (json['value'] as bool?));
  }

  static const _BoolTypeModelModelType classType = _BoolTypeModelModelType();

  final String id;

  final bool? _value;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const VALUE = QueryField<dynamic>(fieldName: 'value');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BoolTypeModel';
    modelSchemaDefinition.pluralName = 'BoolTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: VALUE,
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

  bool? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BoolTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('BoolTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  BoolTypeModel copyWith({String? id, bool? value}) {
    return BoolTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() => {'id': id, 'value': _value};
  @override
  _BoolTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _BoolTypeModelModelType extends ModelType<BoolTypeModel> {
  const _BoolTypeModelModelType();

  @override
  BoolTypeModel fromJson(Map<String, Object?> jsonData) {
    return BoolTypeModel.fromJson(jsonData);
  }
}
