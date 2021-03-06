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

library models.bidi_team2;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'bidi_project2.dart';

/// This is an auto generated class representing the BidiTeam2 type in your schema.
@immutable
class BidiTeam2 extends Model {
  factory BidiTeam2(
      {String? id,
      required String name,
      BidiProject2? project,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiTeam2._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        project: project,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const BidiTeam2._internal(
      {required this.id,
      required String name,
      BidiProject2? project,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _project = project,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  BidiTeam2.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _project =
            ((json['project'] as Map?)?['serializedData'] as Map?) != null
                ? BidiProject2.fromJson(
                    ((json['project'] as Map)['serializedData'] as Map)
                        .cast<String, Object?>())
                : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _BidiTeam2ModelType classType = _BidiTeam2ModelType();

  final String id;

  final String? _name;

  final BidiProject2? _project;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'bidiTeam2.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const project$ = QueryField<dynamic>(
      fieldName: 'project',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: 'BidiProject2'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'BidiTeam2';
    modelSchemaDefinition.pluralName = 'BidiTeam2s';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: project$,
        ofModelName: 'BidiProject2',
        targetName: 'projectID'));
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
  _BidiTeam2ModelType getInstanceType() => classType;
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

  BidiProject2? get project => _project;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is BidiTeam2 &&
          id == other.id &&
          _name == other._name &&
          _project == other._project &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('BidiTeam2 {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('project=$_project, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  BidiTeam2 copyWith(
      {String? id,
      String? name,
      BidiProject2? project,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return BidiTeam2(
        id: id ?? this.id,
        name: name ?? this.name,
        project: project ?? this.project,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'project': _project?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _BidiTeam2ModelType extends ModelType<BidiTeam2> {
  const _BidiTeam2ModelType();

  @override
  String modelName() => 'BidiTeam2';
  @override
  BidiTeam2 fromJson(Map<String, Object?> jsonData) {
    return BidiTeam2.fromJson(jsonData);
  }
}
