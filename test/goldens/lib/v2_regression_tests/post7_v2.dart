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

library models.post7_v2;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'blog7_v2.dart';
import 'comment7_v2.dart';

/// This is an auto generated class representing the Post7V2 type in your schema.
@immutable
class Post7V2 extends Model {
  factory Post7V2(
      {String? id,
      required String title,
      Blog7V2? blog,
      List<Comment7V2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post7V2._internal(
        id: id ?? UUID.getUUID(),
        title: title,
        blog: blog,
        comments: comments != null ? List.unmodifiable(comments) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Post7V2._internal(
      {required this.id,
      required String title,
      Blog7V2? blog,
      List<Comment7V2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _title = title,
        _blog = blog,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Post7V2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _title = (json['title'] as String?),
        _blog = ((json['blog'] as Map?)?['serializedData'] as Map?) != null
            ? Blog7V2.fromJson(((json['blog'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _comments = (json['comments'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? Comment7V2.fromJson(((el as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
                : null)
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _Post7V2ModelType classType = _Post7V2ModelType();

  final String id;

  final String? _title;

  final Blog7V2? _blog;

  final List<Comment7V2?>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'post7V2.id');

  static const title$ = QueryField<dynamic>(fieldName: 'title');

  static const blog$ = QueryField<dynamic>(
      fieldName: 'blog',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Blog7V2'));

  static const comments$ = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment7V2'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Post7V2';
    modelSchemaDefinition.pluralName = 'Post7V2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: title$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: blog$,
        ofModelName: 'Blog7V2',
        targetName: 'post7V2BlogId'));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment7V2',
        associatedKey: Comment7V2.post$));
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
  _Post7V2ModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get title {
    if (_title == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _title!;
  }

  Blog7V2? get blog => _blog;
  List<Comment7V2?>? get comments => _comments;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Post7V2 &&
          id == other.id &&
          _title == other._title &&
          _blog == other._blog &&
          _comments == other._comments &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Post7V2 {');
    buffer.write('id=$id, ');
    buffer.write('title=$_title, ');
    buffer.write('blog=$_blog, ');
    buffer.write('comments=$_comments, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Post7V2 copyWith(
      {String? id,
      String? title,
      Blog7V2? blog,
      List<Comment7V2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post7V2(
        id: id ?? this.id,
        title: title ?? this.title,
        blog: blog ?? this.blog,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'title': _title,
        'blog': _blog?.toJson(),
        'comments': _comments?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _Post7V2ModelType extends ModelType<Post7V2> {
  const _Post7V2ModelType();

  @override
  String modelName() => 'Post7V2';
  @override
  Post7V2 fromJson(Map<String, Object?> jsonData) {
    return Post7V2.fromJson(jsonData);
  }
}
