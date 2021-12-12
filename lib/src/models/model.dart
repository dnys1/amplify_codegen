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
    b.readOnly = false;
  }

  factory ModelField([void Function(ModelFieldBuilder) updates]) = _$ModelField;
  ModelField._();

  String get name;
  bool get required;
  bool get readOnly;
  ModelFieldMetadata get metadata;
  BuiltList<AuthRule> get authRules;

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

abstract class ModelFieldMetadata
    implements Built<ModelFieldMetadata, ModelFieldMetadataBuilder> {
  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(ModelFieldMetadataBuilder b) {
    b
      ..isPrimaryKey = false
      ..isBelongsTo = false
      ..isHasMany = false
      ..isHasOne = false;
  }

  AWSType get type;
  bool get isPrimaryKey;
  bool get isList;
  bool get isHasOne;
  bool get isHasMany;
  bool get isBelongsTo;
  String? get modelName;
  String? get targetName;
  String? get associatedName;
  String? get associatedType;

  factory ModelFieldMetadata(
          [void Function(ModelFieldMetadataBuilder) updates]) =
      _$ModelFieldMetadata;
  ModelFieldMetadata._();

  Map<String, Object?> toJson() {
    return serializers.serializeWith(ModelFieldMetadata.serializer, this)
        as Map<String, Object?>;
  }

  static ModelFieldMetadata? fromJson(Map<String, Object?> json) {
    return serializers.deserializeWith(ModelFieldMetadata.serializer, json);
  }

  static Serializer<ModelFieldMetadata> get serializer =>
      _$modelFieldMetadataSerializer;
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