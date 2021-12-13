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

library models.s3_object;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'access_level.dart';

/// This is an auto generated class representing the S3Object type in your schema.
@immutable
class S3Object {
  factory S3Object(
      {String? id,
      required String bucket,
      required String region,
      required String key,
      String? cognitoId,
      AccessLevel? accessLevel}) {
    return S3Object._internal(
        id: id ?? UUID.getUUID(),
        bucket: bucket,
        region: region,
        key: key,
        cognitoId: cognitoId,
        accessLevel: accessLevel);
  }

  const S3Object._internal(
      {required this.id,
      required String bucket,
      required String region,
      required String key,
      String? cognitoId,
      AccessLevel? accessLevel})
      : _bucket = bucket,
        _region = region,
        _key = key,
        _cognitoId = cognitoId,
        _accessLevel = accessLevel;

  factory S3Object.fromJson(Map<String, Object?> json) {
    return S3Object._internal(
        id: (json['id'] as String),
        bucket: (json['bucket'] as String),
        region: (json['region'] as String),
        key: (json['key'] as String),
        cognitoId: (json['cognitoId'] as String?),
        accessLevel:
            AccessLevel.values.byValue((json['accessLevel'] as String?)));
  }

  final String id;

  final String? _bucket;

  final String? _region;

  final String? _key;

  final String? _cognitoId;

  final AccessLevel? _accessLevel;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'S3Object';
    modelSchemaDefinition.pluralName = 'S3Objects';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'bucket',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'region',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'key',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: false,
        fieldName: 'cognitoId',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: false,
        fieldName: 'accessLevel',
        ofType: const ModelFieldType(ModelFieldTypeEnum.enumeration),
        isArray: false));
  });

  String get bucket {
    if (_bucket == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _bucket!;
  }

  String get region {
    if (_region == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _region!;
  }

  String get key {
    if (_key == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _key!;
  }

  String? get cognitoId => _cognitoId;
  AccessLevel? get accessLevel => _accessLevel;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is S3Object &&
          id == other.id &&
          _bucket == other._bucket &&
          _region == other._region &&
          _key == other._key &&
          _cognitoId == other._cognitoId &&
          _accessLevel == other._accessLevel;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('S3Object {');
    buffer.write('id=$id, ');
    buffer.write('bucket=$_bucket, ');
    buffer.write('region=$_region, ');
    buffer.write('key=$_key, ');
    buffer.write('cognitoId=$_cognitoId, ');
    buffer.write('accessLevel=$_accessLevel');
    buffer.write('}');
    return buffer.toString();
  }

  S3Object copyWith(
      {String? id,
      String? bucket,
      String? region,
      String? key,
      String? cognitoId,
      AccessLevel? accessLevel}) {
    return S3Object(
        id: id ?? this.id,
        bucket: bucket ?? this.bucket,
        region: region ?? this.region,
        key: key ?? this.key,
        cognitoId: cognitoId ?? this.cognitoId,
        accessLevel: accessLevel ?? this.accessLevel);
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'bucket': _bucket,
        'region': _region,
        'key': _key,
        'cognitoId': _cognitoId,
        'accessLevel': _accessLevel?.value
      };
}
