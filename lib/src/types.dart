import 'package:code_builder/code_builder.dart';

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

class AWSTypes {
  AWSTypes._(
    String symbol, {
    this.isModel = false,
    String? uri,
  }) : _ref = refer(symbol, uri);

  const AWSTypes._ref(
    this._ref, {
    this.isModel = false,
  });

  AWSTypes.model(String modelName)
      : _ref = refer(modelName),
        isModel = true;

  AWSTypes.modelType(String modelName)
      : _ref = TypeReference(
          (t) => t
            ..symbol = 'ModelType'
            ..types.add(refer(modelName))
            ..url = datastoreUri,
        ),
        isModel = false;

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

  static final id = string;
  static final string = AWSTypes._('String');
  static final int = AWSTypes._('int');
  static final float = AWSTypes._('double');
  static final boolean = AWSTypes._('bool');
  static final awsDate = AWSTypes._('TemporalDate', uri: datastoreUri);
  static final awsTime = AWSTypes._('TemporalTime', uri: datastoreUri);
  static final awsDateTime = AWSTypes._('TemporalDateTime', uri: datastoreUri);
  static final awsTimestamp =
      AWSTypes._('TemporalTimestamp', uri: datastoreUri);
  static final awsPhone = string;
  static final awsUrl = string;
  static final awsIpAddress = string;
  static final awsEmail = string;
  static final awsJson = AWSTypes._ref(mapOf('String', 'Object?'));

  TypeReference get reference => _ref is TypeReference
      ? _ref as TypeReference
      : _ref.type as TypeReference;
}
