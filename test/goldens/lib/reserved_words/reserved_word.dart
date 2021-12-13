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

library models.reserved_word;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the ReservedWord type in your schema.
@immutable
class ReservedWord extends Model {
  factory ReservedWord(
      {String? id,
      required String class$,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ReservedWord._internal(
        id: id ?? UUID.getUUID(),
        class$: class$,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const ReservedWord._internal(
      {required this.id,
      required String class$,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _class$ = class$,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  ReservedWord.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _class$ = (json['class'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _ReservedWordModelType classType = _ReservedWordModelType();

  final String id;

  final String? _class$;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'reservedWord.id');

  static const class$$ = QueryField<dynamic>(fieldName: 'class');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'ReservedWord';
    modelSchemaDefinition.pluralName = 'ReservedWords';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: class$$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
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
  _ReservedWordModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get class$ {
    if (_class$ == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _class$!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ReservedWord &&
          id == other.id &&
          _class$ == other._class$ &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('ReservedWord {');
    buffer.write('id=$id, ');
    buffer.write('class\$=${_class$}, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  ReservedWord copyWith(
      {String? id,
      String? class$,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return ReservedWord(
        id: id ?? this.id,
        class$: class$ ?? this.class$,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'class': _class$,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _ReservedWordModelType extends ModelType<ReservedWord> {
  const _ReservedWordModelType();

  @override
  String modelName() => 'ReservedWord';
  @override
  ReservedWord fromJson(Map<String, Object?> jsonData) {
    return ReservedWord.fromJson(jsonData);
  }
}
