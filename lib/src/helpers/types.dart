import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/model.dart';
import 'package:amplify_codegen/src/helpers/language.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

const datastoreUri =
    'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
const flutterFoundationUri = 'package:flutter/foundation.dart';
const metaUri = 'package:meta/meta.dart';

TypeReference mapOf(String key, String value) {
  return TypeReference((t) => t
    ..symbol = 'Map'
    ..types.addAll([
      refer(key),
      refer(value),
    ]));
}

TypeReference listOf(Reference ref) {
  return TypeReference((t) => t
    ..symbol = 'List'
    ..types.add(ref));
}

extension TypeHelpers on TypeNode {
  bool get isArray => this is ListTypeNode;

  ListTypeNode get asList => this as ListTypeNode;

  String get typeName {
    if (this is NamedTypeNode) {
      return (this as NamedTypeNode).name.value;
    } else if (this is ListTypeNode) {
      return (this as ListTypeNode).type.typeName;
    }
    throw ArgumentError(runtimeType);
  }

  /// The type of model field this represents.
  GraphQLType get graphqlType => GraphQLTypeX.valueOf(
        typeName,
        orElse: () => GraphQLType.TYPE_MODEL,
      );
}

extension ReferenceHelpers on Reference {
  TypeReference get typeRef =>
      this is TypeReference ? this as TypeReference : type as TypeReference;

  /// Returns a nullable version of `this`.
  TypeReference get nullable {
    return typeRef.rebuild((t) => t.isNullable = true);
  }

  /// Returns a non-nullable version of `this`.
  TypeReference get nonNull {
    return typeRef.rebuild((t) => t.isNullable = false);
  }
}

extension TypeInfoHelpers on ModelField_TypeInfo {
  /// Whether this type represents a Model.
  bool get isModel => modelName.isNotEmpty && !isEnum;

  /// The model's identifier in Dart.
  String? get dartModelName => modelName.isEmpty ? null : modelName.pascalCase;

  /// Whether this type represents a s
  bool get isPrimitive {
    if (isModel || isEnum) return false;
    if (isArray) return arrayType.isPrimitive;

    switch (graphqlType) {
      case GraphQLType.TYPE_AWS_DATE:
      case GraphQLType.TYPE_AWS_TIME:
      case GraphQLType.TYPE_AWS_DATE_TIME:
      case GraphQLType.TYPE_AWS_TIMESTAMP:
        return false;
      default:
        return true;
    }
  }

  TypeReference get wireTypeReference {
    if (isArray) {
      return TypeReference((t) => t
        ..symbol = 'List'
        ..isNullable = !isRequired);
    }
    if (isModel) {
      return TypeReference((t) => t
        ..symbol = 'Map'
        ..isNullable = !isRequired);
    }
    if (isEnum) {
      return TypeReference((t) => t
        ..symbol = 'String'
        ..isNullable = !isRequired);
    }

    late TypeReference baseType;
    switch (graphqlType) {
      case GraphQLType.TYPE_UNSPECIFIED:
        throw ArgumentError('Unknown type: $graphqlType');
      case GraphQLType.TYPE_ID:
      case GraphQLType.TYPE_STRING:
      case GraphQLType.TYPE_AWS_EMAIL:
      case GraphQLType.TYPE_AWS_JSON:
      case GraphQLType.TYPE_AWS_PHONE:
      case GraphQLType.TYPE_AWS_URL:
      case GraphQLType.TYPE_AWS_IP_ADDRESS:
      case GraphQLType.TYPE_AWS_DATE:
      case GraphQLType.TYPE_AWS_TIME:
      case GraphQLType.TYPE_AWS_DATE_TIME:
        baseType = const Reference('String').typeRef;
        break;
      case GraphQLType.TYPE_AWS_TIMESTAMP:
      case GraphQLType.TYPE_INT:
        baseType = const Reference('int').typeRef;
        break;
      case GraphQLType.TYPE_FLOAT:
        baseType = const Reference('double').typeRef;
        break;
      case GraphQLType.TYPE_BOOLEAN:
        baseType = const Reference('bool').typeRef;
        break;
      case GraphQLType.TYPE_MODEL:
        baseType = Reference(
          modelName,
          modelName.snakeCase + '.dart',
        ).typeRef;
        break;
    }

    return baseType.rebuild((t) => t..isNullable = !isRequired);
  }

