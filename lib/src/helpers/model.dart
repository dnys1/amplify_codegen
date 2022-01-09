import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/helpers/language.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
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

  /// This type's name as a library name.
  String get libraryName {
    final libName = name.snakeCase;
    if (hardReservedWords.contains(libName)) {
      return '${libName}_';
    }
    return libName;
  }

  /// This type's name as a class name.
  String get className => name.pascalCase;
}

extension ModelDefinitionHelpers on ObjectTypeDefinitionNode {
  /// Whether `this` is a [Model] (non-custom).
  bool get isModel =>
      directives.any((directive) => directive.name.value == 'model');

  /// Whether `this` is a custom Model type.
  bool get isCustom => !isModel;

  /// The keys/indexes for this model + their associated `fields` property.
  /// Unnamed primary keys are indexed by `null` in the returned map.
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
    // + the primary key, which is the primary index
    final primaryKey =
        fields.firstWhereOrNull((field) => field.hasDirective('primaryKey'));
    if (primaryKey != null) {
      indexedFields[null] = [primaryKey.wireName];
    }

    return {...v1Map, ...indexedFields};
  }

  /// The name of the primary key field, if any.
  String? get primaryKeyField => indexFields[null]?.firstOrNull;

  /// Returns all fields as [ModelField] objects.
  Iterable<ModelField> modelFields({
    required String? primaryKey,
    required Map<String, ObjectTypeDefinitionNode> models,
    required bool isCustom,
  }) sync* {
    for (var field in fields) {
      final modelField = ModelField()
        ..name = field.name.value
        ..type = ModelField_TypeInfo(isRequired: field.type.isNonNull)
        ..isReadOnly = false
        ..authRules.addAll(field.directives.authRules);

      modelField.type = _buildTypeFor(
        modelField.type.toBuilder() as ModelField_TypeInfo,
        field.type,
        models: models,
      );

      final isPrimaryKey = field.wireName == primaryKey || field.isPrimaryKey;
      modelField.isPrimaryKey = isPrimaryKey;
      yield modelField;
    }

    if (!isCustom) {
      // createdAt
      yield ModelField()
        ..name = 'createdAt'
        ..isReadOnly = true
        ..type = ModelField_TypeInfo(
          isRequired: false,
          isArray: false,
          graphqlType: GraphQLType.TYPE_AWS_DATE_TIME,
        );

      // updatedAt
      yield ModelField()
        ..name = 'updatedAt'
        ..isReadOnly = true
        ..type = ModelField_TypeInfo(
          isRequired: false,
          isArray: false,
          graphqlType: GraphQLType.TYPE_AWS_DATE_TIME,
        );
    }
  }

  ModelField_TypeInfo _buildTypeFor(
    ModelField_TypeInfo typeInfo,
    TypeNode node, {
    required Map<String, ObjectTypeDefinitionNode> models,
  }) {
    if (node is NamedTypeNode) {
      typeInfo.isRequired = node.isNonNull;
      typeInfo.graphqlType = GraphQLTypeX.valueOf(
        node.name.value,
        orElse: () {
          final modelName = node.name.value;
          typeInfo.modelName = modelName;
          typeInfo.isEnum = !models.keys.contains(modelName);
          return GraphQLType.TYPE_MODEL;
        },
      );
      return typeInfo;
    } else if (node is ListTypeNode) {
      typeInfo.isArray = true;
      typeInfo.isRequired = node.isNonNull;

      final valueBuilder = _buildTypeFor(
        typeInfo.arrayType.toBuilder() as ModelField_TypeInfo,
        node.type,
        models: models,
      );
      typeInfo
        ..arrayType = valueBuilder
        ..modelName = valueBuilder.modelName
        ..isEnum = valueBuilder.isEnum;

      return typeInfo;
    }
    throw ArgumentError(node.runtimeType);
  }
}
