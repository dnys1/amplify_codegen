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

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'habit.dart';
import 'user.dart';

/// This is an auto generated class representing the Comment type in your schema.
@immutable
class Comment extends Model {
  factory Comment(
      {String? id,
      Habit? habit,
      User? by,
      required String comment,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment._internal(
        id: id ?? UUID.getUUID(),
        habit: habit,
        by: by,
        comment: comment,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Comment._internal(
      {required this.id,
      Habit? habit,
      User? by,
      required String comment,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _habit = habit,
        _by = by,
        _comment = comment,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Comment.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _habit = ((json['habit'] as Map?)?['serializedData'] as Map?) != null
            ? Habit.fromJson(((json['habit'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _by = ((json['by'] as Map?)?['serializedData'] as Map?) != null
            ? User.fromJson(((json['by'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _comment = (json['comment'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _CommentModelType classType = _CommentModelType();

  final String id;

  final Habit? _habit;

  final User? _by;

  final String? _comment;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'comment.id');

  static const habit$ = QueryField<dynamic>(
      fieldName: 'habit',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Habit'));

  static const by$ = QueryField<dynamic>(
      fieldName: 'by',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));

  static const comment$ = QueryField<dynamic>(fieldName: 'comment');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment';
    modelSchemaDefinition.pluralName = 'Comments';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: habit$,
        ofModelName: 'Habit',
        targetName: 'habitId'));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false, key: by$, ofModelName: 'User', targetName: 'owner'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: comment$,
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
    modelSchemaDefinition.authRules = const [
      AuthRule(
          authStrategy: AuthStrategy.GROUPS,
          groupClaim: 'cognito:groups',
          groups: ['admin'],
          operations: [
            ModelOperation.CREATE,
            ModelOperation.READ,
            ModelOperation.UPDATE,
            ModelOperation.DELETE
          ],
          provider: AuthRuleProvider.USERPOOLS),
      AuthRule(
          authStrategy: AuthStrategy.PUBLIC,
          operations: [
            ModelOperation.CREATE,
            ModelOperation.READ,
            ModelOperation.UPDATE,
            ModelOperation.DELETE
          ],
          provider: AuthRuleProvider.APIKEY),
      AuthRule(
          authStrategy: AuthStrategy.PRIVATE,
          operations: [ModelOperation.READ],
          provider: AuthRuleProvider.USERPOOLS),
      AuthRule(
          authStrategy: AuthStrategy.OWNER,
          operations: [
            ModelOperation.CREATE,
            ModelOperation.DELETE,
            ModelOperation.UPDATE
          ],
          ownerField: 'owner',
          identityClaim: 'cognito:username',
          provider: AuthRuleProvider.USERPOOLS)
    ];
  });

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
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
    0x15,
    0x0a,
    0x07,
    0x68,
    0x61,
    0x62,
    0x69,
    0x74,
    0x49,
    0x64,
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
    0x27,
    0x0a,
    0x05,
    0x68,
    0x61,
    0x62,
    0x69,
    0x74,
    0x12,
    0x0d,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x05,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x07,
    0x68,
    0x61,
    0x62,
    0x69,
    0x74,
    0x49,
    0x64,
    0x50,
    0x00,
    0x12,
    0x13,
    0x0a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x12,
    0x04,
    0x08,
    0x02,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x01,
    0x12,
    0x21,
    0x0a,
    0x02,
    0x62,
    0x79,
    0x12,
    0x0c,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x04,
    0x55,
    0x73,
    0x65,
    0x72,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x50,
    0x00,
    0x12,
    0x15,
    0x0a,
    0x07,
    0x63,
    0x6f,
    0x6d,
    0x6d,
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
    0x1a,
    0x2b,
    0x08,
    0x04,
    0x10,
    0x03,
    0x2a,
    0x0e,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x32,
    0x05,
    0x61,
    0x64,
    0x6d,
    0x69,
    0x6e,
    0x3a,
    0x06,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x1a,
    0x0c,
    0x08,
    0x01,
    0x10,
    0x01,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x1a,
    0x06,
    0x08,
    0x02,
    0x10,
    0x03,
    0x40,
    0x01,
    0x1a,
    0x23,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x22,
    0x10,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x40,
    0x02,
    0x40,
    0x04,
    0x40,
    0x03,
    0x20,
    0x00
  ]);

  @override
  _CommentModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  Habit? get habit => _habit;
  User? get by => _by;
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
          _habit == other._habit &&
          _by == other._by &&
          _comment == other._comment &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Comment {');
    buffer.write('id=$id, ');
    buffer.write('habit=$_habit, ');
    buffer.write('by=$_by, ');
    buffer.write('comment=$_comment, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Comment copyWith(
      {String? id,
      Habit? habit,
      User? by,
      String? comment,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Comment(
        id: id ?? this.id,
        habit: habit ?? this.habit,
        by: by ?? this.by,
        comment: comment ?? this.comment,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'habit': _habit?.toJson(),
        'by': _by?.toJson(),
        'comment': _comment,
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
