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

library models.simple_custom_type;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the SimpleCustomType type in your schema.
@immutable
class SimpleCustomType {
  factory SimpleCustomType({required String foo}) {
    return SimpleCustomType._internal(foo: foo);
  }

  const SimpleCustomType._internal({required String foo}) : _foo = foo;

  factory SimpleCustomType.fromJson(Map<String, Object?> json) {
    return SimpleCustomType._internal(foo: (json['foo'] as String));
  }

  final String? _foo;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'SimpleCustomType';
    modelSchemaDefinition.pluralName = 'SimpleCustomTypes';
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        fieldName: 'foo',
        isRequired: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string)));
  });

  String get foo {
    if (_foo == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _foo!;
  }

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) || other is SimpleCustomType && _foo == other._foo;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('SimpleCustomType {');
    buffer.write('foo=$_foo');
    buffer.write('}');

    return buffer.toString();
  }

  SimpleCustomType copyWith({String? foo}) {
    return SimpleCustomType(foo: foo ?? this.foo);
  }

  Map<String, Object?> toJson() => {'foo': _foo};
}
