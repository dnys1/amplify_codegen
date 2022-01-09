///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authStrategyDescriptor instead')
const AuthStrategy$json = const {
  '1': 'AuthStrategy',
  '2': const [
    const {'1': 'ALLOW_UNSPECIFIED', '2': 0},
    const {'1': 'ALLOW_PUBLIC', '2': 1},
    const {'1': 'ALLOW_PRIVATE', '2': 2},
    const {'1': 'ALLOW_OWNER', '2': 3},
    const {'1': 'ALLOW_GROUPS', '2': 4},
    const {'1': 'ALLOW_CUSTOM', '2': 5},
  ],
};

/// Descriptor for `AuthStrategy`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authStrategyDescriptor = $convert.base64Decode('CgxBdXRoU3RyYXRlZ3kSFQoRQUxMT1dfVU5TUEVDSUZJRUQQABIQCgxBTExPV19QVUJMSUMQARIRCg1BTExPV19QUklWQVRFEAISDwoLQUxMT1dfT1dORVIQAxIQCgxBTExPV19HUk9VUFMQBBIQCgxBTExPV19DVVNUT00QBQ==');
@$core.Deprecated('Use authProviderDescriptor instead')
const AuthProvider$json = const {
  '1': 'AuthProvider',
  '2': const [
    const {'1': 'BY_UNSPECIFIED', '2': 0},
    const {'1': 'BY_API_KEY', '2': 1},
    const {'1': 'BY_IAM', '2': 2},
    const {'1': 'BY_USER_POOLS', '2': 3},
    const {'1': 'BY_OIDC', '2': 4},
    const {'1': 'BY_LAMBDA', '2': 5},
  ],
};

/// Descriptor for `AuthProvider`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authProviderDescriptor = $convert.base64Decode('CgxBdXRoUHJvdmlkZXISEgoOQllfVU5TUEVDSUZJRUQQABIOCgpCWV9BUElfS0VZEAESCgoGQllfSUFNEAISEQoNQllfVVNFUl9QT09MUxADEgsKB0JZX09JREMQBBINCglCWV9MQU1CREEQBQ==');
@$core.Deprecated('Use modelOperationDescriptor instead')
const ModelOperation$json = const {
  '1': 'ModelOperation',
  '2': const [
    const {'1': 'OP_UNSPECIFIED', '2': 0},
    const {'1': 'OP_READ', '2': 1},
    const {'1': 'OP_CREATE', '2': 2},
    const {'1': 'OP_UPDATE', '2': 3},
    const {'1': 'OP_DELETE', '2': 4},
  ],
};

