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

library models.bidi_comment;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'bidi_post.dart';

/// This is an auto generated class representing the BidiComment type in your schema.
@immutable
class BidiComment extends Model {
  factory BidiComment(
      {String? id,
      required String content,
      BidiPost? post,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiComment._internal(
        id: id ?? UUID.getUUID(),
        content: content,
        post: post,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const BidiComment._internal(
      {required this.id,
      required String content,
      BidiPost? post,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _content = content,
        _post = post,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  BidiComment.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _content = (json['content'] as String?),
        _post = ((json['post'] as Map?)?['serializedData'] as Map?) != null
            ? BidiPost.fromJson(((json['post'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _BidiCommentModelType classType = _BidiCommentModelType();

  final String id;

  final String? _content;

  final BidiPost? _post;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'bidiComment.id');

  static const content$ = QueryField<dynamic>(fieldName: 'content');

  static const post$ = QueryField<dynamic>(
      fieldName: 'post',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'BidiPost'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BidiComment';
    modelSchemaDefinition.pluralName = 'BidiComments';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: content$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: post$,
        ofModelName: 'BidiPost',
        targetName: 'postID'));
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
  _BidiCommentModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
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

  BidiPost? get post => _post;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BidiComment &&
          id == other.id &&
          _content == other._content &&
          _post == other._post &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('BidiComment {');
    buffer.write('id=$id, ');
    buffer.write('content=$_content, ');
    buffer.write('post=$_post, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  BidiComment copyWith(
      {String? id,
      String? content,
      BidiPost? post,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiComment(
        id: id ?? this.id,
        content: content ?? this.content,
        post: post ?? this.post,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'content': _content,
        'post': _post?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _BidiCommentModelType extends ModelType<BidiComment> {
  const _BidiCommentModelType();

  @override
  String modelName() => 'BidiComment';
  @override
  BidiComment fromJson(Map<String, Object?> jsonData) {
    return BidiComment.fromJson(jsonData);
  }
}
