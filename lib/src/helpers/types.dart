import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/model.dart';
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
  bool get isList => this is ListTypeNode;

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
  AWSType get awsType => AWSType.values.firstWhere(
        (type) => type.name == typeName,
        orElse: () => AWSType.Model,
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

extension TypeInfoHelpers on TypeInfo {
  /// Whether this type represents a Model.
  bool get isModel => modelName != null && !isEnum;

  /// The model's identifier in Dart.
  String? get dartModelName => modelName?.pascalCase;

  /// Whether this type represents a s
  bool get isPrimitive {
    if (isModel || isEnum) return false;
    if (isList) return listType!.isPrimitive;

    switch (awsType!) {
      case AWSType.AWSDate:
      case AWSType.AWSTime:
      case AWSType.AWSDateTime:
      case AWSType.AWSTimestamp:
        return false;
      default:
        return true;
    }
  }

  TypeReference get wireTypeReference {
    if (isList) {
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

    final TypeReference baseType;
    switch (awsType!) {
      case AWSType.ID:
      case AWSType.String:
      case AWSType.AWSEmail:
      case AWSType.AWSJSON:
      case AWSType.AWSPhone:
      case AWSType.AWSURL:
      case AWSType.AWSIPAddress:
      case AWSType.AWSDate:
      case AWSType.AWSTime:
      case AWSType.AWSDateTime:
        baseType = const Reference('String').typeRef;
        break;
      case AWSType.AWSTimestamp:
      case AWSType.Int:
        baseType = const Reference('int').typeRef;
        break;
      case AWSType.Float:
        baseType = const Reference('double').typeRef;
        break;
      case AWSType.Boolean:
        baseType = const Reference('bool').typeRef;
        break;
      case AWSType.Model:
        baseType = Reference(
          modelName!,
          modelName!.snakeCase + '.dart',
        ).typeRef;
        break;
    }

    return baseType.rebuild((t) => t..isNullable = !isRequired);
  }

  TypeReference get typeReference {
    if (isList) {
      return TypeReference(
        (t) => t
          ..symbol = 'List'
          ..isNullable = !isRequired
          ..types.add(listType!.typeReference),
      );
    }

    final TypeReference baseType;
    switch (awsType!) {
      case AWSType.ID:
      case AWSType.String:
      case AWSType.AWSEmail:
      case AWSType.AWSJSON:
      case AWSType.AWSPhone:
      case AWSType.AWSURL:
      case AWSType.AWSIPAddress:
        baseType = const Reference('String').typeRef;
        break;
      case AWSType.Int:
        baseType = const Reference('int').typeRef;
        break;
      case AWSType.Float:
        baseType = const Reference('double').typeRef;
        break;
      case AWSType.Boolean:
        baseType = const Reference('bool').typeRef;
        break;
      case AWSType.AWSDate:
        baseType = const Reference('TemporalDate', datastoreUri).typeRef;
        break;
      case AWSType.AWSTime:
        baseType = const Reference('TemporalTime', datastoreUri).typeRef;
        break;
      case AWSType.AWSDateTime:
        baseType = const Reference('TemporalDateTime', datastoreUri).typeRef;
        break;
      case AWSType.AWSTimestamp:
        baseType = const Reference('TemporalTimestamp', datastoreUri).typeRef;
        break;
      case AWSType.Model:
        baseType = Reference(
          modelName!,
          modelName!.snakeCase + '.dart',
        ).typeRef;
        break;
    }

    return baseType.rebuild((t) => t..isNullable = !isRequired);
  }

  ModelFieldType modelFieldType({
    required bool isCustom,
    required Map<String, Model> models,
  }) {
    if (isList) {
      final baseType =
          listType!.modelFieldType(isCustom: isCustom, models: models);
      return isCustom &&
              (baseType == ModelFieldType.model ||
                  baseType == ModelFieldType.embedded)
          ? ModelFieldType.embeddedCollection
          : ModelFieldType.collection;
    }

    switch (awsType!) {
      case AWSType.ID:
      case AWSType.AWSEmail:
      case AWSType.AWSJSON:
      case AWSType.AWSPhone:
      case AWSType.AWSURL:
      case AWSType.AWSIPAddress:
      case AWSType.String:
        return ModelFieldType.string;
      case AWSType.Int:
        return ModelFieldType.int;
      case AWSType.Float:
        return ModelFieldType.double;
      case AWSType.Boolean:
        return ModelFieldType.bool;
      case AWSType.AWSDate:
        return ModelFieldType.date;
      case AWSType.AWSTime:
        return ModelFieldType.time;
      case AWSType.AWSDateTime:
        return ModelFieldType.dateTime;
      case AWSType.AWSTimestamp:
        return ModelFieldType.timestamp;
      case AWSType.Model:
        break;
    }

    final isModel = models[modelName!] != null;
    if (isModel) {
      return isCustom ? ModelFieldType.embedded : ModelFieldType.model;
    }

    return ModelFieldType.enumeration;
  }
}

extension ModelFieldTypes on ModelField {
  TypeReference get typeReference => type.typeReference;

  ModelFieldType modelFieldType({
    required bool isCustom,
    required Map<String, Model> models,
  }) =>
      type.modelFieldType(isCustom: isCustom, models: models);
}
