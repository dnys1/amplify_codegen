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

library models.customer;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the Customer type in your schema.
@immutable
class Customer extends Model {
  factory Customer(
      {String? id,
      required String name,
      String? phoneNumber,
      required String accountRepresentativeId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Customer._internal(
        id: id ?? UUID.getUUID(),
        name: name,
        phoneNumber: phoneNumber,
        accountRepresentativeId: accountRepresentativeId,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Customer._internal(
      {required this.id,
      required String name,
      String? phoneNumber,
      required String accountRepresentativeId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _name = name,
        _phoneNumber = phoneNumber,
        _accountRepresentativeId = accountRepresentativeId,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Customer.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _name = (json['name'] as String?),
        _phoneNumber = (json['phoneNumber'] as String?),
        _accountRepresentativeId = (json['accountRepresentativeID'] as String?),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _CustomerModelType classType = _CustomerModelType();

  final String id;

  final String? _name;

  final String? _phoneNumber;

  final String? _accountRepresentativeId;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'customer.id');

  static const name$ = QueryField<dynamic>(fieldName: 'name');

  static const phoneNumber$ = QueryField<dynamic>(fieldName: 'phoneNumber');

  static const accountRepresentativeId$ =
      QueryField<dynamic>(fieldName: 'accountRepresentativeID');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Customer';
    modelSchemaDefinition.pluralName = 'Customers';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: name$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: phoneNumber$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: accountRepresentativeId$,
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
  _CustomerModelType getInstanceType() => classType;
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

  String? get phoneNumber => _phoneNumber;
  String get accountRepresentativeId {
    if (_accountRepresentativeId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _accountRepresentativeId!;
  }

  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Customer &&
          id == other.id &&
          _name == other._name &&
          _phoneNumber == other._phoneNumber &&
          _accountRepresentativeId == other._accountRepresentativeId &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Customer {');
    buffer.write('id=$id, ');
    buffer.write('name=$_name, ');
    buffer.write('phoneNumber=$_phoneNumber, ');
    buffer.write('accountRepresentativeId=$_accountRepresentativeId, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Customer copyWith(
      {String? id,
      String? name,
      String? phoneNumber,
      String? accountRepresentativeId,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        accountRepresentativeId:
            accountRepresentativeId ?? this.accountRepresentativeId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': _name,
        'phoneNumber': _phoneNumber,
        'accountRepresentativeID': _accountRepresentativeId,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _CustomerModelType extends ModelType<Customer> {
  const _CustomerModelType();

  @override
  String modelName() => 'Customer';
  @override
  Customer fromJson(Map<String, Object?> jsonData) {
    return Customer.fromJson(jsonData);
  }
}
