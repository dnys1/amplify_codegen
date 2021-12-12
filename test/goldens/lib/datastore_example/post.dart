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

import 'package:meta/meta.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'blog.dart';
import 'comment.dart';

/// This is an auto generated class representing the Post type in your schema.
@immutable
class Post extends Model {
  factory Post(
      {String? id,
      required String title,
      required int rating,
      TemporalDateTime? created,
      required String blogId,
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post._internal(
        id: id ?? UUID.getUUID(),
        title: title,
        rating: rating,
        created: created,
        blogId: blogId,
        blog: blog,
        comments: comments != null ? List.unmodifiable(comments) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Post._internal(
      {required this.id,
      required String title,
      required int rating,
      TemporalDateTime? created,
      required String blogId,
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _title = title,
        _rating = rating,
        _created = created,
        _blogId = blogId,
        _blog = blog,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Post.fromJson(Map<String, Object?> json) {
    return Post._internal(
        id: (json['id'] as String),
        title: (json['title'] as String),
        rating: (json['rating'] as int),
        created: json['created'] == null
            ? null
            : TemporalDateTime.fromString((json['created'] as String)),
        blogId: (json['blogID'] as String),
        blog: json['blog'] != null
            ? Blog.fromJson((json['blog'] as Map).cast<String, Object?>())
            : null,
        comments: (json['comments'] as List?)
            ?.cast<Map?>()
            .map((el) => el != null
                ? Comment.fromJson(el.cast<String, Object?>())
                : null)
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : TemporalDateTime.fromString((json['createdAt'] as String)),
        updatedAt: json['updatedAt'] == null
            ? null
            : TemporalDateTime.fromString((json['updatedAt'] as String)));
  }

  static const _PostModelType classType = _PostModelType();

  final String id;

  final String? _title;

  final int? _rating;

  final TemporalDateTime? _created;

  final String? _blogId;

  final Blog? _blog;

  final List<Comment?>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const TITLE = QueryField<dynamic>(fieldName: 'title');

  static const RATING = QueryField<dynamic>(fieldName: 'rating');

  static const CREATED = QueryField<dynamic>(fieldName: 'created');

  static const BLOG_ID = QueryField<dynamic>(fieldName: 'blogID');

  static const BLOG = QueryField<dynamic>(
      fieldName: 'blog',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Blog'));

  static const COMMENTS = QueryField<dynamic>(
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
        key: TITLE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: RATING,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: CREATED,
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: BLOG_ID,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: BLOG,
        ofModelName: 'Blog',
        targetName: 'blogID'));
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

  int get rating {
    if (_rating == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _rating!;
  }

  TemporalDateTime? get created => _created;
  String get blogId {
    if (_blogId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _blogId!;
  }

  Blog? get blog => _blog;
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
          _rating == other._rating &&
          _created == other._created &&
          _blogId == other._blogId &&
          _blog == other._blog &&
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
    buffer.write('rating=$_rating, ');
    buffer.write('created=$_created, ');
    buffer.write('blogId=$_blogId, ');
    buffer.write('blog=$_blog, ');
    buffer.write('comments=$_comments, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  Post copyWith(
      {String? id,
      String? title,
      int? rating,
      TemporalDateTime? created,
      String? blogId,
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        rating: rating ?? this.rating,
        created: created ?? this.created,
        blogId: blogId ?? this.blogId,
        blog: blog ?? this.blog,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'title': _title,
        'rating': _rating,
        'created': _created?.format(),
        'blogID': _blogId,
        'blog': _blog?.toJson(),
        'comments': _comments?.map((el) => el?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  Post fromJson(Map<String, Object?> jsonData) {
    return Post.fromJson(jsonData);
  }
}
