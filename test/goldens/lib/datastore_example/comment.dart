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

library models.comment;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the Comment type in your schema.
@immutable
class Comment extends Model {
  factory Comment(
      {String? id,
      required String postID,
      Post? post,
      required String content}) {
    return Comment._internal(
        id: id ?? UUID.getUUID(), postID: postID, post: post, content: content);
  }

  const Comment._internal(
      {required this.id,
      required String postID,
      Post? post,
      required String content})
      : _postID = postID,
        _post = post,
        _content = content;

  factory Comment.fromJson(Map<String, Object?> json) {
    return Comment._internal(
        id: (json['id'] as String),
        postID: (json['postID'] as String),
        post: json['post'] != null
            ? Post.fromJson((json['post'] as Map).cast<String, Object?>())
            : null,
        content: (json['content'] as String));
  }

  static const _CommentModelType classType = _CommentModelType();

  final String id;

  final String? _postID;

  final Post? _post;

  final String? _content;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const POST_I_D = QueryField<dynamic>(fieldName: 'postID');

  static const POST = QueryField<dynamic>(
      fieldName: 'post',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Post'));

  static const CONTENT = QueryField<dynamic>(fieldName: 'content');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment';
    modelSchemaDefinition.pluralName = 'Comments';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: POST_I_D,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: POST,
        ofModelName: 'Post',
        targetName: 'postID'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: CONTENT,
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

  String get postID {
    if (_postID == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _postID!;
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

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Comment &&
          id == other.id &&
          _postID == other._postID &&
          _post == other._post &&
          _content == other._content;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Comment {');
    buffer.write('id=$id, ');
    buffer.write('postID=$_postID, ');
    buffer.write('post=$_post, ');
    buffer.write('content=$_content');
    buffer.write('}');

    return buffer.toString();
  }

  Comment copyWith({String? id, String? postID, Post? post, String? content}) {
    return Comment(
        id: id ?? this.id,
        postID: postID ?? this.postID,
        post: post ?? this.post,
        content: content ?? this.content);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'postID': _postID,
        'post': _post?.toJson(),
        'content': _content
      };
  @override
  _CommentModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();

  @override
  Comment fromJson(Map<String, Object?> jsonData) {
    return Comment.fromJson(jsonData);
  }
}
