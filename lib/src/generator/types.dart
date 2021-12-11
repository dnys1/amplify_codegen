import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/model.dart';
import 'package:amplify_codegen/src/generator/visitors.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

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

  bool get isModel => AWSTypes.parse(typeName).isModel;

  TypeReference get reference => accept(TypeVisitor())!;

  /// The type of model field this represents.
  ModelFieldType modelFieldType({
    required bool isCustom,
    required List<Model> models,
  }) {
    if (isList) {
      return isCustom
          ? ModelFieldType.embeddedCollection
          : ModelFieldType.collection;
    }
    final awsType = AWSTypes.parse(typeName);
    switch (awsType) {
      case AWSTypes.string:
        return ModelFieldType.string;
      case AWSTypes.int:
        return ModelFieldType.int;
      case AWSTypes.float:
        return ModelFieldType.double;
      case AWSTypes.awsDate:
        return ModelFieldType.date;
      case AWSTypes.awsDateTime:
        return ModelFieldType.dateTime;
      case AWSTypes.awsTime:
        return ModelFieldType.time;
      case AWSTypes.awsTimestamp:
        return ModelFieldType.timestamp;
      case AWSTypes.boolean:
        return ModelFieldType.bool;
    }

    final isModel = models.any((model) => model.name == typeName);
    if (isModel) {
      return isCustom ? ModelFieldType.embedded : ModelFieldType.model;
    }

    return ModelFieldType.enumeration;
  }
}

class AWSTypes {
  const AWSTypes._(
    this._ref, {
    this.isModel = false,
  });

  AWSTypes.model(String modelName)
      : _ref = refer(modelName),
        isModel = true;

  final Reference _ref;
  final bool isModel;

  factory AWSTypes.parse(String type) {
    switch (type) {
      case 'ID':
        return id;
      case 'String':
        return string;
      case 'Int':
        return int;
      case 'Float':
        return float;
      case 'Boolean':
        return boolean;
      case 'AWSDate':
        return awsDate;
      case 'AWSTime':
        return awsTime;
      case 'AWSDateTime':
        return awsDateTime;
      case 'AWSTimestamp':
        return awsTimestamp;
      case 'AWSPhone':
        return awsPhone;
      case 'AWSURL':
        return awsUrl;
      case 'AWSIPAddress':
        return awsIpAddress;
      case 'AWSEmail':
        return awsEmail;
      case 'AWSJSON':
        return awsJson;
      default:
        return AWSTypes.model(type);
    }
  }

  static const id = string;
  static const string = AWSTypes._(Reference('String'));
  static const int = AWSTypes._(Reference('int'));
  static const float = AWSTypes._(Reference('double'));
  static const boolean = AWSTypes._(Reference('bool'));
  static const awsDate = AWSTypes._(Reference('TemporalDate', datastoreUri));
  static const awsTime = AWSTypes._(Reference('TemporalTime', datastoreUri));
  static const awsDateTime =
      AWSTypes._(Reference('TemporalDateTime', datastoreUri));
  static const awsTimestamp =
      AWSTypes._(Reference('TemporalTimestamp', datastoreUri));
  static const awsPhone = string;
  static const awsUrl = string;
  static const awsIpAddress = string;
  static const awsEmail = string;
  static const awsJson = string;

  TypeReference get reference => _ref is TypeReference
      ? _ref as TypeReference
      : _ref.type as TypeReference;
}
