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
import 'model_provider.dart';

/// This is an auto generated class representing the VoteResult type in your schema.
@immutable
class VoteResult {
  factory VoteResult({Habit? habit, User? user}) {
    return VoteResult._internal(habit: habit, user: user);
  }

  const VoteResult._internal({Habit? habit, User? user})
      : _habit = habit,
        _user = user;

  factory VoteResult.fromJson(Map<String, Object?> json) {
    return VoteResult._internal(
        habit: json['habit'] != null
            ? Habit.fromJson((json['habit'] as Map).cast<String, Object?>())
            : null,
        user: json['user'] != null
            ? User.fromJson((json['user'] as Map).cast<String, Object?>())
            : null);
  }

  final Habit? _habit;

  final User? _user;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'VoteResult';
    modelSchemaDefinition.pluralName = 'VoteResults';
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
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
  });

  Habit? get habit => _habit;
  User? get user => _user;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is VoteResult && _habit == other._habit && _user == other._user;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('VoteResult {');
    buffer.write('habit=$_habit, ');
    buffer.write('user=$_user');
    buffer.write('}');

    return buffer.toString();
  }

  VoteResult copyWith({Habit? habit, User? user}) {
    return VoteResult(habit: habit ?? this.habit, user: user ?? this.user);
  }

  Map<String, Object?> toJson() =>
      {'habit': _habit?.toJson(), 'user': _user?.toJson()};
}
