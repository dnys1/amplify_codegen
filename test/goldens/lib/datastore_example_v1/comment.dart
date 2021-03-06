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

library models.comment;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'post.dart';

/// This is an auto generated class representing the Comment type in your schema.
@immutable
class Comment extends Model {
  factory Comment(
      {String? id,
      Post? post,
      required String content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment._internal(
        id: id ?? UUID.getUUID(),
        post: post,
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Comment._internal(
      {required this.id,
      Post? post,
      required String content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _post = post,
        _content = content,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Comment.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _post = ((json['post'] as Map?)?['serializedData'] as Map?) != null
            ? Post.fromJson(((json['post'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _content = (json['content'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _CommentModelType classType = _CommentModelType();

  final String id;

  final Post? _post;

  final String? _content;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'comment.id');

  static const post$ = QueryField<dynamic>(
      fieldName: 'post',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Post'));

  static const content$ = QueryField<dynamic>(fieldName: 'content');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment';
    modelSchemaDefinition.pluralName = 'Comments';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: post$,
        ofModelName: 'Post',
        targetName: 'postID'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
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
  _CommentModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  Post? get post => _post;
  String get content {
    if (_content == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _content!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Comment &&
          id == other.id &&
          _post == other._post &&
          _content == other._content &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Comment {');
    buffer.write('id=$id, ');
    buffer.write('post=$_post, ');
    buffer.write('content=$_content, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Comment copyWith(
      {String? id,
      Post? post,
      String? content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment(
        id: id ?? this.id,
        post: post ?? this.post,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'post': _post?.toJson(),
        'content': _content,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();

  @override
  String modelName() => 'Comment';
  @override
  Comment fromJson(Map<String, Object?> jsonData) {
    return Comment.fromJson(jsonData);
  }
}
