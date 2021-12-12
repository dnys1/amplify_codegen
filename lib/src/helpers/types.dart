import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/model.dart';
import 'package:amplify_codegen/src/generator/visitors.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';
import 'package:recase/recase.dart';

const datastoreUri =
    'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

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

  TypeReference get reference => accept(TypeVisitor())!;

  /// The type of model field this represents.
  AWSType get awsType => AWSType.values.firstWhere(
        (type) => type.name == typeName,
        orElse: () => AWSType.Model,
      );

  /// Whether this is a Model/Enum type
  bool get isModel => awsType == AWSType.Model;
}

extension TypeReferenceHelpers on Reference {
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

extension AWSTypeHelpers on AWSType {
  TypeReference typeRef([String? modelName]) {
    switch (this) {
      case AWSType.ID:
      case AWSType.String:
      case AWSType.AWSEmail:
      case AWSType.AWSJSON:
      case AWSType.AWSPhone:
      case AWSType.AWSURL:
      case AWSType.AWSIPAddress:
        return const Reference('String').type as TypeReference;
      case AWSType.Int:
        return const Reference('int').type as TypeReference;
      case AWSType.Float:
        return const Reference('double').type as TypeReference;
      case AWSType.Boolean:
        return const Reference('bool').type as TypeReference;
      case AWSType.AWSDate:
        return const Reference(
          'TemporalDate',
          datastoreUri,
        ).type as TypeReference;
      case AWSType.AWSTime:
        return const Reference(
          'TemporalTime',
          datastoreUri,
        ).type as TypeReference;
      case AWSType.AWSDateTime:
        return const Reference(
          'TemporalDateTime',
          datastoreUri,
        ).type as TypeReference;
      case AWSType.AWSTimestamp:
        return const Reference(
          'TemporalTimestamp',
          datastoreUri,
        ).type as TypeReference;
      case AWSType.Model:
        return Reference(
          modelName!,
          ReCase(modelName).snakeCase + '.dart',
        ).type as TypeReference;
    }
  }
}

extension ModelFieldHelpers on ModelFieldMetadata {
  TypeReference get typeReference {
    return type.typeRef(modelName);
  }

  ModelFieldType modelFieldType({
    required bool isCustom,
    required List<Model> models,
  }) {
    switch (type) {
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

    if (isList) {
      return isCustom
          ? ModelFieldType.embeddedCollection
          : ModelFieldType.collection;
    }

    final isModel = models.any((model) => model.name == modelName!);
    if (isModel) {
      return isCustom ? ModelFieldType.embedded : ModelFieldType.model;
    }

    return ModelFieldType.enumeration;
  }
}
