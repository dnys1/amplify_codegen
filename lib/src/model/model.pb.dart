///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pbenum.dart';

export 'model.pbenum.dart';

class AuthRule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthRule', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'amplify.model'), createEmptyInstance: create)
    ..e<AuthStrategy>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allow', $pb.PbFieldType.OE, defaultOrMaker: AuthStrategy.ALLOW_UNSPECIFIED, valueOf: AuthStrategy.valueOf, enumValues: AuthStrategy.values)
    ..e<AuthProvider>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'provider', $pb.PbFieldType.OE, defaultOrMaker: AuthProvider.BY_UNSPECIFIED, valueOf: AuthProvider.valueOf, enumValues: AuthProvider.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ownerField')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'identityClaim')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupClaim')
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groups')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupsField')
    ..pc<ModelOperation>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operations', $pb.PbFieldType.PE, valueOf: ModelOperation.valueOf, enumValues: ModelOperation.values)
    ..hasRequiredFields = false
  ;

  AuthRule._() : super();
  factory AuthRule({
    AuthStrategy? allow,
    AuthProvider? provider,
    $core.String? ownerField,
    $core.String? identityClaim,
    $core.String? groupClaim,
    $core.Iterable<$core.String>? groups,
    $core.String? groupsField,
    $core.Iterable<ModelOperation>? operations,
  }) {
    final _result = create();
    if (allow != null) {
      _result.allow = allow;
    }
    if (provider != null) {
      _result.provider = provider;
    }
    if (ownerField != null) {
      _result.ownerField = ownerField;
    }
    if (identityClaim != null) {
      _result.identityClaim = identityClaim;
    }
    if (groupClaim != null) {
      _result.groupClaim = groupClaim;
    }
    if (groups != null) {
      _result.groups.addAll(groups);
    }
    if (groupsField != null) {
      _result.groupsField = groupsField;
    }
    if (operations != null) {
      _result.operations.addAll(operations);
    }
    return _result;
  }
  factory AuthRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthRule clone() => AuthRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthRule copyWith(void Function(AuthRule) updates) => super.copyWith((message) => updates(message as AuthRule)) as AuthRule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthRule create() => AuthRule._();
  AuthRule createEmptyInstance() => create();
  static $pb.PbList<AuthRule> createRepeated() => $pb.PbList<AuthRule>();
  @$core.pragma('dart2js:noInline')
  static AuthRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthRule>(create);
  static AuthRule? _defaultInstance;

  @$pb.TagNumber(1)
  AuthStrategy get allow => $_getN(0);
  @$pb.TagNumber(1)
  set allow(AuthStrategy v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAllow() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllow() => clearField(1);

  @$pb.TagNumber(2)
  AuthProvider get provider => $_getN(1);
  @$pb.TagNumber(2)
  set provider(AuthProvider v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProvider() => $_has(1);
  @$pb.TagNumber(2)
  void clearProvider() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ownerField => $_getSZ(2);
  @$pb.TagNumber(3)
  set ownerField($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOwnerField() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerField() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get identityClaim => $_getSZ(3);
  @$pb.TagNumber(4)
  set identityClaim($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdentityClaim() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdentityClaim() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get groupClaim => $_getSZ(4);
  @$pb.TagNumber(5)
  set groupClaim($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroupClaim() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupClaim() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get groups => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get groupsField => $_getSZ(6);
  @$pb.TagNumber(7)
  set groupsField($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasGroupsField() => $_has(6);
  @$pb.TagNumber(7)
  void clearGroupsField() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<ModelOperation> get operations => $_getList(7);
}

class ModelField_TypeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModelField.TypeInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'amplify.model'), createEmptyInstance: create)
    ..e<GraphQLType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'graphqlType', $pb.PbFieldType.OE, defaultOrMaker: GraphQLType.TYPE_UNSPECIFIED, valueOf: GraphQLType.valueOf, enumValues: GraphQLType.values)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isRequired')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isArray')
    ..aOM<ModelField_TypeInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arrayType', subBuilder: ModelField_TypeInfo.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modelName')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isEnum')
    ..hasRequiredFields = false
  ;

  ModelField_TypeInfo._() : super();
  factory ModelField_TypeInfo({
    GraphQLType? graphqlType,
    $core.bool? isRequired,
    $core.bool? isArray,
    ModelField_TypeInfo? arrayType,
    $core.String? modelName,
    $core.bool? isEnum,
  }) {
    final _result = create();
    if (graphqlType != null) {
      _result.graphqlType = graphqlType;
    }
    if (isRequired != null) {
      _result.isRequired = isRequired;
    }
    if (isArray != null) {
      _result.isArray = isArray;
    }
    if (arrayType != null) {
      _result.arrayType = arrayType;
    }
    if (modelName != null) {
      _result.modelName = modelName;
    }
    if (isEnum != null) {
      _result.isEnum = isEnum;
    }
    return _result;
  }
  factory ModelField_TypeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelField_TypeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelField_TypeInfo clone() => ModelField_TypeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelField_TypeInfo copyWith(void Function(ModelField_TypeInfo) updates) => super.copyWith((message) => updates(message as ModelField_TypeInfo)) as ModelField_TypeInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModelField_TypeInfo create() => ModelField_TypeInfo._();
  ModelField_TypeInfo createEmptyInstance() => create();
  static $pb.PbList<ModelField_TypeInfo> createRepeated() => $pb.PbList<ModelField_TypeInfo>();
  @$core.pragma('dart2js:noInline')
  static ModelField_TypeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelField_TypeInfo>(create);
  static ModelField_TypeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  GraphQLType get graphqlType => $_getN(0);
  @$pb.TagNumber(1)
  set graphqlType(GraphQLType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGraphqlType() => $_has(0);
  @$pb.TagNumber(1)
  void clearGraphqlType() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isRequired => $_getBF(1);
  @$pb.TagNumber(2)
  set isRequired($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRequired() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRequired() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isArray => $_getBF(2);
  @$pb.TagNumber(3)
  set isArray($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsArray() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsArray() => clearField(3);

  @$pb.TagNumber(4)
  ModelField_TypeInfo get arrayType => $_getN(3);
  @$pb.TagNumber(4)
  set arrayType(ModelField_TypeInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasArrayType() => $_has(3);
  @$pb.TagNumber(4)
  void clearArrayType() => clearField(4);
  @$pb.TagNumber(4)
  ModelField_TypeInfo ensureArrayType() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get modelName => $_getSZ(4);
  @$pb.TagNumber(5)
  set modelName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasModelName() => $_has(4);
  @$pb.TagNumber(5)
  void clearModelName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isEnum => $_getBF(5);
  @$pb.TagNumber(6)
  set isEnum($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsEnum() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsEnum() => clearField(6);
}

class ModelField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ModelField', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'amplify.model'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<ModelField_TypeInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', subBuilder: ModelField_TypeInfo.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isPrimaryKey')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isReadOnly')
    ..pc<AuthRule>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authRules', $pb.PbFieldType.PM, subBuilder: AuthRule.create)
    ..e<ModelAssociation>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'association', $pb.PbFieldType.OE, defaultOrMaker: ModelAssociation.IS_UNSPECIFIED, valueOf: ModelAssociation.valueOf, enumValues: ModelAssociation.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetName')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'associatedName')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'associatedType')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSynthetic')
    ..hasRequiredFields = false
  ;

  ModelField._() : super();
  factory ModelField({
    $core.String? name,
    ModelField_TypeInfo? type,
    $core.bool? isPrimaryKey,
    $core.bool? isReadOnly,
    $core.Iterable<AuthRule>? authRules,
    ModelAssociation? association,
    $core.String? targetName,
    $core.String? associatedName,
    $core.String? associatedType,
    $core.bool? isSynthetic,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (isPrimaryKey != null) {
      _result.isPrimaryKey = isPrimaryKey;
    }
    if (isReadOnly != null) {
      _result.isReadOnly = isReadOnly;
    }
    if (authRules != null) {
      _result.authRules.addAll(authRules);
    }
    if (association != null) {
      _result.association = association;
    }
    if (targetName != null) {
      _result.targetName = targetName;
    }
    if (associatedName != null) {
      _result.associatedName = associatedName;
    }
    if (associatedType != null) {
      _result.associatedType = associatedType;
    }
    if (isSynthetic != null) {
      _result.isSynthetic = isSynthetic;
    }
    return _result;
  }
  factory ModelField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ModelField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ModelField clone() => ModelField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ModelField copyWith(void Function(ModelField) updates) => super.copyWith((message) => updates(message as ModelField)) as ModelField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ModelField create() => ModelField._();
  ModelField createEmptyInstance() => create();
  static $pb.PbList<ModelField> createRepeated() => $pb.PbList<ModelField>();
  @$core.pragma('dart2js:noInline')
  static ModelField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ModelField>(create);
  static ModelField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  ModelField_TypeInfo get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ModelField_TypeInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
  @$pb.TagNumber(2)
  ModelField_TypeInfo ensureType() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get isPrimaryKey => $_getBF(2);
  @$pb.TagNumber(3)
  set isPrimaryKey($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsPrimaryKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsPrimaryKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isReadOnly => $_getBF(3);
  @$pb.TagNumber(4)
  set isReadOnly($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsReadOnly() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsReadOnly() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<AuthRule> get authRules => $_getList(4);

  @$pb.TagNumber(6)
  ModelAssociation get association => $_getN(5);
  @$pb.TagNumber(6)
  set association(ModelAssociation v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAssociation() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssociation() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get targetName => $_getSZ(6);
  @$pb.TagNumber(7)
  set targetName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTargetName() => $_has(6);
  @$pb.TagNumber(7)
  void clearTargetName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get associatedName => $_getSZ(7);
  @$pb.TagNumber(8)
  set associatedName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAssociatedName() => $_has(7);
  @$pb.TagNumber(8)
  void clearAssociatedName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get associatedType => $_getSZ(8);
  @$pb.TagNumber(9)
  set associatedType($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAssociatedType() => $_has(8);
  @$pb.TagNumber(9)
  void clearAssociatedType() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get isSynthetic => $_getBF(9);
  @$pb.TagNumber(10)
  set isSynthetic($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsSynthetic() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsSynthetic() => clearField(10);
}

class Model extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Model', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'amplify.model'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<ModelField>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: ModelField.create)
    ..pc<AuthRule>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authRules', $pb.PbFieldType.PM, subBuilder: AuthRule.create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isCustom')
    ..hasRequiredFields = false
  ;

  Model._() : super();
  factory Model({
    $core.String? name,
    $core.Iterable<ModelField>? fields,
    $core.Iterable<AuthRule>? authRules,
    $core.bool? isCustom,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    if (authRules != null) {
      _result.authRules.addAll(authRules);
    }
    if (isCustom != null) {
      _result.isCustom = isCustom;
    }
    return _result;
  }
  factory Model.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Model.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Model clone() => Model()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Model copyWith(void Function(Model) updates) => super.copyWith((message) => updates(message as Model)) as Model; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Model create() => Model._();
  Model createEmptyInstance() => create();
  static $pb.PbList<Model> createRepeated() => $pb.PbList<Model>();
  @$core.pragma('dart2js:noInline')
  static Model getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Model>(create);
  static Model? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ModelField> get fields => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<AuthRule> get authRules => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get isCustom => $_getBF(3);
  @$pb.TagNumber(4)
  set isCustom($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsCustom() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsCustom() => clearField(4);
}

class Schema extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Schema', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'amplify.model'), createEmptyInstance: create)
    ..pc<Model>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'models', $pb.PbFieldType.PM, subBuilder: Model.create)
    ..hasRequiredFields = false
  ;

  Schema._() : super();
  factory Schema({
    $core.Iterable<Model>? models,
  }) {
    final _result = create();
    if (models != null) {
      _result.models.addAll(models);
    }
    return _result;
  }
  factory Schema.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Schema.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Schema clone() => Schema()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Schema copyWith(void Function(Schema) updates) => super.copyWith((message) => updates(message as Schema)) as Schema; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Schema create() => Schema._();
  Schema createEmptyInstance() => create();
  static $pb.PbList<Schema> createRepeated() => $pb.PbList<Schema>();
  @$core.pragma('dart2js:noInline')
  static Schema getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Schema>(create);
  static Schema? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Model> get models => $_getList(0);
}

