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

/// This is an auto generated class representing the User type in your schema.
@immutable
class User extends Model {
  factory User(
      {String? id,
      required String name,
      required String email,
      String? meta,
      String? avatar,
      String? lastIpAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return User._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        email: email,
        meta: meta,
        avatar: avatar,
        lastIpAddress: lastIpAddress,
        phone: phone,
        lastActivity: lastActivity,
        workStart: workStart,
        workEnd: workEnd,
        birthday: birthday,
        joinedOn: joinedOn,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const User._internal(
      {required this.id,
      required String name,
      required String email,
      String? meta,
      String? avatar,
      String? lastIpAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _email = email,
        _meta = meta,
        _avatar = avatar,
        _lastIpAddress = lastIpAddress,
        _phone = phone,
        _lastActivity = lastActivity,
        _workStart = workStart,
        _workEnd = workEnd,
        _birthday = birthday,
        _joinedOn = joinedOn,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  User.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _email = (json['email'] as String?),
        _meta = (json['meta'] as String?),
        _avatar = (json['avatar'] as String?),
        _lastIpAddress = (json['lastIPAddress'] as String?),
        _phone = (json['phone'] as String?),
        _lastActivity = json['lastActivity'] != null
            ? TemporalTimestamp.fromSeconds((json['lastActivity'] as int))
            : null,
        _workStart = json['workStart'] != null
            ? TemporalTime.fromString((json['workStart'] as String))
            : null,
        _workEnd = json['workEnd'] != null
            ? TemporalTime.fromString((json['workEnd'] as String))
            : null,
        _birthday = json['birthday'] != null
            ? TemporalDate.fromString((json['birthday'] as String))
            : null,
        _joinedOn = json['joinedOn'] != null
            ? TemporalDateTime.fromString((json['joinedOn'] as String))
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _UserModelType classType = _UserModelType();

  final String id;

  final String? _name;

  final String? _email;

  final String? _meta;

  final String? _avatar;

  final String? _lastIpAddress;

  final String? _phone;

  final TemporalTimestamp? _lastActivity;

  final TemporalTime? _workStart;

  final TemporalTime? _workEnd;

  final TemporalDate? _birthday;

  final TemporalDateTime? _joinedOn;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'user.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const email$ = QueryField<dynamic>(fieldName: 'email');

  static const meta$ = QueryField<dynamic>(fieldName: 'meta');

  static const avatar$ = QueryField<dynamic>(fieldName: 'avatar');

  static const lastIpAddress$ = QueryField<dynamic>(fieldName: 'lastIPAddress');

  static const phone$ = QueryField<dynamic>(fieldName: 'phone');

  static const lastActivity$ = QueryField<dynamic>(fieldName: 'lastActivity');

  static const workStart$ = QueryField<dynamic>(fieldName: 'workStart');

  static const workEnd$ = QueryField<dynamic>(fieldName: 'workEnd');

  static const birthday$ = QueryField<dynamic>(fieldName: 'birthday');

  static const joinedOn$ = QueryField<dynamic>(fieldName: 'joinedOn');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'User';
    modelSchemaDefinition.pluralName = 'Users';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: email$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: meta$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: avatar$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: lastIpAddress$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: phone$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: lastActivity$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.timestamp),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: workStart$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.time),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: workEnd$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.time),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: birthday$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.date),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: joinedOn$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
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
    0x04,
    0x55,
    0x73,
    0x65,
    0x72,
    0x12,
    0x12,
    0x0a,
    0x02,
    0x69,
    0x64,
    0x12,
    0x06,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x00,
    0x18,
    0x01,
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
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x13,
    0x0a,
    0x05,
    0x65,
    0x6d,
    0x61,
    0x69,
    0x6c,
    0x12,
    0x04,
    0x08,
    0x0a,
    0x10,
    0x01,
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
    0x6d,
    0x65,
    0x74,
    0x61,
    0x12,
    0x04,
    0x08,
    0x0b,
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
    0x61,
    0x76,
    0x61,
    0x74,
    0x61,
    0x72,
    0x12,
    0x04,
    0x08,
    0x0d,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x1b,
    0x0a,
    0x0d,
    0x6c,
    0x61,
    0x73,
    0x74,
    0x49,
    0x50,
    0x41,
    0x64,
    0x64,
    0x72,
    0x65,
    0x73,
    0x73,
    0x12,
    0x04,
    0x08,
    0x0e,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x13,
    0x0a,
    0x05,
    0x70,
    0x68,
    0x6f,
    0x6e,
    0x65,
    0x12,
    0x04,
    0x08,
    0x0c,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x1a,
    0x0a,
    0x0c,
    0x6c,
    0x61,
    0x73,
    0x74,
    0x41,
    0x63,
    0x74,
    0x69,
    0x76,
    0x69,
    0x74,
    0x79,
    0x12,
    0x04,
    0x08,
    0x09,
    0x10,
    0x00,
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
    0x77,
    0x6f,
    0x72,
    0x6b,
    0x53,
    0x74,
    0x61,
    0x72,
    0x74,
    0x12,
    0x04,
    0x08,
    0x07,
    0x10,
    0x00,
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
    0x77,
    0x6f,
    0x72,
    0x6b,
    0x45,
    0x6e,
    0x64,
    0x12,
    0x04,
    0x08,
    0x07,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x16,
    0x0a,
    0x08,
    0x62,
    0x69,
    0x72,
    0x74,
    0x68,
    0x64,
    0x61,
    0x79,
    0x12,
    0x04,
    0x08,
    0x06,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x16,
    0x0a,
    0x08,
    0x6a,
    0x6f,
    0x69,
    0x6e,
    0x65,
    0x64,
    0x4f,
    0x6e,
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
  _UserModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get name {
    if (_name == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _name!;
  }

  String get email {
    if (_email == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _email!;
  }

  String? get meta => _meta;
  String? get avatar => _avatar;
  String? get lastIpAddress => _lastIpAddress;
  String? get phone => _phone;
  TemporalTimestamp? get lastActivity => _lastActivity;
  TemporalTime? get workStart => _workStart;
  TemporalTime? get workEnd => _workEnd;
  TemporalDate? get birthday => _birthday;
  TemporalDateTime? get joinedOn => _joinedOn;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is User &&
          id == other.id &&
          _name == other._name &&
          _email == other._email &&
          _meta == other._meta &&
          _avatar == other._avatar &&
          _lastIpAddress == other._lastIpAddress &&
          _phone == other._phone &&
          _lastActivity == other._lastActivity &&
          _workStart == other._workStart &&
          _workEnd == other._workEnd &&
          _birthday == other._birthday &&
          _joinedOn == other._joinedOn &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('User {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('email=$_email, ');
    buffer.write('meta=$_meta, ');
    buffer.write('avatar=$_avatar, ');
    buffer.write('lastIpAddress=$_lastIpAddress, ');
    buffer.write('phone=$_phone, ');
    buffer.write('lastActivity=$_lastActivity, ');
    buffer.write('workStart=$_workStart, ');
    buffer.write('workEnd=$_workEnd, ');
    buffer.write('birthday=$_birthday, ');
    buffer.write('joinedOn=$_joinedOn, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  User copyWith(
      {String? id,
      String? name,
      String? email,
      String? meta,
      String? avatar,
      String? lastIpAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        meta: meta ?? this.meta,
        avatar: avatar ?? this.avatar,
        lastIpAddress: lastIpAddress ?? this.lastIpAddress,
        phone: phone ?? this.phone,
        lastActivity: lastActivity ?? this.lastActivity,
        workStart: workStart ?? this.workStart,
        workEnd: workEnd ?? this.workEnd,
        birthday: birthday ?? this.birthday,
        joinedOn: joinedOn ?? this.joinedOn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'email': _email,
        'meta': _meta,
        'avatar': _avatar,
        'lastIPAddress': _lastIpAddress,
        'phone': _phone,
        'lastActivity': _lastActivity?.toSeconds(),
        'workStart': _workStart?.format(),
        'workEnd': _workEnd?.format(),
        'birthday': _birthday?.format(),
        'joinedOn': _joinedOn?.format(),
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
