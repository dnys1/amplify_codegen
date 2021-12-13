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

library models.license;

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

  factory License.fromJson(Map<String, Object?> json) {
    return License._internal(
        id: (json['id'] as String),
        number: (json['number'] as String),
        belongsTo: json['belongsTo'] != null
            ? Person.fromJson(
                (json['belongsTo'] as Map).cast<String, Object?>())
            : null,
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _LicenseModelType classType = _LicenseModelType();

  final String id;

  final String? _number;

  final Person? _belongsTo;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'license.id');

  static const NUMBER = QueryField<dynamic>(fieldName: 'number');

  static const BELONGS_TO = QueryField<dynamic>(
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
        key: NUMBER,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: BELONGS_TO,
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
  License fromJson(Map<String, Object?> jsonData) {
    return License.fromJson(jsonData);
  }
}
