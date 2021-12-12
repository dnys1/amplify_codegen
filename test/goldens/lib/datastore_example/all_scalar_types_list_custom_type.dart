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

library models.all_scalar_types_list_custom_type;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'enum_model.dart';
import 'simple_custom_type.dart';

/// This is an auto generated class representing the AllScalarTypesListCustomType type in your schema.
@immutable
class AllScalarTypesListCustomType {
  factory AllScalarTypesListCustomType(
      {String? id,
      List<String?>? stringValues,
      List<int?>? intValues,
      List<double?>? floatValues,
      List<bool?>? boolValues,
      List<TemporalDate?>? dateValues,
      List<TemporalDateTime?>? dateTimeValues,
      List<TemporalTime?>? timeValues,
      List<TemporalTimestamp?>? timestampValues,
      List<String?>? jsonValues,
      List<EnumModel?>? enumValues,
      List<SimpleCustomType?>? customTypeValues}) {
    return AllScalarTypesListCustomType._internal(
        id: id ?? UUID.getUUID(),
        stringValues:
            stringValues != null ? List.unmodifiable(stringValues) : null,
        intValues: intValues != null ? List.unmodifiable(intValues) : null,
        floatValues:
            floatValues != null ? List.unmodifiable(floatValues) : null,
        boolValues: boolValues != null ? List.unmodifiable(boolValues) : null,
        dateValues: dateValues != null ? List.unmodifiable(dateValues) : null,
        dateTimeValues:
            dateTimeValues != null ? List.unmodifiable(dateTimeValues) : null,
        timeValues: timeValues != null ? List.unmodifiable(timeValues) : null,
        timestampValues:
            timestampValues != null ? List.unmodifiable(timestampValues) : null,
        jsonValues: jsonValues != null ? List.unmodifiable(jsonValues) : null,
        enumValues: enumValues != null ? List.unmodifiable(enumValues) : null,
        customTypeValues: customTypeValues != null
            ? List.unmodifiable(customTypeValues)
            : null);
  }

  const AllScalarTypesListCustomType._internal(
      {required this.id,
      List<String?>? stringValues,
      List<int?>? intValues,
      List<double?>? floatValues,
      List<bool?>? boolValues,
      List<TemporalDate?>? dateValues,
      List<TemporalDateTime?>? dateTimeValues,
      List<TemporalTime?>? timeValues,
      List<TemporalTimestamp?>? timestampValues,
      List<String?>? jsonValues,
      List<EnumModel?>? enumValues,
      List<SimpleCustomType?>? customTypeValues})
      : _stringValues = stringValues,
        _intValues = intValues,
        _floatValues = floatValues,
        _boolValues = boolValues,
        _dateValues = dateValues,
        _dateTimeValues = dateTimeValues,
        _timeValues = timeValues,
        _timestampValues = timestampValues,
        _jsonValues = jsonValues,
        _enumValues = enumValues,
        _customTypeValues = customTypeValues;

  factory AllScalarTypesListCustomType.fromJson(Map<String, Object?> json) {
    return AllScalarTypesListCustomType._internal(
        id: (json['id'] as String),
        stringValues: (json['stringValues'] as List?)?.cast<String?>(),
        intValues: (json['intValues'] as List?)?.cast<int?>(),
        floatValues: (json['floatValues'] as List?)?.cast<double?>(),
        boolValues: (json['boolValues'] as List?)?.cast<bool?>(),
        dateValues: (json['dateValues'] as List?)
            ?.cast<String?>()
            .map((el) => el == null ? null : TemporalDate.fromString(el))
            .toList(),
        dateTimeValues: (json['dateTimeValues'] as List?)
            ?.cast<String?>()
            .map((el) => el == null ? null : TemporalDateTime.fromString(el))
            .toList(),
        timeValues: (json['timeValues'] as List?)
            ?.cast<String?>()
            .map((el) => el == null ? null : TemporalTime.fromString(el))
            .toList(),
        timestampValues: (json['timestampValues'] as List?)
            ?.cast<int?>()
            .map((el) => el == null ? null : TemporalTimestamp.fromSeconds(el))
            .toList(),
        jsonValues: (json['jsonValues'] as List?)?.cast<String?>(),
        enumValues: (json['enumValues'] as List?)
            ?.cast<String?>()
            .map((el) => EnumModel.values.byValue(el))
            .toList(),
        customTypeValues: (json['customTypeValues'] as List?)
            ?.cast<Map?>()
            .map((el) => el != null
                ? SimpleCustomType.fromJson(el.cast<String, Object?>())
                : null)
            .toList());
  }

  final String id;

  final List<String?>? _stringValues;

  final List<int?>? _intValues;

  final List<double?>? _floatValues;

  final List<bool?>? _boolValues;

  final List<TemporalDate?>? _dateValues;

  final List<TemporalDateTime?>? _dateTimeValues;

