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

library models.blog7_v2;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'post7_v2.dart';

/// This is an auto generated class representing the Blog7V2 type in your schema.
@immutable
class Blog7V2 extends Model {
  factory Blog7V2(
      {String? id,
      required String name,
      List<Post7V2?>? posts,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Blog7V2._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        posts: posts != null ? List.unmodifiable(posts) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Blog7V2._internal(
      {required this.id,
      required String name,
      List<Post7V2?>? posts,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _posts = posts,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Blog7V2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _posts = (json['posts'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? Post7V2.fromJson(((el as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
                : null)
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _Blog7V2ModelType classType = _Blog7V2ModelType();

  final String id;

  final String? _name;

  final List<Post7V2?>? _posts;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'blog7V2.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const posts$ = QueryField<dynamic>(
      fieldName: 'posts',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Post7V2'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Blog7V2';
    modelSchemaDefinition.pluralName = 'Blog7V2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: posts$,
        ofModelName: 'Post7V2',
        associatedKey: Post7V2.blog$));
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
  _Blog7V2ModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

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

  List<Post7V2?>? get posts => _posts;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Blog7V2 &&
          id == other.id &&
          _name == other._name &&
          _posts == other._posts &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Blog7V2 {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('posts=$_posts, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Blog7V2 copyWith(
      {String? id,
      String? name,
      List<Post7V2?>? posts,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Blog7V2(
        id: id ?? this.id,
        name: name ?? this.name,
        posts: posts ?? this.posts,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'posts': _posts?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _Blog7V2ModelType extends ModelType<Blog7V2> {
  const _Blog7V2ModelType();

  @override
  String modelName() => 'Blog7V2';
  @override
  Blog7V2 fromJson(Map<String, Object?> jsonData) {
    return Blog7V2.fromJson(jsonData);
  }
}
