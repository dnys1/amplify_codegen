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
      String? owner,
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
        owner: owner,
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
      String? owner,
      User? author,
      List<Comment>? comments,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _tagline = tagline,
        _category = category,
        _details = details,
        _ups = ups,
        _downs = downs,
        _owner = owner,
        _author = author,
        _comments = comments,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Habit.fromJson(Map<String, Object?> json) {
    return Habit._internal(
        id: (json['id'] as String),
        tagline: (json['tagline'] as String),
        category: Category.values.byValue((json['category'] as String?))!,
        details: (json['details'] as String?),
        ups: (json['ups'] as int?),
        downs: (json['downs'] as int?),
        owner: (json['owner'] as String?),
        author: ((json['author'] as Map?)?['serializedData'] as Map?) != null
            ? User.fromJson(((json['author'] as Map)['serializedData'] as Map)
                .cast<String, Object?>())
            : null,
        comments: (json['comments'] as List?)
            ?.cast<Map>()
            .map((el) => Comment.fromJson(
                (el['serializedData'] as Map).cast<String, Object?>()))
            .toList(),
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _HabitModelType classType = _HabitModelType();

  final String id;

  final String? _tagline;

  final Category? _category;

  final String? _details;

  final int? _ups;

  final int? _downs;

  final String? _owner;

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

  static const owner$ = QueryField<dynamic>(fieldName: 'owner');

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
          AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
            ModelOperation.CREATE,
            ModelOperation.UPDATE,
            ModelOperation.DELETE,
            ModelOperation.READ
          ]),
          AuthRule(
              authStrategy: AuthStrategy.PRIVATE,
              operations: [ModelOperation.READ]),
          AuthRule(
              authStrategy: AuthStrategy.GROUPS,
              groupClaim: 'cognito:groups',
              groups: [
                'admin'
              ],
              operations: [
                ModelOperation.CREATE,
                ModelOperation.UPDATE,
                ModelOperation.DELETE,
                ModelOperation.READ
              ]),
          AuthRule(
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.CREATE],
              ownerField: 'owner',
              identityClaim: 'cognito:username')
        ]));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: downs$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false,
        authRules: const [
          AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
            ModelOperation.CREATE,
            ModelOperation.UPDATE,
            ModelOperation.DELETE,
            ModelOperation.READ
          ]),
          AuthRule(
              authStrategy: AuthStrategy.PRIVATE,
              operations: [ModelOperation.READ]),
          AuthRule(
              authStrategy: AuthStrategy.GROUPS,
              groupClaim: 'cognito:groups',
              groups: [
                'admin'
              ],
              operations: [
                ModelOperation.CREATE,
                ModelOperation.UPDATE,
                ModelOperation.DELETE,
                ModelOperation.READ
              ]),
          AuthRule(
              authStrategy: AuthStrategy.OWNER,
              operations: [ModelOperation.CREATE],
              ownerField: 'owner',
              identityClaim: 'cognito:username')
        ]));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: owner$,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
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
          groups: [
            'admin'
          ],
          operations: [
            ModelOperation.CREATE,
            ModelOperation.UPDATE,
            ModelOperation.DELETE,
            ModelOperation.READ
          ]),
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ]),
      AuthRule(
          authStrategy: AuthStrategy.PRIVATE,
          operations: [ModelOperation.READ]),
      AuthRule(
          authStrategy: AuthStrategy.OWNER,
          operations: [ModelOperation.CREATE, ModelOperation.DELETE],
          ownerField: 'owner',
          identityClaim: 'cognito:username')
    ];
  });

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
  String? get owner => _owner;
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
          _owner == other._owner &&
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
    buffer.write('owner=$_owner, ');
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
      String? owner,
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
        owner: owner ?? this.owner,
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
        'owner': _owner,
        'author': _author?.toJson(),
        'comments': _comments?.map((el) => el.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _HabitModelType extends ModelType<Habit> {
  const _HabitModelType();

  @override
  Habit fromJson(Map<String, Object?> jsonData) {
    return Habit.fromJson(jsonData);
  }
}
