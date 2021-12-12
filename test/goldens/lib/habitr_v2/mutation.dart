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

library models.mutation;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

/// This is an auto generated class representing the Mutation type in your schema.
@immutable
class Mutation {
  factory Mutation({VoteResult? vote}) {
    return Mutation._internal(vote: vote);
  }

  const Mutation._internal({VoteResult? vote}) : _vote = vote;

  factory Mutation.fromJson(Map<String, Object?> json) {
    return Mutation._internal(
        vote: json['vote'] != null
            ? VoteResult.fromJson((json['vote'] as Map).cast<String, Object?>())
            : null);
  }

  final VoteResult? _vote;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Mutation';
    modelSchemaDefinition.pluralName = 'Mutations';
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'vote',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'VoteResult'),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
  });

  VoteResult? get vote => _vote;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) || other is Mutation && _vote == other._vote;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Mutation {');
    buffer.write('vote=$_vote');
    buffer.write('}');

    return buffer.toString();
  }

  Mutation copyWith({VoteResult? vote}) {
    return Mutation(vote: vote ?? this.vote);
  }

  Map<String, Object?> toJson() => {'vote': _vote?.toJson()};
}
