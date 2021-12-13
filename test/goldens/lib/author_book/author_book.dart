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

library models.author_book;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:meta/meta.dart';

/// This is an auto generated class representing the AuthorBook type in your schema.
@immutable
class AuthorBook extends Model {
  factory AuthorBook(
      {String? id,
      required String authorId,
      required String bookId,
      String? author,
      String? book,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return AuthorBook._internal(
        id: id ?? UUID.getUUID(),
        authorId: authorId,
        bookId: bookId,
        author: author,
        book: book,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  const AuthorBook._internal(
      {required this.id,
      required String authorId,
      required String bookId,
      String? author,
      String? book,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt})
      : _authorId = authorId,
        _bookId = bookId,
        _author = author,
        _book = book,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory AuthorBook.fromJson(Map<String, Object?> json) {
    return AuthorBook._internal(
        id: (json['id'] as String),
        authorId: (json['author_id'] as String),
        bookId: (json['book_id'] as String),
        author: (json['author'] as String?),
        book: (json['book'] as String?),
        createdAt: json['createdAt'] != null
            ? TemporalDateTime.fromString((json['createdAt'] as String))
            : null,
        updatedAt: json['updatedAt'] != null
            ? TemporalDateTime.fromString((json['updatedAt'] as String))
            : null);
  }

  static const _AuthorBookModelType classType = _AuthorBookModelType();

  final String id;

  final String? _authorId;

  final String? _bookId;

  final String? _author;

  final String? _book;

  final TemporalDateTime? _createdAt;

  final TemporalDateTime? _updatedAt;

  static const ID = QueryField<dynamic>(fieldName: 'authorBook.id');

  static const AUTHOR_ID = QueryField<dynamic>(fieldName: 'author_id');

  static const BOOK_ID = QueryField<dynamic>(fieldName: 'book_id');

  static const AUTHOR = QueryField<dynamic>(fieldName: 'author');

  static const BOOK = QueryField<dynamic>(fieldName: 'book');

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'authorBook';
    modelSchemaDefinition.pluralName = 'authorBooks';
    modelSchemaDefinition.addField(ModelFieldDefinition.id(name: 'id'));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: AUTHOR_ID,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: true,
        key: BOOK_ID,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: AUTHOR,
        ofType: const ModelFieldType(ModelFieldTypeEnum.string),
        isArray: false));
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        isRequired: false,
        key: BOOK,
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
  _AuthorBookModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }

  String get authorId {
    if (_authorId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _authorId!;
  }

  String get bookId {
    if (_bookId == null) {
      throw const DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion);
    }
    return _bookId!;
  }

  String? get author => _author;
  String? get book => _book;
  TemporalDateTime? get createdAt => _createdAt;
  TemporalDateTime? get updatedAt => _updatedAt;
  bool equals(Object? other) {
    return this == other;
  }

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is AuthorBook &&
          id == other.id &&
          _authorId == other._authorId &&
          _bookId == other._bookId &&
          _author == other._author &&
          _book == other._book &&
          _createdAt == other._createdAt &&
          _updatedAt == other._updatedAt;
  @override
  int get hashCode => toString().hashCode;
  @override
  String toString() {
    final buffer = StringBuffer();

    buffer.write('AuthorBook {');
    buffer.write('id=$id, ');
    buffer.write('authorId=$_authorId, ');
    buffer.write('bookId=$_bookId, ');
    buffer.write('author=$_author, ');
    buffer.write('book=$_book, ');
    buffer.write('createdAt=$_createdAt, ');
    buffer.write('updatedAt=$_updatedAt');
    buffer.write('}');

    return buffer.toString();
  }

  AuthorBook copyWith(
      {String? id,
      String? authorId,
      String? bookId,
      String? author,
      String? book,
      TemporalDateTime? createdAt,
      TemporalDateTime? updatedAt}) {
    return AuthorBook(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        bookId: bookId ?? this.bookId,
        author: author ?? this.author,
        book: book ?? this.book,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'author_id': _authorId,
        'book_id': _bookId,
        'author': _author,
        'book': _book,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };
}

class _AuthorBookModelType extends ModelType<AuthorBook> {
  const _AuthorBookModelType();

  @override
  AuthorBook fromJson(Map<String, Object?> jsonData) {
    return AuthorBook.fromJson(jsonData);
  }
}
