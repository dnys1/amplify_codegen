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

library models.has_many_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the HasManyModel type in your schema.
@immutable
class HasManyModel extends Model {
  factory HasManyModel(
      {String? id, required String name, List<HasManyChildModel?>? children}) {
    return HasManyModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        children: children != null ? List.unmodifiable(children) : null);
  }

  const HasManyModel._internal(
      {required this.id,
      required String name,
      List<HasManyChildModel?>? children})
      : _name = name,
        _children = children;

  factory HasManyModel.fromJson(Map<String, Object?> json) {
    return HasManyModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        children: (json['children'] as List?)
            ?.cast<Map?>()
            .map((el) => el != null
                ? HasManyChildModel.fromJson(el.cast<String, Object?>())
                : null)
            .toList());
  }

  static const _HasManyModelModelType classType = _HasManyModelModelType();

  final String id;

  final String? _name;

  final List<HasManyChildModel?>? _children;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const CHILDREN = QueryField<dynamic>(
      fieldName: 'children',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'HasManyChildModel'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'HasManyModel';
    modelSchemaDefinition.pluralName = 'HasManyModels';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: CHILDREN,
        ofModelName: 'HasManyChildModel',
        associatedKey: HasManyChildModel.PARENT));
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

  List<HasManyChildModel?>? get children => _children;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is HasManyModel &&
          id == other.id &&
          _name == other._name &&
          _children == other._children;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('HasManyModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('children=$_children');
    buffer.write('}');

    return buffer.toString();
  }

  HasManyModel copyWith(
      {String? id, String? name, List<HasManyChildModel?>? children}) {
    return HasManyModel(
        id: id ?? this.id,
        name: name ?? this.name,
        children: children ?? this.children);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'children': _children?.map((el) => el?.toJson()).toList()
      };
  @override
  _HasManyModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _HasManyModelModelType extends ModelType<HasManyModel> {
  const _HasManyModelModelType();

  @override
  HasManyModel fromJson(Map<String, Object?> jsonData) {
    return HasManyModel.fromJson(jsonData);
  }
}
