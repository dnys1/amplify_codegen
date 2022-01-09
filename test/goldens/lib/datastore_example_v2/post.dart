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

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

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
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post._internal(
        id: id ?? UUID.getUUID(),
        title: title,
        rating: rating,
        created: created,
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
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _title = title,
        _rating = rating,
        _created = created,
        _blog = blog,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Post.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _title = (json['title'] as String?),
        _rating = (json['rating'] as int?),
        _created = json['created'] != null
            ? TemporalDateTime.fromString((json['created'] as String))
            : null,
        _blog = ((json['blog'] as Map?)?['serializedData'] as Map?) != null
            ? Blog.fromJson(((json['blog'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
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

  final int? _rating;

  final TemporalDateTime? _created;

  final Blog? _blog;

  final List<Comment?>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'post.id');

  static const title$ = QueryField<dynamic>(fieldName: 'title');

  static const rating$ = QueryField<dynamic>(fieldName: 'rating');

  static const created$ = QueryField<dynamic>(fieldName: 'created');

  static const blog$ = QueryField<dynamic>(
      fieldName: 'blog',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Blog'));

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
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: rating$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: created$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: blog$,
        ofModelName: 'Blog',
        targetName: 'blogID'));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment',
        associatedKey: Comment.post$));
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

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x04,
    0x50,
    0x6f,
    0x73,
    0x74,
    0x12,
    0x10,
    0x0a,
    0x02,
    0x69,
    0x64,
    0x12,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x01,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x13,
    0x0a,
    0x05,
    0x74,
    0x69,
    0x74,
    0x6c,
    0x65,
    0x12,
    0x04,
    0x08,
    0x02,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x14,
    0x0a,
    0x06,
    0x72,
    0x61,
    0x74,
    0x69,
    0x6e,
    0x67,
    0x12,
    0x04,
    0x08,
    0x03,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x15,
    0x0a,
    0x07,
    0x63,
    0x72,
    0x65,
    0x61,
    0x74,
    0x65,
    0x64,
    0x12,
    0x04,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x14,
    0x0a,
    0x06,
    0x62,
    0x6c,
    0x6f,
    0x67,
    0x49,
    0x44,
    0x12,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x01,
    0x12,
    0x24,
    0x0a,
    0x04,
    0x62,
    0x6c,
    0x6f,
    0x67,
    0x12,
    0x0c,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x04,
    0x42,
    0x6c,
    0x6f,
    0x67,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x06,
    0x62,
    0x6c,
    0x6f,
    0x67,
    0x49,
    0x44,
    0x50,
    0x00,
    0x12,
    0x47,
    0x0a,
    0x08,
    0x63,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x73,
    0x12,
    0x20,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x0f,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x30,
    0x00,
    0x2a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x02,
    0x3a,
    0x02,
    0x69,
    0x64,
    0x42,
    0x04,
    0x70,
    0x6f,
    0x73,
    0x74,
    0x4a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x50,
    0x00,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x63,
    0x72,
    0x65,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x75,
    0x70,
    0x64,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x20,
    0x00
  ]);

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
      Blog? blog,
      List<Comment?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        rating: rating ?? this.rating,
        created: created ?? this.created,
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
        'blog': _blog?.toJson(),
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
