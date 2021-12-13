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

library models.post;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'comment.dart';

/// This is an auto generated class representing the Post type in your schema.
@immutable
class Post extends Model {
  factory Post(
      {String? id,
      required String title,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post._internal(
        id: id ?? UUID.getUUID(),
        title: title,
        comments: comments != null ? List.unmodifiable(comments) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Post._internal(
      {required this.id,
      required String title,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _title = title,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Post.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _title = (json['title'] as String?),
        _comments = (json['comments'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? Comment.fromJson(((el as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
                : null)
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _PostModelType classType = _PostModelType();

  final String id;

  final String? _title;

  final List<Comment?>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'post.id');

  static const title$ = QueryField<dynamic>(fieldName: 'title');

  static const comments$ = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Post';
    modelSchemaDefinition.pluralName = 'Posts';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: title$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment',
        associatedKey: Comment.id$));
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
  _PostModelType getInstanceType() => classType;
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

  List<Comment?>? get comments => _comments;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Post &&
          id == other.id &&
          _title == other._title &&
          _comments == other._comments &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Post {');
    buffer.write('id=$id, ');
    buffer.write('title=$_title, ');
    buffer.write('comments=$_comments, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Post copyWith(
      {String? id,
      String? title,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'title': _title,
        'comments': _comments?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  String modelName() => 'Post';
  @override
  Post fromJson(Map<String, Object?> jsonData) {
    return Post.fromJson(jsonData);
  }
}
