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

library models.vote_result;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'habit.dart';
import 'user.dart';

/// This is an auto generated class representing the VoteResult type in your schema.
@immutable
class VoteResult {
  factory VoteResult({String? id, Habit? habit, User? user}) {
    return VoteResult._internal(
        id: id ?? UUID.getUUID(), habit: habit, user: user);
  }

  const VoteResult._internal({required this.id, Habit? habit, User? user})
      : _habit = habit,
        _user = user;

  factory VoteResult.fromJson(Map<String, Object?> json) {
    return VoteResult._internal(
        id: (json['id'] as String),
        habit: ((json['habit'] as Map?)?['serializedData'] as Map?) != null
            ? Habit.fromJson(((json['habit'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        user: ((json['user'] as Map?)?['serializedData'] as Map?) != null
            ? User.fromJson(((json['user'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null);
  }

  final String id;

  final Habit? _habit;

  final User? _user;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'VoteResult';
    modelSchemaDefinition.pluralName = 'VoteResults';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'habit',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'Habit'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'user',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'User'),
        isArray: false));
  });

  Habit? get habit => _habit;
  User? get user => _user;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is VoteResult &&
          id == other.id &&
          _habit == other._habit &&
          _user == other._user;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('VoteResult {');
    buffer.write('id=$id, ');
    buffer.write('habit=$_habit, ');
    buffer.write('user=$_user');
    buffer.write('}');

    return buffer.toString();
  }

  VoteResult copyWith({String? id, Habit? habit, User? user}) {
    return VoteResult(
        id: id ?? this.id, habit: habit ?? this.habit, user: user ?? this.user);
  }

  Map<String, Object?> toJson() =>
      {'id': id, 'habit': _habit?.toJson(), 'user': _user?.toJson()};
}
