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

library models.comment2;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the Comment2 type in your schema.
@immutable
class Comment2 extends Model {
  factory Comment2(
      {String? id,
      required String postId,
      required String content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment2._internal(
        id: id ?? UUID.getUUID(),
        postId: postId,
        content: content,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Comment2._internal(
      {required this.id,
      required String postId,
      required String content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _postId = postId,
        _content = content,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Comment2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _postId = (json['postID'] as String?),
        _content = (json['content'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _Comment2ModelType classType = _Comment2ModelType();

  final String id;

  final String? _postId;

  final String? _content;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'comment2.id');

  static const postId$ = QueryField<dynamic>(fieldName: 'postID');

  static const content$ = QueryField<dynamic>(fieldName: 'content');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment2';
    modelSchemaDefinition.pluralName = 'Comment2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: postId$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
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

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x08,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
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
    0x14,
    0x0a,
    0x06,
    0x70,
    0x6f,
    0x73,
    0x74,
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
    0x00,
    0x12,
    0x15,
    0x0a,
    0x07,
    0x63,
    0x6f,
    0x6e,
    0x74,
    0x65,
    0x6e,
    0x74,
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
  _Comment2ModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get postId {
    if (_postId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _postId!;
  }

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
      other is Comment2 &&
          id == other.id &&
          _postId == other._postId &&
          _content == other._content &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Comment2 {');
    buffer.write('id=$id, ');
    buffer.write('postId=$_postId, ');
    buffer.write('content=$_content, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Comment2 copyWith(
      {String? id,
      String? postId,
      String? content,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment2(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'postID': _postId,
        'content': _content,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _Comment2ModelType extends ModelType<Comment2> {
  const _Comment2ModelType();

  @override
  String modelName() => 'Comment2';
  @override
  Comment2 fromJson(Map<String, Object?> jsonData) {
    return Comment2.fromJson(jsonData);
  }
}
