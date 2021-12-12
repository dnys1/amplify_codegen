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

library models.belongs_to_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the BelongsToModel type in your schema.
@immutable
class BelongsToModel extends Model {
  factory BelongsToModel(
      {String? id, required String name, required ChildModel child}) {
    return BelongsToModel._internal(
        id: id ?? UUID.getUUID(), name: name, child: child);
  }

  const BelongsToModel._internal(
      {required this.id, required String name, required ChildModel child})
      : _name = name,
        _child = child;

  factory BelongsToModel.fromJson(Map<String, Object?> json) {
    return BelongsToModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        child: ChildModel.fromJson(
            (json['child'] as Map).cast<String, Object?>()));
  }

  static const _BelongsToModelModelType classType = _BelongsToModelModelType();

  final String id;

  final String? _name;

  final ChildModel? _child;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const CHILD = QueryField<dynamic>(
      fieldName: 'child',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'ChildModel'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BelongsToModel';
    modelSchemaDefinition.pluralName = 'BelongsToModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: true,
        key: CHILD,
        ofModelName: 'ChildModel',
        targetName: 'id'));
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

  String get name {
    if (_name == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _name!;
  }

  ChildModel get child {
    if (_child == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _child!;
  }

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BelongsToModel &&
          id == other.id &&
          _name == other._name &&
          _child == other._child;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('BelongsToModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('child=$_child');
    buffer.write('}');

    return buffer.toString();
  }

  BelongsToModel copyWith({String? id, String? name, ChildModel? child}) {
    return BelongsToModel(
        id: id ?? this.id, name: name ?? this.name, child: child ?? this.child);
  }

  @override
  Map<String, Object?> toJson() =>
      {'id': id, 'name': _name, 'child': _child?.toJson()};
  @override
  _BelongsToModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _BelongsToModelModelType extends ModelType<BelongsToModel> {
  const _BelongsToModelModelType();

  @override
  BelongsToModel fromJson(Map<String, Object?> jsonData) {
    return BelongsToModel.fromJson(jsonData);
  }
}
