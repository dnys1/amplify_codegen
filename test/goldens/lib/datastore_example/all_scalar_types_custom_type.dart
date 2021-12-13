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

library models.all_scalar_types_custom_type;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'enum_model.dart';
import 'simple_custom_type.dart';

/// This is an auto generated class representing the AllScalarTypesCustomType type in your schema.
@immutable
class AllScalarTypesCustomType {
  factory AllScalarTypesCustomType(
      {String? id,
      required String stringValue,
      required int intValue,
      required double floatValue,
      required bool boolValue,
      required TemporalDate dateValue,
      required TemporalDateTime dateTimeValue,
      required TemporalTime timeValue,
      required TemporalTimestamp timestampValue,
      required String jsonValue,
      required EnumModel enumValue,
      required SimpleCustomType customTypeValue}) {
    return AllScalarTypesCustomType._internal(
        id: id ?? UUID.getUUID(),
        stringValue: stringValue,
        intValue: intValue,
        floatValue: floatValue,
        boolValue: boolValue,
        dateValue: dateValue,
        dateTimeValue: dateTimeValue,
        timeValue: timeValue,
        timestampValue: timestampValue,
        jsonValue: jsonValue,
        enumValue: enumValue,
        customTypeValue: customTypeValue);
  }

  const AllScalarTypesCustomType._internal(
      {required this.id,
      required String stringValue,
      required int intValue,
      required double floatValue,
      required bool boolValue,
      required TemporalDate dateValue,
      required TemporalDateTime dateTimeValue,
      required TemporalTime timeValue,
      required TemporalTimestamp timestampValue,
      required String jsonValue,
      required EnumModel enumValue,
      required SimpleCustomType customTypeValue})
      : _stringValue = stringValue,
        _intValue = intValue,
        _floatValue = floatValue,
        _boolValue = boolValue,
        _dateValue = dateValue,
        _dateTimeValue = dateTimeValue,
        _timeValue = timeValue,
        _timestampValue = timestampValue,
        _jsonValue = jsonValue,
        _enumValue = enumValue,
        _customTypeValue = customTypeValue;

  factory AllScalarTypesCustomType.fromJson(Map<String, Object?> json) {
    return AllScalarTypesCustomType._internal(
        id: (json['id'] as String),
        stringValue: (json['stringValue'] as String),
        intValue: (json['intValue'] as int),
        floatValue: (json['floatValue'] as double),
        boolValue: (json['boolValue'] as bool),
        dateValue: TemporalDate.fromString((json['dateValue'] as String)),
        dateTimeValue:
            TemporalDateTime.fromString((json['dateTimeValue'] as String)),
        timeValue: TemporalTime.fromString((json['timeValue'] as String)),
        timestampValue:
            TemporalTimestamp.fromSeconds((json['timestampValue'] as int)),
        jsonValue: (json['jsonValue'] as String),
        enumValue: EnumModel.values.byValue((json['enumValue'] as String?))!,
        customTypeValue: SimpleCustomType.fromJson(
            ((json['customTypeValue'] as Map)['serializedData'] as Map)
                .cast<String, Object?>()));
  }

  final String id;

  final String? _stringValue;

  final int? _intValue;

  final double? _floatValue;

  final bool? _boolValue;

  final TemporalDate? _dateValue;

  final TemporalDateTime? _dateTimeValue;

  final TemporalTime? _timeValue;

  final TemporalTimestamp? _timestampValue;

  final String? _jsonValue;

  final EnumModel? _enumValue;

