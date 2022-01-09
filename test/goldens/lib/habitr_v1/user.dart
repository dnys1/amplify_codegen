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

library models.user;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'comment.dart';
import 'habit.dart';
import 's3_object.dart';

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
      List<String>? downvotedHabits,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return User._internal(
        username: username,
        displayUsername: displayUsername,
        name: name,
        avatar: avatar,
        comments: comments != null ? List.unmodifiable(comments) : null,
        habits: habits != null ? List.unmodifiable(habits) : null,
        upvotedHabits:
            upvotedHabits != null ? List.unmodifiable(upvotedHabits) : null,
        downvotedHabits:
            downvotedHabits != null ? List.unmodifiable(downvotedHabits) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const User._internal(
      {required this.username,
      String? displayUsername,
      String? name,
      S3Object? avatar,
      List<Comment>? comments,
      List<Habit>? habits,
      List<String>? upvotedHabits,
      List<String>? downvotedHabits,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _displayUsername = displayUsername,
        _name = name,
        _avatar = avatar,
        _comments = comments,
        _habits = habits,
        _upvotedHabits = upvotedHabits,
        _downvotedHabits = downvotedHabits,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  User.fromJson(Map<String, Object?> json)
      : username = (json['username'] as String),
        _displayUsername = (json['displayUsername'] as String?),
        _name = (json['name'] as String?),
        _avatar = ((json['avatar'] as Map?)?['serializedData'] as Map?) != null
            ? S3Object.fromJson(
                ((json['avatar'] as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
            : null,
        _comments = (json['comments'] as List?)
            ?.cast<Map>()
            .map((el) => Comment.fromJson(
                (el['serializedData'] as Map).cast<String, Object?>()))
            .toList(),
        _habits = (json['habits'] as List?)
            ?.cast<Map>()
            .map((el) => Habit.fromJson(
                (el['serializedData'] as Map).cast<String, Object?>()))
            .toList(),
        _upvotedHabits = (json['upvotedHabits'] as List?)?.cast<String>(),
        _downvotedHabits = (json['downvotedHabits'] as List?)?.cast<String>(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _UserModelType classType = _UserModelType();

  final String username;

  final String? _displayUsername;

  final String? _name;

  final S3Object? _avatar;

  final List<Comment>? _comments;

  final List<Habit>? _habits;

  final List<String>? _upvotedHabits;

  final List<String>? _downvotedHabits;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const username$ = QueryField<dynamic>(fieldName: 'username');

  static const displayUsername$ =
      QueryField<dynamic>(fieldName: 'displayUsername');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const avatar$ = QueryField<dynamic>(fieldName: 'avatar');

  static const comments$ = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment'));

  static const habits$ = QueryField<dynamic>(
      fieldName: 'habits',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: 'Habit'));

  static const upvotedHabits$ = QueryField<dynamic>(fieldName: 'upvotedHabits');

  static const downvotedHabits$ =
      QueryField<dynamic>(fieldName: 'downvotedHabits');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'User';
    modelSchemaDefinition.pluralName = 'Users';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'username'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: displayUsername$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'avatar',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'S3Object'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment',
        associatedKey: Comment.by$));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: habits$,
        ofModelName: 'Habit',
        associatedKey: Habit.author$));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: upvotedHabits$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: 'string'),
        isArray: true,
        authRules: const [
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
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.READ],
              ownerField: 'username',
              identityClaim: 'cognito:username',
              provider: AuthRuleProvider.USERPOOLS)
        ]));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: downvotedHabits$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: 'string'),
        isArray: true,
        authRules: const [
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
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.READ],
              ownerField: 'username',
              identityClaim: 'cognito:username',
              provider: AuthRuleProvider.USERPOOLS)
        ]));
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
          operations: [ModelOperation.UPDATE],
          ownerField: 'username',
          identityClaim: 'cognito:username',
          provider: AuthRuleProvider.USERPOOLS)
    ];
  });

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x04,
    0x55,
    0x73,
    0x65,
    0x72,
    0x12,
    0x16,
    0x0a,
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x12,
    0x04,
    0x08,
    0x02,
    0x10,
    0x01,
    0x18,
    0x01,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x1d,
    0x0a,
    0x0f,
    0x64,
    0x69,
    0x73,
    0x70,
    0x6c,
    0x61,
    0x79,
    0x55,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x00,
    0x12,
    0x12,
    0x0a,
    0x04,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x00,
    0x12,
    0x20,
    0x0a,
    0x06,
    0x61,
    0x76,
    0x61,
    0x74,
    0x61,
    0x72,
    0x12,
    0x10,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x08,
    0x53,
    0x33,
    0x4f,
    0x62,
    0x6a,
    0x65,
    0x63,
    0x74,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x4b,
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
    0x01,
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
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x42,
    0x02,
    0x62,
    0x79,
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
    0x47,
    0x0a,
    0x06,
    0x68,
    0x61,
    0x62,
    0x69,
    0x74,
    0x73,
    0x12,
    0x1c,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x0d,
    0x08,
    0x0f,
    0x10,
    0x01,
    0x2a,
    0x05,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
    0x30,
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
    0x02,
    0x3a,
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x42,
    0x06,
    0x61,
    0x75,
    0x74,
    0x68,
    0x6f,
    0x72,
    0x4a,
    0x05,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
    0x50,
    0x00,
    0x12,
    0x84,
    0x01,
    0x0a,
    0x0d,
    0x75,
    0x70,
    0x76,
    0x6f,
    0x74,
    0x65,
    0x64,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
    0x73,
    0x12,
    0x0e,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x2a,
    0x00,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x2a,
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
    0x2a,
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
    0x2a,
    0x22,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x01,
    0x50,
    0x00,
    0x12,
    0x86,
    0x01,
    0x0a,
    0x0f,
    0x64,
    0x6f,
    0x77,
    0x6e,
    0x76,
    0x6f,
    0x74,
    0x65,
    0x64,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
    0x73,
    0x12,
    0x0e,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x2a,
    0x00,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x2a,
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
    0x2a,
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
    0x2a,
    0x22,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x01,
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
    0x22,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x08,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x03,
    0x20,
    0x00
  ]);

  @override
  _UserModelType getInstanceType() => classType;
  @override
  String getId() {
    return username;
  }

  String? get displayUsername => _displayUsername;
  String? get name => _name;
  S3Object? get avatar => _avatar;
  List<Comment>? get comments => _comments;
  List<Habit>? get habits => _habits;
  List<String>? get upvotedHabits => _upvotedHabits;
  List<String>? get downvotedHabits => _downvotedHabits;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is User &&
          username == other.username &&
          _displayUsername == other._displayUsername &&
          _name == other._name &&
          _avatar == other._avatar &&
          _comments == other._comments &&
          _habits == other._habits &&
          _upvotedHabits == other._upvotedHabits &&
          _downvotedHabits == other._downvotedHabits &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('User {');
    buffer.write('username=$username, ');
    buffer.write('displayUsername=$_displayUsername, ');
    buffer.write('name=$_name, ');
    buffer.write('avatar=$_avatar, ');
    buffer.write('comments=$_comments, ');
    buffer.write('habits=$_habits, ');
    buffer.write('upvotedHabits=$_upvotedHabits, ');
    buffer.write('downvotedHabits=$_downvotedHabits, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
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
      List<String>? downvotedHabits,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return User(
        username: username ?? this.username,
        displayUsername: displayUsername ?? this.displayUsername,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        comments: comments ?? this.comments,
        habits: habits ?? this.habits,
        upvotedHabits: upvotedHabits ?? this.upvotedHabits,
        downvotedHabits: downvotedHabits ?? this.downvotedHabits,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'username': username,
        'displayUsername': _displayUsername,
        'name': _name,
        'avatar': _avatar?.toJson(),
        'comments': _comments?.map((el) => el.toJson()).toList(),
        'habits': _habits?.map((el) => el.toJson()).toList(),
        'upvotedHabits': _upvotedHabits?.map((el) => el).toList(),
        'downvotedHabits': _downvotedHabits?.map((el) => el).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  String modelName() => 'User';
  @override
  User fromJson(Map<String, Object?> jsonData) {
    return User.fromJson(jsonData);
  }
}
