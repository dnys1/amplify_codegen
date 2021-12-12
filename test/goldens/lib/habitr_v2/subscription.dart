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

// ignore_for_file: constant_identifier_names, unnecessary_cast

library models.subscription;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the Subscription type in your schema.
@immutable
class Subscription {
  factory Subscription({User? subscribeToUser, VoteResult? subscribeToVotes}) {
    return Subscription._internal(
        subscribeToUser: subscribeToUser, subscribeToVotes: subscribeToVotes);
  }

  const Subscription._internal(
      {User? subscribeToUser, VoteResult? subscribeToVotes})
      : _subscribeToUser = subscribeToUser,
        _subscribeToVotes = subscribeToVotes;

  factory Subscription.fromJson(Map<String, Object?> json) {
    return Subscription._internal(
        subscribeToUser: json['subscribeToUser'] != null
            ? User.fromJson(
                (json['subscribeToUser'] as Map).cast<String, Object?>())
            : null,
        subscribeToVotes: json['subscribeToVotes'] != null
            ? VoteResult.fromJson(
                (json['subscribeToVotes'] as Map).cast<String, Object?>())
            : null);
  }

  final User? _subscribeToUser;

  final VoteResult? _subscribeToVotes;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Subscription';
    modelSchemaDefinition.pluralName = 'Subscriptions';
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'subscribeToUser',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'User'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'subscribeToVotes',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'VoteResult'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
  });

  User? get subscribeToUser => _subscribeToUser;
  VoteResult? get subscribeToVotes => _subscribeToVotes;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Subscription &&
          _subscribeToUser == other._subscribeToUser &&
          _subscribeToVotes == other._subscribeToVotes;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Subscription {');
    buffer.write('subscribeToUser=$_subscribeToUser, ');
    buffer.write('subscribeToVotes=$_subscribeToVotes');
    buffer.write('}');

    return buffer.toString();
  }

  Subscription copyWith({User? subscribeToUser, VoteResult? subscribeToVotes}) {
    return Subscription(
        subscribeToUser: subscribeToUser ?? this.subscribeToUser,
        subscribeToVotes: subscribeToVotes ?? this.subscribeToVotes);
  }

  Map<String, Object?> toJson() => {
        'subscribeToUser': _subscribeToUser?.toJson(),
        'subscribeToVotes': _subscribeToVotes?.toJson()
      };
}
