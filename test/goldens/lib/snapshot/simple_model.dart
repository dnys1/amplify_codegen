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

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the SimpleModel type in your schema. */
@immutable
class SimpleModel extends Model {
  const SimpleModel._internal({required this.id, String? name, String? bar});

  factory SimpleModel({String? id, String? name, String? bar}) {
    return SimpleModel._internal(
        id: id == null ? UUID.getUUID() : id, name: name, bar: bar);
  }

  static const classType = const _SimpleModelModelType();
  final String id;
  final String name;
  final String bar;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleModel &&
        id == other.id &&
        name == other.name &&
        bar == other.bar;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("SimpleModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("bar=" + "$bar");
    buffer.write("}");

    return buffer.toString();
  }

  SimpleModel copyWith({String id, String name, String bar}) {
    return SimpleModel(
        id: id ?? this.id, name: name ?? this.name, bar: bar ?? this.bar);
  }

  SimpleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        bar = json['bar'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'bar': bar};

  static final QueryField ID = QueryField(fieldName: "simpleModel.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField BAR = QueryField(fieldName: "bar");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SimpleModel";
    modelSchemaDefinition.pluralName = "SimpleModels";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SimpleModel.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: SimpleModel.BAR,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _SimpleModelModelType extends ModelType<SimpleModel> {
  const _SimpleModelModelType();

  @override
  SimpleModel fromJson(Map<String, dynamic> jsonData) {
    return SimpleModel.fromJson(jsonData);
  }
}
