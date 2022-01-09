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

library models.license;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'person.dart';

/// This is an auto generated class representing the License type in your schema.
@immutable
class License extends Model {
  factory License(
      {String? id,
      required String number,
      Person? belongsTo,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return License._internal(
        id: id ?? UUID.getUUID(),
        number: number,
        belongsTo: belongsTo,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const License._internal(
      {required this.id,
      required String number,
      Person? belongsTo,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _number = number,
        _belongsTo = belongsTo,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  License.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _number = (json['number'] as String?),
        _belongsTo =
            ((json['belongsTo'] as Map?)?['serializedData'] as Map?) != null
                ? Person.fromJson(
                    ((json['belongsTo'] as Map)['serializedData'] as Map)
                        .cast<String, Object?>())
                : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _LicenseModelType classType = _LicenseModelType();

  final String id;

  final String? _number;

  final Person? _belongsTo;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'license.id');

  static const number$ = QueryField<dynamic>(fieldName: 'number');

  static const belongsTo$ = QueryField<dynamic>(
      fieldName: 'belongsTo',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Person'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'License';
    modelSchemaDefinition.pluralName = 'Licenses';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: number$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: belongsTo$,
        ofModelName: 'Person',
        targetName: 'licenseBelongsToId'));
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        isRequired: false,
        isReadOnly: true,
        fieldName: 'createdAt',
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
        isRequired: false,
        isReadOnly: true,
        fieldName: 'updatedAt',
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
  });

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x07,
    0x4c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
    0x12,
    0x10,
    0x0a,
    0x02,
    0x69,
    0x64,
    0x12,
    0x04,
    0x08,
    0x01,
    0x10,
    0x01,
    0x18,
    0x01,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x14,
    0x0a,
    0x06,
    0x6e,
    0x75,
    0x6d,
    0x62,
    0x65,
    0x72,
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
    0x50,
    0x00,
    0x12,
    0x37,
    0x0a,
    0x09,
    0x62,
    0x65,
    0x6c,
    0x6f,
    0x6e,
    0x67,
    0x73,
    0x54,
    0x6f,
    0x12,
    0x0e,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x06,
    0x50,
    0x65,
    0x72,
    0x73,
    0x6f,
    0x6e,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x12,
    0x6c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
    0x42,
    0x65,
    0x6c,
    0x6f,
    0x6e,
    0x67,
    0x73,
    0x54,
    0x6f,
    0x49,
    0x64,
    0x50,
    0x00,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x63,
    0x72,
    0x65,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x12,
    0x17,
    0x0a,
    0x09,
    0x75,
    0x70,
    0x64,
    0x61,
    0x74,
    0x65,
    0x64,
    0x41,
    0x74,
    0x12,
    0x06,
    0x08,
    0x08,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x01,
    0x50,
    0x00,
    0x20,
    0x00
  ]);

  @override
  _LicenseModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get number {
    if (_number == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _number!;
  }

  Person? get belongsTo => _belongsTo;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is License &&
          id == other.id &&
          _number == other._number &&
          _belongsTo == other._belongsTo &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('License {');
    buffer.write('id=$id, ');
    buffer.write('number=$_number, ');
    buffer.write('belongsTo=$_belongsTo, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  License copyWith(
      {String? id,
      String? number,
      Person? belongsTo,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return License(
        id: id ?? this.id,
        number: number ?? this.number,
        belongsTo: belongsTo ?? this.belongsTo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'number': _number,
        'belongsTo': _belongsTo?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _LicenseModelType extends ModelType<License> {
  const _LicenseModelType();

  @override
  String modelName() => 'License';
  @override
  License fromJson(Map<String, Object?> jsonData) {
    return License.fromJson(jsonData);
  }
}
