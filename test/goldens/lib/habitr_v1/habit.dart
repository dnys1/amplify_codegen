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

library models.habit;

import 'dart:typed_data';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

import 'category.dart';
import 'comment.dart';
import 'user.dart';

/// This is an auto generated class representing the Habit type in your schema.
@immutable
class Habit extends Model {
  factory Habit(
      {String? id,
      required String tagline,
      required Category category,
      String? details,
      int? ups,
      int? downs,
      User? author,
      List<Comment>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Habit._internal(
        id: id ?? UUID.getUUID(),
        tagline: tagline,
        category: category,
        details: details,
        ups: ups,
        downs: downs,
        author: author,
        comments: comments != null ? List.unmodifiable(comments) : null,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const Habit._internal(
      {required this.id,
      required String tagline,
      required Category category,
      String? details,
      int? ups,
      int? downs,
      User? author,
      List<Comment>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _tagline = tagline,
        _category = category,
        _details = details,
        _ups = ups,
        _downs = downs,
        _author = author,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  Habit.fromJson(Map<String, Object?> json)
      : id = (json['id'] as String),
        _tagline = (json['tagline'] as String?),
        _category = Category.values.byValue((json['category'] as String?)),
        _details = (json['details'] as String?),
        _ups = (json['ups'] as int?),
        _downs = (json['downs'] as int?),
        _author = ((json['author'] as Map?)?['serializedData'] as Map?) != null
            ? User.fromJson(((json['author'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        _comments = (json['comments'] as List?)
            ?.cast<Map>()
            .map((el) => Comment.fromJson(
                (el['serializedData'] as Map).cast<String, Object?>()))
            .toList(),
        _createdAt = json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        _updatedAt = json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null;

  static const _HabitModelType classType = _HabitModelType();

  final String id;

  final String? _tagline;

  final Category? _category;

  final String? _details;

  final int? _ups;

  final int? _downs;

  final User? _author;

  final List<Comment>? _comments;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const id$ = QueryField<dynamic>(fieldName: 'habit.id');

  static const tagline$ = QueryField<dynamic>(fieldName: 'tagline');

  static const category$ = QueryField<dynamic>(fieldName: 'category');

  static const details$ = QueryField<dynamic>(fieldName: 'details');

  static const ups$ = QueryField<dynamic>(fieldName: 'ups');

  static const downs$ = QueryField<dynamic>(fieldName: 'downs');

  static const author$ = QueryField<dynamic>(
      fieldName: 'author',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));

  static const comments$ = QueryField<dynamic>(
      fieldName: 'comments',
      fieldType: ModelFieldType(ModelFieldTypeEnum.collection,
          ofModelName: 'Comment'));

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'Habit';
    modelSchemaDefinition.pluralName = 'Habits';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: tagline$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: category$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.enumeration),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: details$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: ups$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false,
        authRules: const [
          AuthRule(
              authStrategy: AuthStrategy.PUBLIC,
              operations: [
                ModelOperation.CREATE,
                ModelOperation.READ,
                ModelOperation.UPDATE,
                ModelOperation.DELETE
              ],
              provider: AuthRuleProvider.APIKEY),
          AuthRule(
              authStrategy: AuthStrategy.PRIVATE,
              operations: [ModelOperation.READ],
              provider: AuthRuleProvider.USERPOOLS),
          AuthRule(
              authStrategy: AuthStrategy.GROUPS,
              groupClaim: 'cognito:groups',
              groups: ['admin'],
              operations: [
                ModelOperation.CREATE,
                ModelOperation.READ,
                ModelOperation.UPDATE,
                ModelOperation.DELETE
              ],
              provider: AuthRuleProvider.USERPOOLS),
          AuthRule(
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.CREATE],
              ownerField: 'owner',
              identityClaim: 'cognito:username',
              provider: AuthRuleProvider.USERPOOLS)
        ]));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: downs$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false,
        authRules: const [
          AuthRule(
              authStrategy: AuthStrategy.PUBLIC,
              operations: [
                ModelOperation.CREATE,
                ModelOperation.READ,
                ModelOperation.UPDATE,
                ModelOperation.DELETE
              ],
              provider: AuthRuleProvider.APIKEY),
          AuthRule(
              authStrategy: AuthStrategy.PRIVATE,
              operations: [ModelOperation.READ],
              provider: AuthRuleProvider.USERPOOLS),
          AuthRule(
              authStrategy: AuthStrategy.GROUPS,
              groupClaim: 'cognito:groups',
              groups: ['admin'],
              operations: [
                ModelOperation.CREATE,
                ModelOperation.READ,
                ModelOperation.UPDATE,
                ModelOperation.DELETE
              ],
              provider: AuthRuleProvider.USERPOOLS),
          AuthRule(
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.CREATE],
              ownerField: 'owner',
              identityClaim: 'cognito:username',
              provider: AuthRuleProvider.USERPOOLS)
        ]));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: author$,
        ofModelName: 'User',
        targetName: 'owner'));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: comments$,
        ofModelName: 'Comment',
        associatedKey: Comment.habit$));
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
    modelSchemaDefinition.authRules = const [
      AuthRule(
          authStrategy: AuthStrategy.GROUPS,
          groupClaim: 'cognito:groups',
          groups: ['admin'],
          operations: [
            ModelOperation.CREATE,
            ModelOperation.READ,
            ModelOperation.UPDATE,
            ModelOperation.DELETE
          ],
          provider: AuthRuleProvider.USERPOOLS),
      AuthRule(
          authStrategy: AuthStrategy.PUBLIC,
          operations: [
            ModelOperation.CREATE,
            ModelOperation.READ,
            ModelOperation.UPDATE,
            ModelOperation.DELETE
          ],
          provider: AuthRuleProvider.APIKEY),
      AuthRule(
          authStrategy: AuthStrategy.PRIVATE,
          operations: [ModelOperation.READ],
          provider: AuthRuleProvider.USERPOOLS),
      AuthRule(
          authStrategy: AuthStrategy.OWNER,
          operations: [ModelOperation.CREATE, ModelOperation.DELETE],
          ownerField: 'owner',
          identityClaim: 'cognito:username',
          provider: AuthRuleProvider.USERPOOLS)
    ];
  });

  /// The model schema as a Protocol Buffer.
  static late final Uint8List pbSchema = Uint8List.fromList(const [
    0x0a,
    0x05,
    0x48,
    0x61,
    0x62,
    0x69,
    0x74,
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
    0x15,
    0x0a,
    0x07,
    0x74,
    0x61,
    0x67,
    0x6c,
    0x69,
    0x6e,
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
    0x22,
    0x0a,
    0x08,
    0x63,
    0x61,
    0x74,
    0x65,
    0x67,
    0x6f,
    0x72,
    0x79,
    0x12,
    0x10,
    0x08,
    0x0f,
    0x10,
    0x01,
    0x2a,
    0x08,
    0x43,
    0x61,
    0x74,
    0x65,
    0x67,
    0x6f,
    0x72,
    0x79,
    0x30,
    0x01,
    0x18,
    0x00,
    0x20,
    0x00,
    0x50,
    0x00,
    0x12,
    0x15,
    0x0a,
    0x07,
    0x64,
    0x65,
    0x74,
    0x61,
    0x69,
    0x6c,
    0x73,
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
    0x75,
    0x0a,
    0x03,
    0x75,
    0x70,
    0x73,
    0x12,
    0x04,
    0x08,
    0x03,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x2a,
    0x0c,
    0x08,
    0x01,
    0x10,
    0x01,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x2a,
    0x06,
    0x08,
    0x02,
    0x10,
    0x03,
    0x40,
    0x01,
    0x2a,
    0x2b,
    0x08,
    0x04,
    0x10,
    0x03,
    0x2a,
    0x0e,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x32,
    0x05,
    0x61,
    0x64,
    0x6d,
    0x69,
    0x6e,
    0x3a,
    0x06,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x2a,
    0x1f,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x22,
    0x10,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x40,
    0x02,
    0x50,
    0x00,
    0x12,
    0x77,
    0x0a,
    0x05,
    0x64,
    0x6f,
    0x77,
    0x6e,
    0x73,
    0x12,
    0x04,
    0x08,
    0x03,
    0x10,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x2a,
    0x0c,
    0x08,
    0x01,
    0x10,
    0x01,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x2a,
    0x06,
    0x08,
    0x02,
    0x10,
    0x03,
    0x40,
    0x01,
    0x2a,
    0x2b,
    0x08,
    0x04,
    0x10,
    0x03,
    0x2a,
    0x0e,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x32,
    0x05,
    0x61,
    0x64,
    0x6d,
    0x69,
    0x6e,
    0x3a,
    0x06,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x2a,
    0x1f,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x22,
    0x10,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x40,
    0x02,
    0x50,
    0x00,
    0x12,
    0x13,
    0x0a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
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
    0x01,
    0x12,
    0x25,
    0x0a,
    0x06,
    0x61,
    0x75,
    0x74,
    0x68,
    0x6f,
    0x72,
    0x12,
    0x0c,
    0x08,
    0x0f,
    0x10,
    0x00,
    0x2a,
    0x04,
    0x55,
    0x73,
    0x65,
    0x72,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x03,
    0x3a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x50,
    0x00,
    0x12,
    0x48,
    0x0a,
    0x08,
    0x63,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x73,
    0x12,
    0x20,
    0x10,
    0x00,
    0x18,
    0x01,
    0x22,
    0x0f,
    0x08,
    0x0f,
    0x10,
    0x01,
    0x2a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x30,
    0x00,
    0x2a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
    0x30,
    0x00,
    0x18,
    0x00,
    0x20,
    0x00,
    0x30,
    0x02,
    0x3a,
    0x02,
    0x69,
    0x64,
    0x42,
    0x05,
    0x68,
    0x61,
    0x62,
    0x69,
    0x74,
    0x4a,
    0x07,
    0x43,
    0x6f,
    0x6d,
    0x6d,
    0x65,
    0x6e,
    0x74,
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
    0x1a,
    0x2b,
    0x08,
    0x04,
    0x10,
    0x03,
    0x2a,
    0x0e,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x32,
    0x05,
    0x61,
    0x64,
    0x6d,
    0x69,
    0x6e,
    0x3a,
    0x06,
    0x67,
    0x72,
    0x6f,
    0x75,
    0x70,
    0x73,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x1a,
    0x0c,
    0x08,
    0x01,
    0x10,
    0x01,
    0x40,
    0x02,
    0x40,
    0x01,
    0x40,
    0x03,
    0x40,
    0x04,
    0x1a,
    0x06,
    0x08,
    0x02,
    0x10,
    0x03,
    0x40,
    0x01,
    0x1a,
    0x21,
    0x08,
    0x03,
    0x10,
    0x03,
    0x1a,
    0x05,
    0x6f,
    0x77,
    0x6e,
    0x65,
    0x72,
    0x22,
    0x10,
    0x63,
    0x6f,
    0x67,
    0x6e,
    0x69,
    0x74,
    0x6f,
    0x3a,
    0x75,
    0x73,
    0x65,
    0x72,
    0x6e,
    0x61,
    0x6d,
    0x65,
    0x40,
    0x02,
    0x40,
    0x04,
    0x20,
    0x00
  ]);

  @override
  _HabitModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get tagline {
    if (_tagline == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _tagline!;
  }

  Category get category {
    if (_category == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _category!;
  }

  String? get details => _details;
  int? get ups => _ups;
  int? get downs => _downs;
  User? get author => _author;
  List<Comment>? get comments => _comments;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is Habit &&
          id == other.id &&
          _tagline == other._tagline &&
          _category == other._category &&
          _details == other._details &&
          _ups == other._ups &&
          _downs == other._downs &&
          _author == other._author &&
          _comments == other._comments &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('Habit {');
    buffer.write('id=$id, ');
    buffer.write('tagline=$_tagline, ');
    buffer.write('category=$_category, ');
    buffer.write('details=$_details, ');
    buffer.write('ups=$_ups, ');
    buffer.write('downs=$_downs, ');
    buffer.write('author=$_author, ');
    buffer.write('comments=$_comments, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');
    return buffer.toString();
  }

  Habit copyWith(
      {String? id,
      String? tagline,
      Category? category,
      String? details,
      int? ups,
      int? downs,
      User? author,
      List<Comment>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return Habit(
        id: id ?? this.id,
        tagline: tagline ?? this.tagline,
        category: category ?? this.category,
        details: details ?? this.details,
        ups: ups ?? this.ups,
        downs: downs ?? this.downs,
        author: author ?? this.author,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'tagline': _tagline,
        'category': _category?.value,
        'details': _details,
        'ups': _ups,
        'downs': _downs,
        'author': _author?.toJson(),
        'comments': _comments?.map((el) => el.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _HabitModelType extends ModelType<Habit> {
  const _HabitModelType();

  @override
  String modelName() => 'Habit';
  @override
  Habit fromJson(Map<String, Object?> jsonData) {
    return Habit.fromJson(jsonData);
  }
}
