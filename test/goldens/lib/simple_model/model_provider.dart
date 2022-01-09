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

import 'simple_model.dart';

export 'simple_model.dart';

class ModelProvider extends ModelProviderInterface {
  static final instance = ModelProvider();

  @override
  String get version => 'b47ead2815f3288aa223a8a29039637b5426ea16';
  @override
  List<ModelSchema> get modelSchemas => [SimpleModel.schema];
  @override
  List<ModelSchema> get customTypeSchemas => [];
  @override
  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case 'SimpleModel':
        return SimpleModel.classType;
      default:
        throw ArgumentError(
            'Failed to find model in model provider for model name: ' +
                modelName);
    }
  }
}
