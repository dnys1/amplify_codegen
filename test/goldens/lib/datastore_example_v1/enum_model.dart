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

library models.enum_model;

enum EnumModel { yes, no }

extension EnumModelValue on EnumModel {
  String get value {
    switch (this) {
      case EnumModel.yes:
        return 'yes';
      case EnumModel.no:
        return 'no';
    }
  }
}

extension EnumModelByValue on List<EnumModel> {
  EnumModel? byValue(String? value) {
    try {
      return EnumModel.values.firstWhere((el) => el.value == value);
    } on StateError {
      return null;
    }
  }
}
