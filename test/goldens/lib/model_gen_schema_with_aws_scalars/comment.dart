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
  factory Comment({required String comment, Post? post}) {
    return Comment._internal(comment: comment, post: post);
  }

  const Comment._internal({required String comment, Post? post})
      : _comment = comment,
        _post = post;

  factory Comment.fromJson(Map<String, Object?> json) {
    return Comment._internal(
        comment: (json['comment'] as String),
        post: json['post'] != null
            ? Post.fromJson((json['post'] as Map).cast<String, Object?>())
            : null);
  }

  static const _CommentModelType classType = _CommentModelType();

  final String? _comment;

  final Post? _post;

  static const COMMENT = QueryField<dynamic>(fieldName: 'comment');

  static const POST = QueryField<dynamic>(
      fieldName: 'post',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Post'));

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment';
    modelSchemaDefinition.pluralName = 'Comments';
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: COMMENT,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false, key: POST, ofModelName: 'Post', targetName: 'id'));
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
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
  });

  String get comment {
    if (_comment == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _comment!;
  }

  Post? get post => _post;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Comment && _comment == other._comment && _post == other._post;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Comment {');
    buffer.write('comment=$_comment, ');
    buffer.write('post=$_post');
    buffer.write('}');

    return buffer.toString();
  }

  Comment copyWith({String? comment, Post? post}) {
    return Comment(comment: comment ?? this.comment, post: post ?? this.post);
  }

  @override
  Map<String, Object?> toJson() =>
      {'comment': _comment, 'post': _post?.toJson()};
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
