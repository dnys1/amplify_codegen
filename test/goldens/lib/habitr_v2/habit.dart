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

library models.habit;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';
import 'model_provider.dart';

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
      List<Comment>? comments}) {
    return Habit._internal(
        id: id ?? UUID.getUUID(),
        tagline: tagline,
        category: category,
        details: details,
        ups: ups,
        downs: downs,
        owner: owner,
        author: author,
        comments: comments != null ? List.unmodifiable(comments) : null);
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
      List<Comment>? comments})
      : _tagline = tagline,
        _category = category,
        _details = details,
        _ups = ups,
        _downs = downs,
        _owner = owner,
        _author = author,
        _comments = comments;

  factory Habit.fromJson(Map<String, Object?> json) {
    return Habit._internal(
        id: (json['id'] as String),
        tagline: (json['tagline'] as String),
        category: Category.values.byValue((json['category'] as String?))!,
        details: (json['details'] as String?),
        ups: (json['ups'] as int?),
        downs: (json['downs'] as int?),
        owner: (json['owner'] as String?),
        author: json['author'] != null
            ? User.fromJson((json['author'] as Map).cast<String, Object?>())
            : null,
        comments: (json['comments'] as List?)
            ?.cast<Map>()
            .map((el) => Comment.fromJson(el.cast<String, Object?>()))
            .toList());
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

  static const ID = QueryField<dynamic>(fieldName: 'id');

  static const TAGLINE = QueryField<dynamic>(fieldName: 'tagline');

  static const CATEGORY = QueryField<dynamic>(fieldName: 'category');

  static const DETAILS = QueryField<dynamic>(fieldName: 'details');

  static const UPS = QueryField<dynamic>(fieldName: 'ups');

  static const DOWNS = QueryField<dynamic>(fieldName: 'downs');

  static const OWNER = QueryField<dynamic>(fieldName: 'owner');

  static const AUTHOR = QueryField<dynamic>(
      fieldName: 'author',
      fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'User'));

  static const COMMENTS = QueryField<dynamic>(
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
        key: TAGLINE,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: CATEGORY,
        ofType: const ModelFieldType(ModelFieldTypeEnum.enumeration),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: DETAILS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: UPS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: DOWNS,
        ofType: const ModelFieldType(ModelFieldTypeEnum.int),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: OWNER,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        isRequired: false,
        key: AUTHOR,
        ofModelName: 'User',
        targetName: 'owner'));
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        isRequired: false,
        key: COMMENTS,
        ofModelName: 'Comment',
        associatedKey: Comment.HABIT));
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
          _comments == other._comments;
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
    buffer.write('comments=$_comments');
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
      List<Comment>? comments}) {
    return Habit(
        id: id ?? this.id,
        tagline: tagline ?? this.tagline,
        category: category ?? this.category,
        details: details ?? this.details,
        ups: ups ?? this.ups,
        downs: downs ?? this.downs,
        owner: owner ?? this.owner,
        author: author ?? this.author,
        comments: comments ?? this.comments);
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
        'comments': _comments?.map((el) => el.toJson()).toList()
      };
  @override
  _HabitModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _HabitModelType extends ModelType<Habit> {
  const _HabitModelType();

  @override
  Habit fromJson(Map<String, Object?> jsonData) {
    return Habit.fromJson(jsonData);
  }
}
