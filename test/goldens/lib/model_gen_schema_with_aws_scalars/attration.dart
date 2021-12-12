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

library models.attration;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'status.dart';

/// This is an auto generated class representing the Attration type in your schema.
@immutable
class Attration extends Model {
  factory Attration(
      {String? id,
      required String name,
      required Status status,
      List<String?>? tags,
      required TemporalDate lastUpdate,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Attration._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        status: status,
        tags: tags != null ? List.unmodifiable(tags) : null,
        lastUpdate: lastUpdate,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Attration._internal(
      {required this.id,
      required String name,
      required Status status,
      List<String?>? tags,
      required TemporalDate lastUpdate,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _status = status,
        _tags = tags,
        _lastUpdate = lastUpdate,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Attration.fromJson(Map<String, Object?> json) {
    return Attration._internal(
        id: (json['id'] as String),
        name: (json['name'] as String),
        status: Status.values.byValue((json['status'] as String?))!,
        tags: (json['tags'] as List?)?.cast<String?>(),
        lastUpdate: TemporalDate.fromString((json['lastUpdate'] as String)),
        createdAt: json['createdAt'] == null
            ? null
            : TemporalDateTime.fromString((json['createdAt'] as String)),
        updatedAt: json['updatedAt'] == null
            ? null
            : TemporalDateTime.fromString((json['updatedAt'] as String)));
  }

  static const _AttrationModelType classType = _AttrationModelType();

  final String id;

  final String? _name;

  final Status? _status;

  final List<String?>? _tags;

  final TemporalDate? _lastUpdate;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const NAME = QueryField<dynamic>(fieldName: 'name');

  static const STATUS = QueryField<dynamic>(fieldName: 'status');

  static const TAGS = QueryField<dynamic>(fieldName: 'tags');

  static const LAST_UPDATE = QueryField<dynamic>(fieldName: 'lastUpdate');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Attration';
    modelSchemaDefinition.pluralName = 'Attrations';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: NAME,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: STATUS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.enumeration),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: TAGS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: 'collection'),
        isArray: true));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: LAST_UPDATE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.date),
        isArray: false));
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
  _AttrationModelType getInstanceType() => classType;
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

  Status get status {
    if (_status == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _status!;
  }

  List<String?>? get tags => _tags;
  TemporalDate get lastUpdate {
    if (_lastUpdate == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _lastUpdate!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Attration &&
          id == other.id &&
          _name == other._name &&
          _status == other._status &&
          _tags == other._tags &&
          _lastUpdate == other._lastUpdate &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('Attration {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('status=$_status, ');
    buffer.write('tags=$_tags, ');
    buffer.write('lastUpdate=$_lastUpdate, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  Attration copyWith(
      {String? id,
      String? name,
      Status? status,
      List<String?>? tags,
      TemporalDate? lastUpdate,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Attration(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        tags: tags ?? this.tags,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'status': _status?.value,
        'tags': _tags?.map((el) => el).toList(),
        'lastUpdate': _lastUpdate?.format(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _AttrationModelType extends ModelType<Attration> {
  const _AttrationModelType();

  @override
  Attration fromJson(Map<String, Object?> jsonData) {
    return Attration.fromJson(jsonData);
  }
}
