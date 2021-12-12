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
      {required String name,
      required String email,
      String? meta,
      String? avatar,
      String? lastIPAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn}) {
    return User._internal(
        name: name,
        email: email,
        meta: meta,
        avatar: avatar,
        lastIPAddress: lastIPAddress,
        phone: phone,
        lastActivity: lastActivity,
        workStart: workStart,
        workEnd: workEnd,
        birthday: birthday,
        joinedOn: joinedOn);
  }

  const User._internal(
      {required String name,
      required String email,
      String? meta,
      String? avatar,
      String? lastIPAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn})
      : _name = name,
        _email = email,
        _meta = meta,
        _avatar = avatar,
        _lastIPAddress = lastIPAddress,
        _phone = phone,
        _lastActivity = lastActivity,
        _workStart = workStart,
        _workEnd = workEnd,
        _birthday = birthday,
        _joinedOn = joinedOn;

  factory User.fromJson(Map<String, Object?> json) {
    return User._internal(
        name: (json['name'] as String),
        email: (json['email'] as String),
        meta: (json['meta'] as String?),
        avatar: (json['avatar'] as String?),
        lastIPAddress: (json['lastIPAddress'] as String?),
        phone: (json['phone'] as String?),
        lastActivity: (json['lastActivity'] as TemporalTimestamp?),
        workStart: (json['workStart'] as TemporalTime?),
        workEnd: (json['workEnd'] as TemporalTime?),
        birthday: (json['birthday'] as TemporalDate?),
        joinedOn: (json['joinedOn'] as TemporalDateTime?));
  }

  static const _UserModelType classType = _UserModelType();

  final String? _name;

  final String? _email;

  final String? _meta;

  final String? _avatar;

  final String? _lastIPAddress;

  final String? _phone;

  final TemporalTimestamp? _lastActivity;

  final TemporalTime? _workStart;

  final TemporalTime? _workEnd;

  final TemporalDate? _birthday;

  final TemporalDateTime? _joinedOn;

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const EMAIL = QueryField<dynamic>(fieldName: 'email');

  static const META = QueryField<dynamic>(fieldName: 'meta');

  static const AVATAR = QueryField<dynamic>(fieldName: 'avatar');

  static const LAST_I_P_ADDRESS =
      QueryField<dynamic>(fieldName: 'lastIPAddress');

  static const PHONE = QueryField<dynamic>(fieldName: 'phone');

  static const LAST_ACTIVITY = QueryField<dynamic>(fieldName: 'lastActivity');

  static const WORK_START = QueryField<dynamic>(fieldName: 'workStart');

  static const WORK_END = QueryField<dynamic>(fieldName: 'workEnd');

  static const BIRTHDAY = QueryField<dynamic>(fieldName: 'birthday');

  static const JOINED_ON = QueryField<dynamic>(fieldName: 'joinedOn');

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'User';
    modelSchemaDefinition.pluralName = 'Users';
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: EMAIL,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: META,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: AVATAR,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: LAST_I_P_ADDRESS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: PHONE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: LAST_ACTIVITY,
        ofType: const ModelFieldType(ModelFieldTypeEnum.timestamp),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: WORK_START,
        ofType: const ModelFieldType(ModelFieldTypeEnum.time),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: WORK_END,
        ofType: const ModelFieldType(ModelFieldTypeEnum.time),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: BIRTHDAY,
        ofType: const ModelFieldType(ModelFieldTypeEnum.date),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: JOINED_ON,
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
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
  });

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
  String? get lastIPAddress => _lastIPAddress;
  String? get phone => _phone;
  TemporalTimestamp? get lastActivity => _lastActivity;
  TemporalTime? get workStart => _workStart;
  TemporalTime? get workEnd => _workEnd;
  TemporalDate? get birthday => _birthday;
  TemporalDateTime? get joinedOn => _joinedOn;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is User &&
          _name == other._name &&
          _email == other._email &&
          _meta == other._meta &&
          _avatar == other._avatar &&
          _lastIPAddress == other._lastIPAddress &&
          _phone == other._phone &&
          _lastActivity == other._lastActivity &&
          _workStart == other._workStart &&
          _workEnd == other._workEnd &&
          _birthday == other._birthday &&
          _joinedOn == other._joinedOn;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('User {');
    buffer.write('name=$_name, ');
    buffer.write('email=$_email, ');
    buffer.write('meta=$_meta, ');
    buffer.write('avatar=$_avatar, ');
    buffer.write('lastIPAddress=$_lastIPAddress, ');
    buffer.write('phone=$_phone, ');
    buffer.write('lastActivity=$_lastActivity, ');
    buffer.write('workStart=$_workStart, ');
    buffer.write('workEnd=$_workEnd, ');
    buffer.write('birthday=$_birthday, ');
    buffer.write('joinedOn=$_joinedOn');
    buffer.write('}');

    return buffer.toString();
  }

  User copyWith(
      {String? name,
      String? email,
      String? meta,
      String? avatar,
      String? lastIPAddress,
      String? phone,
      TemporalTimestamp? lastActivity,
      TemporalTime? workStart,
      TemporalTime? workEnd,
      TemporalDate? birthday,
      TemporalDateTime? joinedOn}) {
    return User(
        name: name ?? this.name,
        email: email ?? this.email,
        meta: meta ?? this.meta,
        avatar: avatar ?? this.avatar,
        lastIPAddress: lastIPAddress ?? this.lastIPAddress,
        phone: phone ?? this.phone,
        lastActivity: lastActivity ?? this.lastActivity,
        workStart: workStart ?? this.workStart,
        workEnd: workEnd ?? this.workEnd,
        birthday: birthday ?? this.birthday,
        joinedOn: joinedOn ?? this.joinedOn);
  }

  @override
  Map<String, Object?> toJson() => {
        'name': _name,
        'email': _email,
        'meta': _meta,
        'avatar': _avatar,
        'lastIPAddress': _lastIPAddress,
        'phone': _phone,
        'lastActivity': _lastActivity,
        'workStart': _workStart,
        'workEnd': _workEnd,
        'birthday': _birthday,
        'joinedOn': _joinedOn
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
