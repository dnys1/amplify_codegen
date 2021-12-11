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

library models.has_many_child_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the HasManyChildModel type in your schema.
@immutable
class HasManyChildModel extends Model {
  factory HasManyChildModel(
      {String? id,
      required String name,
      HasManyModel? parent,
      required String parentID}) {
    return HasManyChildModel._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        parent: parent,
        parentID: parentID);
  }

  const HasManyChildModel._internal(
      {required this.id,
      required String name,
      HasManyModel? parent,
      required String parentID})
      : _name = name,
        _parent = parent,
        _parentID = parentID;

  factory HasManyChildModel.fromJson(Map<String, Object?> json) {
    return HasManyChildModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        parent: json['parent'] != null
            ? HasManyModel.fromJson(json['parent'])
            : null,
        parentID: (json['parentID'] as String));
  }

  static const _HasManyChildModelModelType classType =
      _HasManyChildModelModelType();

  final String id;

  final String? _name;

  final HasManyModel? _parent;

  final String? _parentID;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'HasManyChildModel';
    modelSchemaDefinition.pluralName = 'HasManyChildModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
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

  HasManyModel? get parent => _parent;
  String get parentID {
    if (_parentID == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _parentID!;
  }

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is HasManyChildModel &&
          id == other.id &&
          _name == other._name &&
          _parent == other._parent &&
          _parentID == other._parentID;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('HasManyChildModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('parent=$_parent, ');
    buffer.write('parentID=$_parentID');
    buffer.write('}');

    return buffer.toString();
  }

  HasManyChildModel copyWith(
      {String? id, String? name, HasManyModel? parent, String? parentID}) {
    return HasManyChildModel(
        id: id ?? this.id,
        name: name ?? this.name,
        parent: parent ?? this.parent,
        parentID: parentID ?? this.parentID);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'parent': _parent?.toJson(),
        'parentID': _parentID
      };
  @override
  _HasManyChildModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _HasManyChildModelModelType extends ModelType<HasManyChildModel> {
  const _HasManyChildModelModelType();

  @override
  HasManyChildModel fromJson(Map<String, Object?> jsonData) {
    return HasManyChildModel.fromJson(jsonData);
  }
}
