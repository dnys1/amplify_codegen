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

library models.todo;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the Todo type in your schema.
@immutable
class Todo extends Model {
  factory Todo(
      {String? id,
      String? content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Todo._internal(
        id: id ?? UUID.getUUID(),
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Todo._internal(
      {required this.id,
      String? content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _content = content,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Todo.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _content = (json['content'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _TodoModelType classType = _TodoModelType();

  final String id;

  final String? _content;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'todo.id');

  static const content$ = QueryField<dynamic>(fieldName: 'content');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Todo';
    modelSchemaDefinition.pluralName = 'Todos';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: content$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
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

  @override
  _TodoModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String? get content => _content;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Todo &&
          id == other.id &&
          _content == other._content &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Todo {');
    buffer.write('id=$id, ');
    buffer.write('content=$_content, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Todo copyWith(
      {String? id,
      String? content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Todo(
        id: id ?? this.id,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'content': _content,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _TodoModelType extends ModelType<Todo> {
  const _TodoModelType();

  @override
  String modelName() => 'Todo';
  @override
  Todo fromJson(Map<String, Object?> jsonData) {
    return Todo.fromJson(jsonData);
  }
}
