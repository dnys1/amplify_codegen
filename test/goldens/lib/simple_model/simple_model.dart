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

library models.simple_model;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the SimpleModel type in your schema.
@immutable
class SimpleModel extends Model {
  factory SimpleModel({String? id, String? name, String? bar}) {
    return SimpleModel._internal(
        id: id ?? UUID.getUUID(), name: name, bar: bar);
  }

  const SimpleModel._internal({required this.id, String? name, String? bar})
      : _name = name,
        _bar = bar;

  factory SimpleModel.fromJson(Map<String, Object?> json) {
    return SimpleModel._internal(
        id: (json['id'] as String),
        name: (json['name'] as String?),
        bar: (json['bar'] as String?));
  }

  static const _SimpleModelModelType classType = _SimpleModelModelType();

  final String id;

  final String? _name;

  final String? _bar;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'SimpleModel';
    modelSchemaDefinition.pluralName = 'SimpleModels';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

  String? get name => _name;
  String? get bar => _bar;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is SimpleModel &&
          id == other.id &&
          _name == other._name &&
          _bar == other._bar;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('SimpleModel {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('bar=$_bar');
    buffer.write('}');

    return buffer.toString();
  }

  SimpleModel copyWith({String? id, String? name, String? bar}) {
    return SimpleModel(
        id: id ?? this.id, name: name ?? this.name, bar: bar ?? this.bar);
  }

  @override
  Map<String, Object?> toJson() => {'id': id, 'name': _name, 'bar': _bar};
  @override
  _SimpleModelModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _SimpleModelModelType extends ModelType<SimpleModel> {
  const _SimpleModelModelType();

  @override
  SimpleModel fromJson(Map<String, Object?> jsonData) {
    return SimpleModel.fromJson(jsonData);
  }
}