/// Descriptor for `ModelOperation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List modelOperationDescriptor = $convert.base64Decode('Cg5Nb2RlbE9wZXJhdGlvbhISCg5PUF9VTlNQRUNJRklFRBAAEgsKB09QX1JFQUQQARINCglPUF9DUkVBVEUQAhINCglPUF9VUERBVEUQAxINCglPUF9ERUxFVEUQBA==');
@$core.Deprecated('Use graphQLTypeDescriptor instead')
const GraphQLType$json = const {
  '1': 'GraphQLType',
  '2': const [
    const {'1': 'TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'TYPE_ID', '2': 1},
    const {'1': 'TYPE_STRING', '2': 2},
    const {'1': 'TYPE_INT', '2': 3},
    const {'1': 'TYPE_FLOAT', '2': 4},
    const {'1': 'TYPE_BOOLEAN', '2': 5},
    const {'1': 'TYPE_AWS_DATE', '2': 6},
    const {'1': 'TYPE_AWS_TIME', '2': 7},
    const {'1': 'TYPE_AWS_DATE_TIME', '2': 8},
    const {'1': 'TYPE_AWS_TIMESTAMP', '2': 9},
    const {'1': 'TYPE_AWS_EMAIL', '2': 10},
    const {'1': 'TYPE_AWS_JSON', '2': 11},
    const {'1': 'TYPE_AWS_PHONE', '2': 12},
    const {'1': 'TYPE_AWS_URL', '2': 13},
    const {'1': 'TYPE_AWS_IP_ADDRESS', '2': 14},
    const {'1': 'TYPE_MODEL', '2': 15},
  ],
};

/// Descriptor for `GraphQLType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List graphQLTypeDescriptor = $convert.base64Decode('CgtHcmFwaFFMVHlwZRIUChBUWVBFX1VOU1BFQ0lGSUVEEAASCwoHVFlQRV9JRBABEg8KC1RZUEVfU1RSSU5HEAISDAoIVFlQRV9JTlQQAxIOCgpUWVBFX0ZMT0FUEAQSEAoMVFlQRV9CT09MRUFOEAUSEQoNVFlQRV9BV1NfREFURRAGEhEKDVRZUEVfQVdTX1RJTUUQBxIWChJUWVBFX0FXU19EQVRFX1RJTUUQCBIWChJUWVBFX0FXU19USU1FU1RBTVAQCRISCg5UWVBFX0FXU19FTUFJTBAKEhEKDVRZUEVfQVdTX0pTT04QCxISCg5UWVBFX0FXU19QSE9ORRAMEhAKDFRZUEVfQVdTX1VSTBANEhcKE1RZUEVfQVdTX0lQX0FERFJFU1MQDhIOCgpUWVBFX01PREVMEA8=');
@$core.Deprecated('Use modelAssociationDescriptor instead')
const ModelAssociation$json = const {
  '1': 'ModelAssociation',
  '2': const [
    const {'1': 'IS_UNSPECIFIED', '2': 0},
    const {'1': 'IS_HAS_ONE', '2': 1},
    const {'1': 'IS_HAS_MANY', '2': 2},
    const {'1': 'IS_BELONGS_TO', '2': 3},
    const {'1': 'IS_MANY_TO_MANY', '2': 4},
  ],
};

/// Descriptor for `ModelAssociation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List modelAssociationDescriptor = $convert.base64Decode('ChBNb2RlbEFzc29jaWF0aW9uEhIKDklTX1VOU1BFQ0lGSUVEEAASDgoKSVNfSEFTX09ORRABEg8KC0lTX0hBU19NQU5ZEAISEQoNSVNfQkVMT05HU19UTxADEhMKD0lTX01BTllfVE9fTUFOWRAE');
@$core.Deprecated('Use authRuleDescriptor instead')
const AuthRule$json = const {
  '1': 'AuthRule',
  '2': const [
    const {'1': 'allow', '3': 1, '4': 1, '5': 14, '6': '.AuthStrategy', '10': 'allow'},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.AuthProvider', '10': 'provider'},
    const {'1': 'owner_field', '3': 3, '4': 1, '5': 9, '10': 'ownerField'},
    const {'1': 'identity_claim', '3': 4, '4': 1, '5': 9, '10': 'identityClaim'},
    const {'1': 'group_claim', '3': 5, '4': 1, '5': 9, '10': 'groupClaim'},
    const {'1': 'groups', '3': 6, '4': 3, '5': 9, '10': 'groups'},
    const {'1': 'groups_field', '3': 7, '4': 1, '5': 9, '10': 'groupsField'},
    const {'1': 'operations', '3': 8, '4': 3, '5': 14, '6': '.ModelOperation', '10': 'operations'},
  ],
};

/// Descriptor for `AuthRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRuleDescriptor = $convert.base64Decode('CghBdXRoUnVsZRIjCgVhbGxvdxgBIAEoDjINLkF1dGhTdHJhdGVneVIFYWxsb3cSKQoIcHJvdmlkZXIYAiABKA4yDS5BdXRoUHJvdmlkZXJSCHByb3ZpZGVyEh8KC293bmVyX2ZpZWxkGAMgASgJUgpvd25lckZpZWxkEiUKDmlkZW50aXR5X2NsYWltGAQgASgJUg1pZGVudGl0eUNsYWltEh8KC2dyb3VwX2NsYWltGAUgASgJUgpncm91cENsYWltEhYKBmdyb3VwcxgGIAMoCVIGZ3JvdXBzEiEKDGdyb3Vwc19maWVsZBgHIAEoCVILZ3JvdXBzRmllbGQSLwoKb3BlcmF0aW9ucxgIIAMoDjIPLk1vZGVsT3BlcmF0aW9uUgpvcGVyYXRpb25z');
@$core.Deprecated('Use boolValueDescriptor instead')
const BoolValue$json = const {
  '1': 'BoolValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `BoolValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boolValueDescriptor = $convert.base64Decode('CglCb29sVmFsdWUSFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use modelFieldDescriptor instead')
const ModelField$json = const {
  '1': 'ModelField',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 2, '4': 1, '5': 11, '6': '.ModelField.TypeInfo', '10': 'type'},
    const {'1': 'is_primary_key', '3': 3, '4': 1, '5': 8, '10': 'isPrimaryKey'},
    const {'1': 'is_read_only', '3': 4, '4': 1, '5': 8, '10': 'isReadOnly'},
    const {'1': 'auth_rules', '3': 5, '4': 3, '5': 11, '6': '.AuthRule', '10': 'authRules'},
    const {'1': 'association', '3': 6, '4': 1, '5': 14, '6': '.ModelAssociation', '10': 'association'},
    const {'1': 'target_name', '3': 7, '4': 1, '5': 9, '10': 'targetName'},
    const {'1': 'associated_name', '3': 8, '4': 1, '5': 9, '10': 'associatedName'},
    const {'1': 'associated_type', '3': 9, '4': 1, '5': 9, '10': 'associatedType'},
    const {'1': 'is_synthetic', '3': 10, '4': 1, '5': 8, '10': 'isSynthetic'},
  ],
  '3': const [ModelField_TypeInfo$json],
};

