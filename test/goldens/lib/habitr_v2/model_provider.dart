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

library models.model_provider;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'user.dart';
import 'habit.dart';
import 'comment.dart';
import 'vote_result.dart';
import 's3_object.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'comment.dart';
import 'habit.dart';
import 's3_object.dart';
import 'user.dart';
import 'vote_result.dart';
export 'access_level.dart';
export 'category.dart';
export 'comment.dart';
export 'habit.dart';
export 's3_object.dart';
export 'user.dart';
export 'vote_result.dart';
export 'vote_type.dart';

class ModelProvider extends ModelProviderInterface {
  static final instance = ModelProvider();

  @override
  String get version => '0eeac06afe55e757692970f73ba088fb09ce7b49';
  @override
  List<ModelSchema> get modelSchemas =>
      [User.schema, Habit.schema, Comment.schema];
  @override
  List<ModelSchema> get customTypeSchemas =>
      [VoteResult.schema, S3Object.schema];
  @override
  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case 'User':
        return User.classType;
      case 'Habit':
        return Habit.classType;
      case 'Comment':
        return Comment.classType;
      default:
        throw ArgumentError(
            'Failed to find model in model provider for model name: ' +
                modelName);
    }
  }
}