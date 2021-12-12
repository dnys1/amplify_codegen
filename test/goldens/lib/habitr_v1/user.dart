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

library models.user;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the User type in your schema.
@immutable
class User extends Model {
  factory User(
      {required String username,
      String? displayUsername,
      String? name,
      S3Object? avatar,
      List<Comment>? comments,
      List<Habit>? habits,
      List<String>? upvotedHabits,
      List<String>? downvotedHabits}) {
    return User._internal(
        username: username,
        displayUsername: displayUsername,
        name: name,
        avatar: avatar,
        comments: comments != null ? List.unmodifiable(comments) : null,
        habits: habits != null ? List.unmodifiable(habits) : null,
        upvotedHabits:
            upvotedHabits != null ? List.unmodifiable(upvotedHabits) : null,
        downvotedHabits: downvotedHabits != null
            ? List.unmodifiable(downvotedHabits)
            : null);
  }

  const User._internal(
      {required String username,
      String? displayUsername,
      String? name,
      S3Object? avatar,
      List<Comment>? comments,
      List<Habit>? habits,
      List<String>? upvotedHabits,
      List<String>? downvotedHabits})
      : _username = username,
        _displayUsername = displayUsername,
        _name = name,
        _avatar = avatar,
        _comments = comments,
        _habits = habits,
        _upvotedHabits = upvotedHabits,
        _downvotedHabits = downvotedHabits;

  factory User.fromJson(Map<String, Object?> json) {
    return User._internal(
        username: (json['username'] as String),
        displayUsername: (json['displayUsername'] as String?),
        name: (json['name'] as String?),
        avatar: json['avatar'] != null
            ? S3Object.fromJson((json['avatar'] as Map).cast<String, Object?>())
            : null,
        comments: (json['comments'] as List?)
            ?.cast<Map>()
            .map((el) => Comment.fromJson(el.cast<String, Object?>()))
            .toList(),
        habits: (json['habits'] as List?)
            ?.cast<Map>()
            .map((el) => Habit.fromJson(el.cast<String, Object?>()))
            .toList(),
        upvotedHabits: (json['upvotedHabits'] as List?)
            ?.cast<String>()
            .map((el) => el)
            .toList(),
        downvotedHabits: (json['downvotedHabits'] as List?)
            ?.cast<String>()
            .map((el) => el)
            .toList());
  }

  static const _UserModelType classType = _UserModelType();

  final String? _username;

  final String? _displayUsername;

  final String? _name;

  final S3Object? _avatar;

  final List<Comment>? _comments;

  final List<Habit>? _habits;

  final List<String>? _upvotedHabits;

  final List<String>? _downvotedHabits;

  static const USERNAME = QueryField<dynamic>(fieldName: 'username');

  static const DISPLAY_USERNAME =
      QueryField<dynamic>(fieldName: 'displayUsername');

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const AVATAR = QueryField<dynamic>(fieldName: 'avatar');

  static const COMMENTS = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment'));

  static const HABITS = QueryField<dynamic>(
      fieldName: 'habits',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: 'Habit'));

  static const UPVOTED_HABITS = QueryField<dynamic>(fieldName: 'upvotedHabits');

  static const DOWNVOTED_HABITS =
      QueryField<dynamic>(fieldName: 'downvotedHabits');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'User';
    modelSchemaDefinition.pluralName = 'Users';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'username'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: DISPLAY_USERNAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: AVATAR,
        ofType: const ModelFieldType(ModelFieldTypeEnum.model),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: COMMENTS,
        ofModelName: 'Comment',
        associatedKey: Comment.BY));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: HABITS,
        ofModelName: 'Habit',
        associatedKey: Habit.AUTHOR));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: UPVOTED_HABITS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: true));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: DOWNVOTED_HABITS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: true));
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

  String get username {
    if (_username == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _username!;
  }

  String? get displayUsername => _displayUsername;
  String? get name => _name;
  S3Object? get avatar => _avatar;
  List<Comment>? get comments => _comments;
  List<Habit>? get habits => _habits;
  List<String>? get upvotedHabits => _upvotedHabits;
  List<String>? get downvotedHabits => _downvotedHabits;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is User &&
          _username == other._username &&
          _displayUsername == other._displayUsername &&
          _name == other._name &&
          _avatar == other._avatar &&
          _comments == other._comments &&
          _habits == other._habits &&
          _upvotedHabits == other._upvotedHabits &&
          _downvotedHabits == other._downvotedHabits;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('User {');
    buffer.write('username=$_username, ');
    buffer.write('displayUsername=$_displayUsername, ');
    buffer.write('name=$_name, ');
    buffer.write('avatar=$_avatar, ');
    buffer.write('comments=$_comments, ');
    buffer.write('habits=$_habits, ');
    buffer.write('upvotedHabits=$_upvotedHabits, ');
    buffer.write('downvotedHabits=$_downvotedHabits');
    buffer.write('}');

    return buffer.toString();
  }

  User copyWith(
      {String? username,
      String? displayUsername,
      String? name,
      S3Object? avatar,
      List<Comment>? comments,
      List<Habit>? habits,
      List<String>? upvotedHabits,
      List<String>? downvotedHabits}) {
    return User(
        username: username ?? this.username,
        displayUsername: displayUsername ?? this.displayUsername,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        comments: comments ?? this.comments,
        habits: habits ?? this.habits,
        upvotedHabits: upvotedHabits ?? this.upvotedHabits,
        downvotedHabits: downvotedHabits ?? this.downvotedHabits);
  }

  @override
  Map<String, Object?> toJson() => {
        'username': _username,
        'displayUsername': _displayUsername,
        'name': _name,
        'avatar': _avatar?.toJson(),
        'comments': _comments?.map((el) => el.toJson()).toList(),
        'habits': _habits?.map((el) => el.toJson()).toList(),
        'upvotedHabits': _upvotedHabits?.map((el) => el).toList(),
        'downvotedHabits': _downvotedHabits?.map((el) => el).toList()
      };
  @override
  _UserModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, Object?> jsonData) {
    return User.fromJson(jsonData);
  }
}
