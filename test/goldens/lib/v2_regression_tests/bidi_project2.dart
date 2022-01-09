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

library models.bidi_project2;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'bidi_team2.dart';

/// This is an auto generated class representing the BidiProject2 type in your schema.
@immutable
class BidiProject2 extends Model {
  factory BidiProject2(
      {String? id,
      String? name,
      BidiTeam2? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiProject2._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        team: team,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const BidiProject2._internal(
      {required this.id,
      String? name,
      BidiTeam2? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _team = team,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  BidiProject2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _team = ((json['team'] as Map?)?['serializedData'] as Map?) != null
            ? BidiTeam2.fromJson(
                ((json['team'] as Map)['serializedData'] as Map)
                    .cast<String, Object?>())
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _BidiProject2ModelType classType = _BidiProject2ModelType();

  final String id;

  final String? _name;

  final BidiTeam2? _team;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'bidiProject2.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const team$ = QueryField<dynamic>(
      fieldName: 'team',
      fieldType:
          ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'BidiTeam2'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BidiProject2';
    modelSchemaDefinition.pluralName = 'BidiProject2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        isRequired: false,
        key: team$,
        ofModelName: 'BidiTeam2',
        associatedKey: BidiTeam2.project$));
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
    0x0c,
    0x42,
    0x69,
    0x64,
    0x69,
    0x50,
    0x72,
    0x6f,
    0x6a,
    0x65,
    0x63,
    0x74,
    0x32,
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
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x49,
    0x0a,
    0x04,
    0x74,
    0x65,
    0x61,
    0x6d,
    0x12,
    0x11,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x09,
    0x42,
    0x69,
    0x64,
    0x69,
    0x54,
    0x65,
    0x61,
    0x6d,
    0x32,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x01,
    0x3a,
    0x12,
    0x62,
    0x69,
    0x64,
    0x69,
    0x50,
    0x72,
    0x6f,
    0x6a,
    0x65,
    0x63,
    0x74,
    0x32,
    0x54,
    0x65,
    0x61,
    0x6d,
    0x49,
    0x64,
    0x42,
    0x07,
    0x70,
    0x72,
    0x6f,
    0x6a,
    0x65,
    0x63,
    0x74,
    0x4a,
    0x09,
    0x42,
    0x69,
    0x64,
    0x69,
    0x54,
    0x65,
    0x61,
    0x6d,
    0x32,
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
  _BidiProject2ModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String? get name => _name;
  BidiTeam2? get team => _team;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BidiProject2 &&
          id == other.id &&
          _name == other._name &&
          _team == other._team &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('BidiProject2 {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('team=$_team, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  BidiProject2 copyWith(
      {String? id,
      String? name,
      BidiTeam2? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiProject2(
        id: id ?? this.id,
        name: name ?? this.name,
        team: team ?? this.team,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'team': _team?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _BidiProject2ModelType extends ModelType<BidiProject2> {
  const _BidiProject2ModelType();

  @override
  String modelName() => 'BidiProject2';
  @override
  BidiProject2 fromJson(Map<String, Object?> jsonData) {
    return BidiProject2.fromJson(jsonData);
  }
}
