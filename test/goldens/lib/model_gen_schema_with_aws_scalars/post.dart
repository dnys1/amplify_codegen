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

library models.post;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the Post type in your schema.
@immutable
class Post extends Model {
  factory Post(
      {required String title, String? content, List<Comment?>? comments}) {
    return Post._internal(
        title: title,
        content: content,
        comments: comments != null ? List.unmodifiable(comments) : null);
  }

  const Post._internal(
      {required String title, String? content, List<Comment?>? comments})
      : _title = title,
        _content = content,
        _comments = comments;

  factory Post.fromJson(Map<String, Object?> json) {
    return Post._internal(
        title: (json['title'] as String),
        content: (json['content'] as String?),
        comments: (json['comments'] as List?)
            ?.cast<Map?>()
            .map((el) => el != null
                ? Comment.fromJson(el.cast<String, Object?>())
                : null)
            .toList());
  }

  static const _PostModelType classType = _PostModelType();

  final String? _title;

  final String? _content;

  final List<Comment?>? _comments;

  static const TITLE = QueryField<dynamic>(fieldName: 'title');

  static const CONTENT = QueryField<dynamic>(fieldName: 'content');

  static const COMMENTS = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment'));

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Post';
    modelSchemaDefinition.pluralName = 'Posts';
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: TITLE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: CONTENT,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: COMMENTS,
        ofModelName: 'Comment',
        associatedKey: Comment.POST));
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

  String? get content => _content;
  List<Comment?>? get comments => _comments;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Post &&
          _title == other._title &&
          _content == other._content &&
          _comments == other._comments;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Post {');
    buffer.write('title=$_title, ');
    buffer.write('content=$_content, ');
    buffer.write('comments=$_comments');
    buffer.write('}');

    return buffer.toString();
  }

  Post copyWith({String? title, String? content, List<Comment?>? comments}) {
    return Post(
        title: title ?? this.title,
        content: content ?? this.content,
        comments: comments ?? this.comments);
  }

  @override
  Map<String, Object?> toJson() => {
        'title': _title,
        'content': _content,
        'comments': _comments?.map((el) => el?.toJson()).toList()
      };
  @override
  _PostModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  Post fromJson(Map<String, Object?> jsonData) {
    return Post.fromJson(jsonData);
  }
}
