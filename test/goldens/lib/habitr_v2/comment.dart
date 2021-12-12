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
      required String habitId,
      Habit? habit,
      String? owner,
      User? by,
      required String comment}) {
    return Comment._internal(
        id: id ?? UUID.getUUID(),
        habitId: habitId,
        habit: habit,
        owner: owner,
        by: by,
        comment: comment);
  }

  const Comment._internal(
      {required this.id,
      required String habitId,
      Habit? habit,
      String? owner,
      User? by,
      required String comment})
      : _habitId = habitId,
        _habit = habit,
        _owner = owner,
        _by = by,
        _comment = comment;

  factory Comment.fromJson(Map<String, Object?> json) {
    return Comment._internal(
        id: (json['id'] as String),
        habitId: (json['habitId'] as String),
        habit: json['habit'] != null
            ? Habit.fromJson((json['habit'] as Map).cast<String, Object?>())
            : null,
        owner: (json['owner'] as String?),
        by: json['by'] != null
            ? User.fromJson((json['by'] as Map).cast<String, Object?>())
            : null,
        comment: (json['comment'] as String));
  }

  static const _CommentModelType classType = _CommentModelType();

  final String id;

  final String? _habitId;

  final Habit? _habit;

  final String? _owner;

  final User? _by;

  final String? _comment;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const HABIT_ID = QueryField<dynamic>(fieldName: 'habitId');

  static const HABIT = QueryField<dynamic>(
      fieldName: 'habit',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Habit'));

  static const OWNER = QueryField<dynamic>(fieldName: 'owner');

  static const BY = QueryField<dynamic>(
      fieldName: 'by',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));

  static const COMMENT = QueryField<dynamic>(fieldName: 'comment');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Comment';
    modelSchemaDefinition.pluralName = 'Comments';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: HABIT_ID,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: HABIT,
        ofModelName: 'Habit',
        targetName: 'habitId'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: OWNER,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false, key: BY, ofModelName: 'User', targetName: 'owner'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: COMMENT,
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

  String get habitId {
    if (_habitId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _habitId!;
  }

  Habit? get habit => _habit;
  String? get owner => _owner;
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

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Comment &&
          id == other.id &&
          _habitId == other._habitId &&
          _habit == other._habit &&
          _owner == other._owner &&
          _by == other._by &&
          _comment == other._comment;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Comment {');
    buffer.write('id=$id, ');
    buffer.write('habitId=$_habitId, ');
    buffer.write('habit=$_habit, ');
    buffer.write('owner=$_owner, ');
    buffer.write('by=$_by, ');
    buffer.write('comment=$_comment');
    buffer.write('}');

    return buffer.toString();
  }

  Comment copyWith(
      {String? id,
      String? habitId,
      Habit? habit,
      String? owner,
      User? by,
      String? comment}) {
    return Comment(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        habit: habit ?? this.habit,
        owner: owner ?? this.owner,
        by: by ?? this.by,
        comment: comment ?? this.comment);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'habitId': _habitId,
        'habit': _habit?.toJson(),
        'owner': _owner,
        'by': _by?.toJson(),
        'comment': _comment
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
