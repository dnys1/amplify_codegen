///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthStrategy extends $pb.ProtobufEnum {
  static const AuthStrategy ALLOW_UNSPECIFIED = AuthStrategy._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_UNSPECIFIED');
  static const AuthStrategy ALLOW_PUBLIC = AuthStrategy._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_PUBLIC');
  static const AuthStrategy ALLOW_PRIVATE = AuthStrategy._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_PRIVATE');
  static const AuthStrategy ALLOW_OWNER = AuthStrategy._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_OWNER');
  static const AuthStrategy ALLOW_GROUPS = AuthStrategy._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_GROUPS');
  static const AuthStrategy ALLOW_CUSTOM = AuthStrategy._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_CUSTOM');

  static const $core.List<AuthStrategy> values = <AuthStrategy> [
    ALLOW_UNSPECIFIED,
    ALLOW_PUBLIC,
    ALLOW_PRIVATE,
    ALLOW_OWNER,
    ALLOW_GROUPS,
    ALLOW_CUSTOM,
  ];

  static final $core.Map<$core.int, AuthStrategy> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthStrategy? valueOf($core.int value) => _byValue[value];

  const AuthStrategy._($core.int v, $core.String n) : super(v, n);
}

class AuthProvider extends $pb.ProtobufEnum {
  static const AuthProvider BY_UNSPECIFIED = AuthProvider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_UNSPECIFIED');
  static const AuthProvider BY_API_KEY = AuthProvider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_API_KEY');
  static const AuthProvider BY_IAM = AuthProvider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_IAM');
  static const AuthProvider BY_USER_POOLS = AuthProvider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_USER_POOLS');
  static const AuthProvider BY_OIDC = AuthProvider._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_OIDC');
  static const AuthProvider BY_LAMBDA = AuthProvider._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BY_LAMBDA');

  static const $core.List<AuthProvider> values = <AuthProvider> [
    BY_UNSPECIFIED,
    BY_API_KEY,
    BY_IAM,
    BY_USER_POOLS,
    BY_OIDC,
    BY_LAMBDA,
  ];

  static final $core.Map<$core.int, AuthProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthProvider? valueOf($core.int value) => _byValue[value];

  const AuthProvider._($core.int v, $core.String n) : super(v, n);
}

class ModelOperation extends $pb.ProtobufEnum {
  static const ModelOperation OP_UNSPECIFIED = ModelOperation._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OP_UNSPECIFIED');
  static const ModelOperation OP_READ = ModelOperation._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OP_READ');
  static const ModelOperation OP_CREATE = ModelOperation._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OP_CREATE');
  static const ModelOperation OP_UPDATE = ModelOperation._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OP_UPDATE');
  static const ModelOperation OP_DELETE = ModelOperation._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OP_DELETE');

  static const $core.List<ModelOperation> values = <ModelOperation> [
    OP_UNSPECIFIED,
    OP_READ,
    OP_CREATE,
    OP_UPDATE,
    OP_DELETE,
  ];

  static final $core.Map<$core.int, ModelOperation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModelOperation? valueOf($core.int value) => _byValue[value];

  const ModelOperation._($core.int v, $core.String n) : super(v, n);
}

class GraphQLType extends $pb.ProtobufEnum {
  static const GraphQLType TYPE_UNSPECIFIED = GraphQLType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_UNSPECIFIED');
  static const GraphQLType TYPE_ID = GraphQLType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_ID');
  static const GraphQLType TYPE_STRING = GraphQLType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_STRING');
  static const GraphQLType TYPE_INT = GraphQLType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_INT');
  static const GraphQLType TYPE_FLOAT = GraphQLType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_FLOAT');
  static const GraphQLType TYPE_BOOLEAN = GraphQLType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_BOOLEAN');
  static const GraphQLType TYPE_AWS_DATE = GraphQLType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_DATE');
  static const GraphQLType TYPE_AWS_TIME = GraphQLType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_TIME');
  static const GraphQLType TYPE_AWS_DATE_TIME = GraphQLType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_DATE_TIME');
  static const GraphQLType TYPE_AWS_TIMESTAMP = GraphQLType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_TIMESTAMP');
  static const GraphQLType TYPE_AWS_EMAIL = GraphQLType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_EMAIL');
  static const GraphQLType TYPE_AWS_JSON = GraphQLType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_JSON');
  static const GraphQLType TYPE_AWS_PHONE = GraphQLType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_PHONE');
  static const GraphQLType TYPE_AWS_URL = GraphQLType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_URL');
  static const GraphQLType TYPE_AWS_IP_ADDRESS = GraphQLType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_AWS_IP_ADDRESS');
  static const GraphQLType TYPE_MODEL = GraphQLType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPE_MODEL');

  static const $core.List<GraphQLType> values = <GraphQLType> [
    TYPE_UNSPECIFIED,
    TYPE_ID,
    TYPE_STRING,
    TYPE_INT,
    TYPE_FLOAT,
    TYPE_BOOLEAN,
    TYPE_AWS_DATE,
    TYPE_AWS_TIME,
    TYPE_AWS_DATE_TIME,
    TYPE_AWS_TIMESTAMP,
    TYPE_AWS_EMAIL,
    TYPE_AWS_JSON,
    TYPE_AWS_PHONE,
    TYPE_AWS_URL,
    TYPE_AWS_IP_ADDRESS,
    TYPE_MODEL,
  ];

  static final $core.Map<$core.int, GraphQLType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GraphQLType? valueOf($core.int value) => _byValue[value];

  const GraphQLType._($core.int v, $core.String n) : super(v, n);
}

class ModelAssociation extends $pb.ProtobufEnum {
  static const ModelAssociation IS_UNSPECIFIED = ModelAssociation._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IS_UNSPECIFIED');
  static const ModelAssociation IS_HAS_ONE = ModelAssociation._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IS_HAS_ONE');
  static const ModelAssociation IS_HAS_MANY = ModelAssociation._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IS_HAS_MANY');
  static const ModelAssociation IS_BELONGS_TO = ModelAssociation._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IS_BELONGS_TO');
  static const ModelAssociation IS_MANY_TO_MANY = ModelAssociation._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IS_MANY_TO_MANY');

  static const $core.List<ModelAssociation> values = <ModelAssociation> [
    IS_UNSPECIFIED,
    IS_HAS_ONE,
    IS_HAS_MANY,
    IS_BELONGS_TO,
    IS_MANY_TO_MANY,
  ];

  static final $core.Map<$core.int, ModelAssociation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModelAssociation? valueOf($core.int value) => _byValue[value];

  const ModelAssociation._($core.int v, $core.String n) : super(v, n);
}

