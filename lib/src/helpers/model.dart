import 'package:amplify_codegen/src/models/model.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

import 'field.dart';

extension ModelHelpers on Model {
  /// Finds the field named [name].
  ///
  /// Throws a [StateError] if not present.
  ModelField fieldNamed(String name) =>
      fields.singleWhere((f) => f.name == name);

  /// Tries to find the field named [name].
  ModelField? maybeFieldNamed(String name) =>
      fields.singleWhereOrNull((f) => f.name == name);

  /// The primary key field.
  ///
  /// Throws a [StateError] if not present.
  ModelField get primaryKeyField => fields.singleWhere((f) => f.isPrimaryKey);
}

extension ModelDefinitionHelpers on ObjectTypeDefinitionNode {
  /// Returns whether `this` is a [Model].
  bool get isModel =>
      directives.any((directive) => directive.name.value == 'model');

  ///
  Map<String?, List<String>> get indexFields {
    // V1: The @key directives, by name, and their associated fields.
    final v1KeyDirectives =
        directives.where((directive) => directive.name.value == 'key');
    final v1Map = Map.fromEntries(v1KeyDirectives.map((keyDirective) {
      final keyName = (keyDirective.arguments
              .firstWhereOrNull((arg) => arg.name.value == 'name')
              ?.value as StringValueNode?)
          ?.value;
      final fields = (keyDirective.arguments
              .firstWhereOrNull((arg) => arg.name.value == 'fields')
              ?.value as ListValueNode?)
          ?.values
          .map((val) => (val as StringValueNode).value)
          .toList();

      return MapEntry(keyName, fields ?? const []);
    }));

    // V2: All fields marked with @index
    final indexedFields = Map<String?, List<String>>.fromEntries(fields
        .where((field) => field.hasDirective('index'))
        .map((field) => MapEntry(
              field.directiveNamed('index')!.argumentNamed('name')!.stringValue,
              [field.wireName],
            )));
    final primaryKey =
        fields.firstWhereOrNull((field) => field.hasDirective('primaryKey'));
    if (primaryKey != null) {
      indexedFields[null] = [primaryKey.wireName];
    }

    return {...v1Map, ...indexedFields};
  }

  /// Returns all fields as [ModelField] objects.
  Iterable<ModelField> modelFields({
    required String? primaryKey,
    required Map<String, ObjectTypeDefinitionNode> models,
    required bool isCustom,
  }) sync* {
    for (var field in fields) {
      yield ModelField(
        (f) {
          f
            ..name = field.name.value
            ..type.isRequired = field.type.isNonNull
            ..isReadOnly = false
            ..authRules.addAll(field.directives.authRules);

          _buildTypeFor(f.type, field.type, models: models);

          final isPrimaryKey =
              field.wireName == primaryKey || field.isPrimaryKey;
          f.isPrimaryKey = isPrimaryKey;
        },
      );
    }

    if (!isCustom) {
      // createdAt
      yield ModelField(
        (f) => f
          ..name = 'createdAt'
          ..isReadOnly = true
          ..type.isRequired = false
          ..type.isList = false
          ..type.awsType = AWSType.AWSDateTime,
      );

      // updatedAt
      yield ModelField(
        (f) => f
          ..name = 'updatedAt'
          ..isReadOnly = true
          ..type.isRequired = false
          ..type.isList = false
          ..type.awsType = AWSType.AWSDateTime,
      );
    }
  }

  TypeInfoBuilder _buildTypeFor(
    TypeInfoBuilder builder,
    TypeNode node, {
    required Map<String, ObjectTypeDefinitionNode> models,
  }) {
    if (node is NamedTypeNode) {
      builder.isList ??= false;
      builder.isRequired = node.isNonNull;
      builder.awsType = AWSType.values.firstWhere(
        (el) => el.name == node.name.value,
        orElse: () {
          final modelName = node.name.value;
          builder.modelName = modelName;
          builder.isEnum = !models.keys.contains(modelName);
          return AWSType.Model;
        },
      );
      return builder;
    } else if (node is ListTypeNode) {
      builder.isList ??= true;
      builder.isRequired = node.isNonNull;

      final valueBuilder = _buildTypeFor(
        builder.listType,
        node.type,
        models: models,
      );
      builder
        ..modelName = valueBuilder.modelName
        ..isEnum = valueBuilder.isEnum;

      return builder;
    }
    throw ArgumentError(node.runtimeType);
  }
}
