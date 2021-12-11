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
      String? book}) {
    return AuthorBook._internal(
        id: id ?? UUID.getUUID(),
        authorId: authorId,
        bookId: bookId,
        author: author,
        book: book);
  }

  const AuthorBook._internal(
      {required this.id,
      required String authorId,
      required String bookId,
      String? author,
      String? book})
      : _authorId = authorId,
        _bookId = bookId,
        _author = author,
        _book = book;

  factory AuthorBook.fromJson(Map<String, Object?> json) {
    return AuthorBook._internal(
        id: (json['id'] as String),
        authorId: (json['author_id'] as String),
        bookId: (json['book_id'] as String),
        author: (json['author'] as String?),
        book: (json['book'] as String?));
  }

  static const _AuthorBookModelType classType = _AuthorBookModelType();

  final String id;

  final String? _authorId;

  final String? _bookId;

  final String? _author;

  final String? _book;

  static final schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = 'authorBook';
    modelSchemaDefinition.pluralName = 'authorBooks';
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
    modelSchemaDefinition.addField();
  });

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
          _book == other._book;
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
    buffer.write('book=$_book');
    buffer.write('}');

    return buffer.toString();
  }

  AuthorBook copyWith(
      {String? id,
      String? authorId,
      String? bookId,
      String? author,
      String? book}) {
    return AuthorBook(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        bookId: bookId ?? this.bookId,
        author: author ?? this.author,
        book: book ?? this.book);
  }

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'author_id': _authorId,
        'book_id': _bookId,
        'author': _author,
        'book': _book
      };
  @override
  _AuthorBookModelType getInstanceType() => classType;
  @override
  String getId() {
    return id;
  }
}

class _AuthorBookModelType extends ModelType<AuthorBook> {
  const _AuthorBookModelType();

  @override
  AuthorBook fromJson(Map<String, Object?> jsonData) {
    return AuthorBook.fromJson(jsonData);
  }
}
