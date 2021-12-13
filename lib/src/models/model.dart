import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'auth_rule.dart';
import 'serializers.dart';

part 'model.g.dart';

abstract class Model implements Built<Model, ModelBuilder> {
  factory Model([void Function(ModelBuilder) updates]) = _$Model;
  Model._();

  String get name;
  BuiltList<ModelField> get fields;
  BuiltList<AuthRule> get authRules;
  bool get isCustom;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Model.serializer, this)
        as Map<String, Object?>;
  }

  static Model? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Model.serializer, json);
  }

  static Serializer<Model> get serializer => _$modelSerializer;
}

abstract class ModelField implements Built<ModelField, ModelFieldBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(ModelFieldBuilder b) {
    b
      ..isReadOnly = false
      ..isPrimaryKey = false
      ..isBelongsTo = false
      ..isHasMany = false
      ..isHasOne = false
      ..ignore = false;
  }

  factory ModelField([void Function(ModelFieldBuilder) updates]) = _$ModelField;
  ModelField._();

  String get name;
  bool get ignore;
  bool get isReadOnly;
  BuiltList<AuthRule> get authRules;
  TypeInfo get type;
  bool get isPrimaryKey;
  bool get isHasOne;
  bool get isHasMany;
  bool get isBelongsTo;
  String? get targetName;
  String? get associatedName;
  String? get associatedType;

  Map<String, Object?> toJson() {
    return serializers.serializeWith(ModelField.serializer, this)
        as Map<String, Object?>;
  }

  static ModelField? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ModelField.serializer, json);
  }

  static Serializer<ModelField> get serializer => _$modelFieldSerializer;
}

enum AWSType {
  ID,
  String,
  Int,
  Float,
  Boolean,
  AWSDate,
  AWSTime,
  AWSDateTime,
  AWSTimestamp,
  AWSEmail,
  AWSJSON,
  AWSPhone,
  AWSURL,
  AWSIPAddress,
  Model,
}

abstract class TypeInfo implements Built<TypeInfo, TypeInfoBuilder> {
  @BuiltValueHook(finalizeBuilder: true)
  static void _setDefaults(TypeInfoBuilder b) {
    b.isEnum ??= false;
  }

  factory TypeInfo([void Function(TypeInfoBuilder) updates]) = _$TypeInfo;
  TypeInfo._();

  AWSType? get awsType;
  bool get isRequired;
  bool get isList;
  String? get modelName;
  TypeInfo? get listType;
  bool get isEnum;

  Map<String, Object?> toJson() {
    return serializers.serializeWith(TypeInfo.serializer, this)
        as Map<String, Object?>;
  }

  static TypeInfo? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(TypeInfo.serializer, json);
  }

  static Serializer<TypeInfo> get serializer => _$typeInfoSerializer;
}

class AWSTypeSerializer extends PrimitiveSerializer<AWSType> {
  @override
  Iterable<Type> get types => [AWSType];

  @override
  String get wireName => 'AWSType';

  @override
  AWSType deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return AWSType.values.byName(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, AWSType object,
      {FullType specifiedType = FullType.unspecified}) {
    return object.name;
  }
}

// ignore_for_file: constant_identifier_names