  final SimpleCustomType? _customTypeValue;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'AllScalarTypesCustomType';
    modelSchemaDefinition.pluralName = 'AllScalarTypesCustomTypes';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'stringValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'intValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'floatValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.double),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'boolValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.bool),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'dateValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.date),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'dateTimeValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.dateTime),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'timeValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.time),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'timestampValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.timestamp),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'jsonValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
        isRequired: true,
        fieldName: 'enumValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.enumeration),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: true,
        fieldName: 'customTypeValue',
        ofType: const ModelFieldType(ModelFieldTypeEnum.embedded,
            ofCustomTypeName: 'SimpleCustomType'),
        isArray: false));
  });

  String get stringValue {
    if (_stringValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _stringValue!;
  }

  int get intValue {
    if (_intValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _intValue!;
  }

  double get floatValue {
    if (_floatValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _floatValue!;
  }

  bool get boolValue {
    if (_boolValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _boolValue!;
  }

  TemporalDate get dateValue {
    if (_dateValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _dateValue!;
  }

  TemporalDateTime get dateTimeValue {
    if (_dateTimeValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _dateTimeValue!;
  }

  TemporalTime get timeValue {
    if (_timeValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _timeValue!;
  }

  TemporalTimestamp get timestampValue {
    if (_timestampValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _timestampValue!;
  }

  String get jsonValue {
    if (_jsonValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _jsonValue!;
  }

  EnumModel get enumValue {
    if (_enumValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _enumValue!;
  }

  SimpleCustomType get customTypeValue {
    if (_customTypeValue == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _customTypeValue!;
  }

  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is AllScalarTypesCustomType &&
          id == other.id &&
          _stringValue == other._stringValue &&
          _intValue == other._intValue &&
          _floatValue == other._floatValue &&
          _boolValue == other._boolValue &&
          _dateValue == other._dateValue &&
          _dateTimeValue == other._dateTimeValue &&
          _timeValue == other._timeValue &&
          _timestampValue == other._timestampValue &&
          _jsonValue == other._jsonValue &&
          _enumValue == other._enumValue &&
          _customTypeValue == other._customTypeValue;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('AllScalarTypesCustomType {');
    buffer.write('id=$id, ');
    buffer.write('stringValue=$_stringValue, ');
    buffer.write('intValue=$_intValue, ');
    buffer.write('floatValue=$_floatValue, ');
    buffer.write('boolValue=$_boolValue, ');
    buffer.write('dateValue=$_dateValue, ');
    buffer.write('dateTimeValue=$_dateTimeValue, ');
    buffer.write('timeValue=$_timeValue, ');
    buffer.write('timestampValue=$_timestampValue, ');
    buffer.write('jsonValue=$_jsonValue, ');
    buffer.write('enumValue=$_enumValue, ');
    buffer.write('customTypeValue=$_customTypeValue');
    buffer.write('}');

    return buffer.toString();
  }

  AllScalarTypesCustomType copyWith(
      {String? id,
      String? stringValue,
      int? intValue,
      double? floatValue,
      bool? boolValue,
      TemporalDate? dateValue,
      TemporalDateTime? dateTimeValue,
      TemporalTime? timeValue,
      TemporalTimestamp? timestampValue,
      String? jsonValue,
      EnumModel? enumValue,
      SimpleCustomType? customTypeValue}) {
    return AllScalarTypesCustomType(
        id: id ?? this.id,
        stringValue: stringValue ?? this.stringValue,
        intValue: intValue ?? this.intValue,
        floatValue: floatValue ?? this.floatValue,
        boolValue: boolValue ?? this.boolValue,
        dateValue: dateValue ?? this.dateValue,
        dateTimeValue: dateTimeValue ?? this.dateTimeValue,
        timeValue: timeValue ?? this.timeValue,
        timestampValue: timestampValue ?? this.timestampValue,
        jsonValue: jsonValue ?? this.jsonValue,
        enumValue: enumValue ?? this.enumValue,
        customTypeValue: customTypeValue ?? this.customTypeValue);
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'stringValue': _stringValue,
        'intValue': _intValue,
        'floatValue': _floatValue,
        'boolValue': _boolValue,
        'dateValue': _dateValue?.format(),
        'dateTimeValue': _dateTimeValue?.format(),
        'timeValue': _timeValue?.format(),
        'timestampValue': _timestampValue?.toSeconds(),
        'jsonValue': _jsonValue,
        'enumValue': _enumValue?.value,
        'customTypeValue': _customTypeValue?.toJson()
      };
}
