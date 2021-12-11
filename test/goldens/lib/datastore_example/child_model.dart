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

library models.child_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the ChildModel type in your schema.
@immutable
class ChildModel extends Model {
  factory ChildModel({String? id, required String name}) {
    return ChildModel._internal(id: id ?? UUID.getUUID(), name: name);
  }

  const ChildModel._internal({required this.id, required String name})
      : _name = name;

  factory ChildModel.fromJson(Map<String, Object?> json) {
    return ChildModel._internal(
        id: (json['id'] as String), name: (json['name'] as String));
  }

  static const _ChildModelModelType classType = _ChildModelModelType();

  final String id;

  final String? _name;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'ChildModel';
    modelSchemaDefinition.pluralName = 'ChildModels';
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

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ChildModel && id == other.id && _name == other._name;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('ChildModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name');
    buffer.write('}');

    return buffer.toString();
  }

  ChildModel copyWith({String? id, String? name}) {
    return ChildModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Object?> toJson() => {'id': id, 'name': _name};
  @override
  _ChildModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _ChildModelModelType extends ModelType<ChildModel> {
  const _ChildModelModelType();

  @override
  ChildModel fromJson(Map<String, Object?> jsonData) {
    return ChildModel.fromJson(jsonData);
  }
}
