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

library models.project;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'team.dart';

/// This is an auto generated class representing the Project type in your schema.
@immutable
class Project extends Model {
  factory Project(
      {String? id,
      String? name,
      Team? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Project._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        team: team,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Project._internal(
      {required this.id,
      String? name,
      Team? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _team = team,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Project.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _team = ((json['team'] as Map?)?['serializedData'] as Map?) != null
            ? Team.fromJson(((json['team'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _ProjectModelType classType = _ProjectModelType();

  final String id;

  final String? _name;

  final Team? _team;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'project.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const team$ = QueryField<dynamic>(
      fieldName: 'team',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Team'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Project';
    modelSchemaDefinition.pluralName = 'Projects';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
        isRequired: false,
        key: team$,
        ofModelName: 'Team',
        associatedKey: Team.id$));
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
  _ProjectModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String? get name => _name;
  Team? get team => _team;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Project &&
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
    buffer.write('Project {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('team=$_team, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Project copyWith(
      {String? id,
      String? name,
      Team? team,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Project(
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

class _ProjectModelType extends ModelType<Project> {
  const _ProjectModelType();

  @override
  String modelName() => 'Project';
  @override
  Project fromJson(Map<String, Object?> jsonData) {
    return Project.fromJson(jsonData);
  }
}
