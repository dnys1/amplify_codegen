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

library models.post2;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'comment2.dart';

/// This is an auto generated class representing the Post2 type in your schema.
@immutable
class Post2 extends Model {
  factory Post2(
      {String? id,
      required String title,
      List<Comment2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post2._internal(
        id: id ?? UUID.getUUID(),
        title: title,
        comments: comments != null ? List.unmodifiable(comments) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Post2._internal(
      {required this.id,
      required String title,
      List<Comment2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _title = title,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Post2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _title = (json['title'] as String?),
        _comments = (json['comments'] as List?)
            ?.cast<Map?>()
            .map((el) => (el?['serializedData'] as Map?) != null
                ? Comment2.fromJson(((el as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
                : null)
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _Post2ModelType classType = _Post2ModelType();

  final String id;

  final String? _title;

  final List<Comment2?>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'post2.id');

  static const title$ = QueryField<dynamic>(fieldName: 'title');

  static const comments$ = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment2'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Post2';
    modelSchemaDefinition.pluralName = 'Post2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: title$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment2',
        associatedKey: Comment2.postId$));
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
    0x05,
    0x50,
    0x6f,
    0x73,
    0x74,
    0x32,
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
    0x4c,
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
    0x22,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x10,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x08,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x32,
    0x30,
    0x00,
    0x2a,
    0x08,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x32,
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
    0x06,
    0x70,
    0x6f,
    0x73,
    0x74,
    0x49,
    0x44,
    0x4a,
    0x08,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x32,
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
  _Post2ModelType getInstanceType() => classType;
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

  List<Comment2?>? get comments => _comments;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Post2 &&
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
    buffer.write('Post2 {');
    buffer.write('id=$id, ');
    buffer.write('title=$_title, ');
    buffer.write('comments=$_comments, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Post2 copyWith(
      {String? id,
      String? title,
      List<Comment2?>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Post2(
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

class _Post2ModelType extends ModelType<Post2> {
  const _Post2ModelType();

  @override
  String modelName() => 'Post2';
  @override
  Post2 fromJson(Map<String, Object?> jsonData) {
    return Post2.fromJson(jsonData);
  }
}