@$core.Deprecated('Use modelFieldDescriptor instead')
const ModelField_TypeInfo$json = const {
  '1': 'TypeInfo',
  '2': const [
    const {'1': 'graphql_type', '3': 1, '4': 1, '5': 14, '6': '.GraphQLType', '10': 'graphqlType'},
    const {'1': 'is_required', '3': 2, '4': 1, '5': 8, '10': 'isRequired'},
    const {'1': 'is_array', '3': 3, '4': 1, '5': 8, '10': 'isArray'},
    const {'1': 'array_type', '3': 4, '4': 1, '5': 11, '6': '.ModelField.TypeInfo', '10': 'arrayType'},
    const {'1': 'model_name', '3': 5, '4': 1, '5': 9, '10': 'modelName'},
    const {'1': 'is_enum', '3': 6, '4': 1, '5': 8, '10': 'isEnum'},
  ],
};

/// Descriptor for `ModelField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelFieldDescriptor = $convert.base64Decode('CgpNb2RlbEZpZWxkEhIKBG5hbWUYASABKAlSBG5hbWUSKAoEdHlwZRgCIAEoCzIULk1vZGVsRmllbGQuVHlwZUluZm9SBHR5cGUSJAoOaXNfcHJpbWFyeV9rZXkYAyABKAhSDGlzUHJpbWFyeUtleRIgCgxpc19yZWFkX29ubHkYBCABKAhSCmlzUmVhZE9ubHkSKAoKYXV0aF9ydWxlcxgFIAMoCzIJLkF1dGhSdWxlUglhdXRoUnVsZXMSMwoLYXNzb2NpYXRpb24YBiABKA4yES5Nb2RlbEFzc29jaWF0aW9uUgthc3NvY2lhdGlvbhIfCgt0YXJnZXRfbmFtZRgHIAEoCVIKdGFyZ2V0TmFtZRInCg9hc3NvY2lhdGVkX25hbWUYCCABKAlSDmFzc29jaWF0ZWROYW1lEicKD2Fzc29jaWF0ZWRfdHlwZRgJIAEoCVIOYXNzb2NpYXRlZFR5cGUSIQoMaXNfc3ludGhldGljGAogASgIUgtpc1N5bnRoZXRpYxrkAQoIVHlwZUluZm8SLwoMZ3JhcGhxbF90eXBlGAEgASgOMgwuR3JhcGhRTFR5cGVSC2dyYXBocWxUeXBlEh8KC2lzX3JlcXVpcmVkGAIgASgIUgppc1JlcXVpcmVkEhkKCGlzX2FycmF5GAMgASgIUgdpc0FycmF5EjMKCmFycmF5X3R5cGUYBCABKAsyFC5Nb2RlbEZpZWxkLlR5cGVJbmZvUglhcnJheVR5cGUSHQoKbW9kZWxfbmFtZRgFIAEoCVIJbW9kZWxOYW1lEhcKB2lzX2VudW0YBiABKAhSBmlzRW51bQ==');
@$core.Deprecated('Use modelDescriptor instead')
const Model$json = const {
  '1': 'Model',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'fields', '3': 2, '4': 3, '5': 11, '6': '.ModelField', '10': 'fields'},
    const {'1': 'auth_rules', '3': 3, '4': 3, '5': 11, '6': '.AuthRule', '10': 'authRules'},
    const {'1': 'is_custom', '3': 4, '4': 1, '5': 8, '10': 'isCustom'},
  ],
};

/// Descriptor for `Model`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modelDescriptor = $convert.base64Decode('CgVNb2RlbBISCgRuYW1lGAEgASgJUgRuYW1lEiMKBmZpZWxkcxgCIAMoCzILLk1vZGVsRmllbGRSBmZpZWxkcxIoCgphdXRoX3J1bGVzGAMgAygLMgkuQXV0aFJ1bGVSCWF1dGhSdWxlcxIbCglpc19jdXN0b20YBCABKAhSCGlzQ3VzdG9t');
