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

library models.person;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'license.dart';

/// This is an auto generated class representing the Person type in your schema.
@immutable
class Person extends Model {
  factory Person(
      {String? id,
      required String name,
      License? license,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Person._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        license: license,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Person._internal(
      {required this.id,
      required String name,
      License? license,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _license = license,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Person.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _license =
            ((json['license'] as Map?)?['serializedData'] as Map?) != null
                ? License.fromJson(
                    ((json['license'] as Map)['serializedData'] as Map)
                        .cast<String, Object?>())
                : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _PersonModelType classType = _PersonModelType();

  final String id;

  final String? _name;

  final License? _license;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'person.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const license$ = QueryField<dynamic>(
      fieldName: 'license',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'License'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Person';
    modelSchemaDefinition.pluralName = 'Persons';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        isRequired: false,
        key: license$,
        ofModelName: 'License',
        associatedKey: License.belongsTo$));
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
    0x06,
    0x50,
    0x65,
    0x72,
    0x73,
    0x6f,
    0x6e,
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
    0x12,
    0x0a,
    0x04,
    0x6e,
    0x61,
    0x6d,
    0x65,
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
    0x47,
    0x0a,
    0x07,
    0x6c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
    0x12,
    0x0f,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x07,
    0x4c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x01,
    0x3a,
    0x0f,
    0x70,
    0x65,
    0x72,
    0x73,
    0x6f,
    0x6e,
    0x4c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
    0x49,
    0x64,
    0x42,
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
    0x4a,
    0x07,
    0x4c,
    0x69,
    0x63,
    0x65,
    0x6e,
    0x73,
    0x65,
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
  _PersonModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get name {
    if (_name == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _name!;
  }

  License? get license => _license;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Person &&
          id == other.id &&
          _name == other._name &&
          _license == other._license &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Person {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('license=$_license, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Person copyWith(
      {String? id,
      String? name,
      License? license,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Person(
        id: id ?? this.id,
        name: name ?? this.name,
        license: license ?? this.license,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'license': _license?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _PersonModelType extends ModelType<Person> {
  const _PersonModelType();

  @override
  String modelName() => 'Person';
  @override
  Person fromJson(Map<String, Object?> jsonData) {
    return Person.fromJson(jsonData);
  }
}
