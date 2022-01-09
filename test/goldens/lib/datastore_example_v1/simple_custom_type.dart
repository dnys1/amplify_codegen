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

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the SimpleCustomType type in your schema.
@immutable
class SimpleCustomType {
  factory SimpleCustomType({String? id, required String foo}) {
    return SimpleCustomType._internal(id: id ?? UUID.getUUID(), foo: foo);
  }

  const SimpleCustomType._internal({required this.id, required String foo})
      : _foo = foo;

  SimpleCustomType.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _foo = (json['foo'] as String?);

  final String id;

  final String? _foo;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'SimpleCustomType';
    modelSchemaDefinition.pluralName = 'SimpleCustomTypes';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'foo',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
  });

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x10,
    0x53,
    0x69,
    0x6d,
    0x70,
    0x6c,
    0x65,
    0x43,
    0x75,
    0x73,
    0x74,
    0x6f,
    0x6d,
    0x54,
    0x79,
    0x70,
    0x65,
    0x12,
    0x10,
    0x0a,
    0x02,
    0x69,
    0x64,
    0x12,
    0x06,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x00,
    0x18,
    0x01,
    0x20,
    0x00,
    0x12,
    0x0f,
    0x0a,
    0x03,
    0x66,
    0x6f,
    0x6f,
    0x12,
    0x04,
    0x08,
    0x02,
    0x10,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x20,
    0x01
  ]);

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
      identical(this, other) ||
      other is SimpleCustomType && id == other.id && _foo == other._foo;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('SimpleCustomType {');
    buffer.write('id=$id, ');
    buffer.write('foo=$_foo');
    buffer.write('}');
    return buffer.toString();
  }

  SimpleCustomType copyWith({String? id, String? foo}) {
    return SimpleCustomType(id: id ?? this.id, foo: foo ?? this.foo);
  }

  Map<String, Object?> toJson() => {'id': id, 'foo': _foo};
}
