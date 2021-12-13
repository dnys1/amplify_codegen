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

library models.model_provider;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

import 'bidi_comment.dart';
import 'bidi_post.dart';
import 'bidi_project.dart';
import 'bidi_project2.dart';
import 'bidi_team.dart';
import 'bidi_team2.dart';
import 'blog7_v2.dart';
import 'comment.dart';
import 'comment2.dart';
import 'comment7_v2.dart';
import 'customer.dart';
import 'post.dart';
import 'post2.dart';
import 'post7_v2.dart';
import 'project.dart';
import 'project2.dart';
import 'team.dart';
import 'team2.dart';
import 'todo.dart';

export 'bidi_comment.dart';
export 'bidi_post.dart';
export 'bidi_project.dart';
export 'bidi_project2.dart';
export 'bidi_team.dart';
export 'bidi_team2.dart';
export 'blog7_v2.dart';
export 'comment.dart';
export 'comment2.dart';
export 'comment7_v2.dart';
export 'customer.dart';
export 'post.dart';
export 'post2.dart';
export 'post7_v2.dart';
export 'project.dart';
export 'project2.dart';
export 'team.dart';
export 'team2.dart';
export 'todo.dart';

class ModelProvider extends ModelProviderInterface {
  static final instance = ModelProvider();

  @override
  String get version => '61478bb586e13346f18045b9bdc9c47825d85c91';
  @override
  List<ModelSchema> get modelSchemas => [
        BidiComment.schema,
        BidiPost.schema,
        BidiProject.schema,
        BidiProject2.schema,
        BidiTeam.schema,
        BidiTeam2.schema,
        Blog7V2.schema,
        Comment.schema,
        Comment2.schema,
        Comment7V2.schema,
        Customer.schema,
        Post.schema,
        Post2.schema,
        Post7V2.schema,
        Project.schema,
        Project2.schema,
        Team.schema,
        Team2.schema,
        Todo.schema
      ];
  @override
  List<ModelSchema> get customTypeSchemas => [];
  @override
  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case 'BidiComment':
        return BidiComment.classType;
      case 'BidiPost':
        return BidiPost.classType;
      case 'BidiProject':
        return BidiProject.classType;
      case 'BidiProject2':
        return BidiProject2.classType;
      case 'BidiTeam':
        return BidiTeam.classType;
      case 'BidiTeam2':
        return BidiTeam2.classType;
      case 'Blog7V2':
        return Blog7V2.classType;
      case 'Comment':
        return Comment.classType;
      case 'Comment2':
        return Comment2.classType;
      case 'Comment7V2':
        return Comment7V2.classType;
      case 'Customer':
        return Customer.classType;
      case 'Post':
        return Post.classType;
      case 'Post2':
        return Post2.classType;
      case 'Post7V2':
        return Post7V2.classType;
      case 'Project':
        return Project.classType;
      case 'Project2':
        return Project2.classType;
      case 'Team':
        return Team.classType;
      case 'Team2':
        return Team2.classType;
      case 'Todo':
        return Todo.classType;
      default:
        throw ArgumentError(
            'Failed to find model in model provider for model name: ' +
                modelName);
    }
  }
}
