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

library models.status;

enum Status { public, private }

extension StatusValue on Status {
  String get value {
    switch (this) {
      case Status.public:
        return 'public';
      case Status.private:
        return 'private';
    }
  }
}

extension StatusByValue on List<Status> {
  Status? byValue(String? value) {
    try {
      return Status.values.firstWhere((el) => el.value == value);
    } on StateError {
      return null;
    }
  }
}