  final List<TemporalTime?>? _timeValues;

  final List<TemporalTimestamp?>? _timestampValues;

  final List<String?>? _jsonValues;

  final List<EnumModel?>? _enumValues;

  final List<SimpleCustomType?>? _customTypeValues;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'AllScalarTypesListCustomType';
    modelSchemaDefinition.pluralName = 'AllScalarTypesListCustomTypes';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'stringValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'intValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'floatValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'boolValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'dateValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'dateTimeValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'timeValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'timestampValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'jsonValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'enumValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
        isRequired: false,
        fieldName: 'customTypeValues',
        isArray: true,
        ofType: const ModelFieldType(ModelFieldTypeEnum.embeddedCollection)));
  });

  List<String?>? get stringValues => _stringValues;
  List<int?>? get intValues => _intValues;
  List<double?>? get floatValues => _floatValues;
  List<bool?>? get boolValues => _boolValues;
  List<TemporalDate?>? get dateValues => _dateValues;
  List<TemporalDateTime?>? get dateTimeValues => _dateTimeValues;
  List<TemporalTime?>? get timeValues => _timeValues;
  List<TemporalTimestamp?>? get timestampValues => _timestampValues;
  List<String?>? get jsonValues => _jsonValues;
  List<EnumModel?>? get enumValues => _enumValues;
  List<SimpleCustomType?>? get customTypeValues => _customTypeValues;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is AllScalarTypesListCustomType &&
          id == other.id &&
          _stringValues == other._stringValues &&
          _intValues == other._intValues &&
          _floatValues == other._floatValues &&
          _boolValues == other._boolValues &&
          _dateValues == other._dateValues &&
          _dateTimeValues == other._dateTimeValues &&
          _timeValues == other._timeValues &&
          _timestampValues == other._timestampValues &&
          _jsonValues == other._jsonValues &&
          _enumValues == other._enumValues &&
          _customTypeValues == other._customTypeValues;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('AllScalarTypesListCustomType {');
    buffer.write('id=$id, ');
    buffer.write('stringValues=$_stringValues, ');
    buffer.write('intValues=$_intValues, ');
    buffer.write('floatValues=$_floatValues, ');
    buffer.write('boolValues=$_boolValues, ');
    buffer.write('dateValues=$_dateValues, ');
    buffer.write('dateTimeValues=$_dateTimeValues, ');
    buffer.write('timeValues=$_timeValues, ');
    buffer.write('timestampValues=$_timestampValues, ');
    buffer.write('jsonValues=$_jsonValues, ');
    buffer.write('enumValues=$_enumValues, ');
    buffer.write('customTypeValues=$_customTypeValues');
    buffer.write('}');

    return buffer.toString();
  }

  AllScalarTypesListCustomType copyWith(
      {String? id,
      List<String?>? stringValues,
      List<int?>? intValues,
      List<double?>? floatValues,
      List<bool?>? boolValues,
      List<TemporalDate?>? dateValues,
      List<TemporalDateTime?>? dateTimeValues,
      List<TemporalTime?>? timeValues,
      List<TemporalTimestamp?>? timestampValues,
      List<String?>? jsonValues,
      List<EnumModel?>? enumValues,
      List<SimpleCustomType?>? customTypeValues}) {
    return AllScalarTypesListCustomType(
        id: id ?? this.id,
        stringValues: stringValues ?? this.stringValues,
        intValues: intValues ?? this.intValues,
        floatValues: floatValues ?? this.floatValues,
        boolValues: boolValues ?? this.boolValues,
        dateValues: dateValues ?? this.dateValues,
        dateTimeValues: dateTimeValues ?? this.dateTimeValues,
        timeValues: timeValues ?? this.timeValues,
        timestampValues: timestampValues ?? this.timestampValues,
        jsonValues: jsonValues ?? this.jsonValues,
        enumValues: enumValues ?? this.enumValues,
        customTypeValues: customTypeValues ?? this.customTypeValues);
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'stringValues': _stringValues?.map((el) => el).toList(),
        'intValues': _intValues?.map((el) => el).toList(),
        'floatValues': _floatValues?.map((el) => el).toList(),
        'boolValues': _boolValues?.map((el) => el).toList(),
        'dateValues': _dateValues?.map((el) => el?.format()).toList(),
        'dateTimeValues': _dateTimeValues?.map((el) => el?.format()).toList(),
        'timeValues': _timeValues?.map((el) => el?.format()).toList(),
        'timestampValues':
            _timestampValues?.map((el) => el?.toSeconds()).toList(),
        'jsonValues': _jsonValues?.map((el) => el).toList(),
        'enumValues': _enumValues?.map((el) => el?.value).toList(),
        'customTypeValues':
            _customTypeValues?.map((el) => el?.toJson()).toList()
      };
}
