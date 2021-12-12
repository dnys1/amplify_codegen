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

library models.bool_list_type_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the BoolListTypeModel type in your schema.
@immutable
class BoolListTypeModel extends Model {
  factory BoolListTypeModel({String? id, List<bool?>? value}) {
    return BoolListTypeModel._internal(
        id: id ?? UUID.getUUID(),
        value: value != null ? List.unmodifiable(value) : null);
  }

  const BoolListTypeModel._internal({required this.id, List<bool?>? value})
      : _value = value;

  factory BoolListTypeModel.fromJson(Map<String, Object?> json) {
    return BoolListTypeModel._internal(
        id: (json['id'] as String),
        value:
            (json['value'] as List?)?.cast<bool?>().map((el) => el).toList());
  }

  static const _BoolListTypeModelModelType classType =
      _BoolListTypeModelModelType();

  final String id;

  final List<bool?>? _value;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const VALUE = QueryField<dynamic>(fieldName: 'value');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BoolListTypeModel';
    modelSchemaDefinition.pluralName = 'BoolListTypeModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: VALUE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.bool),
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

  List<bool?>? get value => _value;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BoolListTypeModel && id == other.id && _value == other._value;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('BoolListTypeModel {');
    buffer.write('id=$id, ');
    buffer.write('value=$_value');
    buffer.write('}');

    return buffer.toString();
  }

  BoolListTypeModel copyWith({String? id, List<bool?>? value}) {
    return BoolListTypeModel(id: id ?? this.id, value: value ?? this.value);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'value': _value?.map((el) => el).toList()};
  @override
  _BoolListTypeModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _BoolListTypeModelModelType extends ModelType<BoolListTypeModel> {
  const _BoolListTypeModelModelType();

  @override
  BoolListTypeModel fromJson(Map<String, Object?> jsonData) {
    return BoolListTypeModel.fromJson(jsonData);
  }
}