  TypeReference get typeReference {
    if (isArray) {
      return TypeReference(
        (t) => t
          ..symbol = 'List'
          ..isNullable = !isRequired
          ..types.add(arrayType.typeReference),
      );
    }

    late TypeReference baseType;
    switch (graphqlType) {
      case GraphQLType.TYPE_UNSPECIFIED:
        throw ArgumentError('Unknown type: $graphqlType');
      case GraphQLType.TYPE_ID:
      case GraphQLType.TYPE_STRING:
      case GraphQLType.TYPE_AWS_EMAIL:
      case GraphQLType.TYPE_AWS_JSON:
      case GraphQLType.TYPE_AWS_PHONE:
      case GraphQLType.TYPE_AWS_URL:
      case GraphQLType.TYPE_AWS_IP_ADDRESS:
        baseType = const Reference('String').typeRef;
        break;
      case GraphQLType.TYPE_INT:
        baseType = const Reference('int').typeRef;
        break;
      case GraphQLType.TYPE_FLOAT:
        baseType = const Reference('double').typeRef;
        break;
      case GraphQLType.TYPE_BOOLEAN:
        baseType = const Reference('bool').typeRef;
        break;
      case GraphQLType.TYPE_AWS_DATE:
        baseType = const Reference('TemporalDate', datastoreUri).typeRef;
        break;
      case GraphQLType.TYPE_AWS_TIME:
        baseType = const Reference('TemporalTime', datastoreUri).typeRef;
        break;
      case GraphQLType.TYPE_AWS_DATE_TIME:
        baseType = const Reference('TemporalDateTime', datastoreUri).typeRef;
        break;
      case GraphQLType.TYPE_AWS_TIMESTAMP:
        baseType = const Reference('TemporalTimestamp', datastoreUri).typeRef;
        break;
      case GraphQLType.TYPE_MODEL:
        baseType = Reference(
          modelName,
          modelName.snakeCase + '.dart',
        ).typeRef;
        break;
    }

    return baseType.rebuild((t) => t..isNullable = !isRequired);
  }

  ModelFieldType modelFieldType({
    required bool isCustom,
    required Map<String, Model> models,
  }) {
    if (isArray) {
      final baseType =
          arrayType.modelFieldType(isCustom: isCustom, models: models);
      return (baseType == ModelFieldType.model ||
                  baseType == ModelFieldType.embedded) &&
              models[arrayType.modelName]!.isCustom
          ? ModelFieldType.embeddedCollection
          : ModelFieldType.collection;
    }

    switch (graphqlType) {
      case GraphQLType.TYPE_UNSPECIFIED:
        throw ArgumentError('Unknown type: $graphqlType');
      case GraphQLType.TYPE_ID:
      case GraphQLType.TYPE_AWS_EMAIL:
      case GraphQLType.TYPE_AWS_JSON:
      case GraphQLType.TYPE_AWS_PHONE:
      case GraphQLType.TYPE_AWS_URL:
      case GraphQLType.TYPE_AWS_IP_ADDRESS:
      case GraphQLType.TYPE_STRING:
        return ModelFieldType.string;
      case GraphQLType.TYPE_INT:
        return ModelFieldType.int;
      case GraphQLType.TYPE_FLOAT:
        return ModelFieldType.double;
      case GraphQLType.TYPE_BOOLEAN:
        return ModelFieldType.bool;
      case GraphQLType.TYPE_AWS_DATE:
        return ModelFieldType.date;
      case GraphQLType.TYPE_AWS_TIME:
        return ModelFieldType.time;
      case GraphQLType.TYPE_AWS_DATE_TIME:
        return ModelFieldType.dateTime;
      case GraphQLType.TYPE_AWS_TIMESTAMP:
        return ModelFieldType.timestamp;
      case GraphQLType.TYPE_MODEL:
        break;
    }

    final model = models[modelName];
    if (model != null) {
      return model.isCustom ? ModelFieldType.embedded : ModelFieldType.model;
    }

    return ModelFieldType.enumeration;
  }
}

extension TypeDefinitionHelpers on TypeDefinitionNode {
  /// This type's name as a library name.
  String get libraryName {
    final libName = name.value.snakeCase;
    if (hardReservedWords.contains(libName)) {
      return '${libName}_';
    }
    return libName;
  }
}
