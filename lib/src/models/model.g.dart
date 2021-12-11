// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Model> _$modelSerializer = new _$ModelSerializer();
Serializer<ModelField> _$modelFieldSerializer = new _$ModelFieldSerializer();
Serializer<ModelFieldMetadata> _$modelFieldMetadataSerializer =
    new _$ModelFieldMetadataSerializer();

class _$ModelSerializer implements StructuredSerializer<Model> {
  @override
  final Iterable<Type> types = const [Model, _$Model];
  @override
  final String wireName = 'Model';

  @override
  Iterable<Object?> serialize(Serializers serializers, Model object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'fields',
      serializers.serialize(object.fields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ModelField)])),
      'authRules',
      serializers.serialize(object.authRules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AuthRule)])),
      'isCustom',
      serializers.serialize(object.isCustom,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Model deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ModelField)]))!
              as BuiltList<Object?>);
          break;
        case 'authRules':
          result.authRules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuthRule)]))!
              as BuiltList<Object?>);
          break;
        case 'isCustom':
          result.isCustom = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ModelFieldSerializer implements StructuredSerializer<ModelField> {
  @override
  final Iterable<Type> types = const [ModelField, _$ModelField];
  @override
  final String wireName = 'ModelField';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'required',
      serializers.serialize(object.required,
          specifiedType: const FullType(bool)),
      'metadata',
      serializers.serialize(object.metadata,
          specifiedType: const FullType(ModelFieldMetadata)),
      'authRules',
      serializers.serialize(object.authRules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AuthRule)])),
    ];

    return result;
  }

  @override
  ModelField deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'required':
          result.required = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'metadata':
          result.metadata.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ModelFieldMetadata))!
              as ModelFieldMetadata);
          break;
        case 'authRules':
          result.authRules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuthRule)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ModelFieldMetadataSerializer
    implements StructuredSerializer<ModelFieldMetadata> {
  @override
  final Iterable<Type> types = const [ModelFieldMetadata, _$ModelFieldMetadata];
  @override
  final String wireName = 'ModelFieldMetadata';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ModelFieldMetadata object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(AWSType)),
      'isList',
      serializers.serialize(object.isList, specifiedType: const FullType(bool)),
      'isHasOne',
      serializers.serialize(object.isHasOne,
          specifiedType: const FullType(bool)),
      'isHasMany',
      serializers.serialize(object.isHasMany,
          specifiedType: const FullType(bool)),
      'isBelongsTo',
      serializers.serialize(object.isBelongsTo,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.modelName;
    if (value != null) {
      result
        ..add('modelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.targetName;
    if (value != null) {
      result
        ..add('targetName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.associatedName;
    if (value != null) {
      result
        ..add('associatedName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.associatedType;
    if (value != null) {
      result
        ..add('associatedType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ModelFieldMetadata deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelFieldMetadataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(AWSType)) as AWSType;
          break;
        case 'isList':
          result.isList = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isHasOne':
          result.isHasOne = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isHasMany':
          result.isHasMany = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isBelongsTo':
          result.isBelongsTo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'modelName':
          result.modelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'targetName':
          result.targetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'associatedName':
          result.associatedName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'associatedType':
          result.associatedType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Model extends Model {
  @override
  final String name;
  @override
  final BuiltList<ModelField> fields;
  @override
  final BuiltList<AuthRule> authRules;
  @override
  final bool isCustom;

  factory _$Model([void Function(ModelBuilder)? updates]) =>
      (new ModelBuilder()..update(updates)).build();

  _$Model._(
      {required this.name,
      required this.fields,
      required this.authRules,
      required this.isCustom})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Model', 'name');
    BuiltValueNullFieldError.checkNotNull(fields, 'Model', 'fields');
    BuiltValueNullFieldError.checkNotNull(authRules, 'Model', 'authRules');
    BuiltValueNullFieldError.checkNotNull(isCustom, 'Model', 'isCustom');
  }

  @override
  Model rebuild(void Function(ModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelBuilder toBuilder() => new ModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Model &&
        name == other.name &&
        fields == other.fields &&
        authRules == other.authRules &&
        isCustom == other.isCustom;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), fields.hashCode), authRules.hashCode),
        isCustom.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Model')
          ..add('name', name)
          ..add('fields', fields)
          ..add('authRules', authRules)
          ..add('isCustom', isCustom))
        .toString();
  }
}

class ModelBuilder implements Builder<Model, ModelBuilder> {
  _$Model? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<ModelField>? _fields;
  ListBuilder<ModelField> get fields =>
      _$this._fields ??= new ListBuilder<ModelField>();
  set fields(ListBuilder<ModelField>? fields) => _$this._fields = fields;

  ListBuilder<AuthRule>? _authRules;
  ListBuilder<AuthRule> get authRules =>
      _$this._authRules ??= new ListBuilder<AuthRule>();
  set authRules(ListBuilder<AuthRule>? authRules) =>
      _$this._authRules = authRules;

  bool? _isCustom;
  bool? get isCustom => _$this._isCustom;
  set isCustom(bool? isCustom) => _$this._isCustom = isCustom;

  ModelBuilder();

  ModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fields = $v.fields.toBuilder();
      _authRules = $v.authRules.toBuilder();
      _isCustom = $v.isCustom;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Model other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Model;
  }

  @override
  void update(void Function(ModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Model build() {
    _$Model _$result;
    try {
      _$result = _$v ??
          new _$Model._(
              name:
                  BuiltValueNullFieldError.checkNotNull(name, 'Model', 'name'),
              fields: fields.build(),
              authRules: authRules.build(),
              isCustom: BuiltValueNullFieldError.checkNotNull(
                  isCustom, 'Model', 'isCustom'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'authRules';
        authRules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Model', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ModelField extends ModelField {
  @override
  final String name;
  @override
  final bool required;
  @override
  final ModelFieldMetadata metadata;
  @override
  final BuiltList<AuthRule> authRules;

  factory _$ModelField([void Function(ModelFieldBuilder)? updates]) =>
      (new ModelFieldBuilder()..update(updates)).build();

  _$ModelField._(
      {required this.name,
      required this.required,
      required this.metadata,
      required this.authRules})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'ModelField', 'name');
    BuiltValueNullFieldError.checkNotNull(required, 'ModelField', 'required');
    BuiltValueNullFieldError.checkNotNull(metadata, 'ModelField', 'metadata');
    BuiltValueNullFieldError.checkNotNull(authRules, 'ModelField', 'authRules');
  }

  @override
  ModelField rebuild(void Function(ModelFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelFieldBuilder toBuilder() => new ModelFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelField &&
        name == other.name &&
        required == other.required &&
        metadata == other.metadata &&
        authRules == other.authRules;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), required.hashCode), metadata.hashCode),
        authRules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ModelField')
          ..add('name', name)
          ..add('required', required)
          ..add('metadata', metadata)
          ..add('authRules', authRules))
        .toString();
  }
}

class ModelFieldBuilder implements Builder<ModelField, ModelFieldBuilder> {
  _$ModelField? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _required;
  bool? get required => _$this._required;
  set required(bool? required) => _$this._required = required;

  ModelFieldMetadataBuilder? _metadata;
  ModelFieldMetadataBuilder get metadata =>
      _$this._metadata ??= new ModelFieldMetadataBuilder();
  set metadata(ModelFieldMetadataBuilder? metadata) =>
      _$this._metadata = metadata;

  ListBuilder<AuthRule>? _authRules;
  ListBuilder<AuthRule> get authRules =>
      _$this._authRules ??= new ListBuilder<AuthRule>();
  set authRules(ListBuilder<AuthRule>? authRules) =>
      _$this._authRules = authRules;

  ModelFieldBuilder();

  ModelFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _required = $v.required;
      _metadata = $v.metadata.toBuilder();
      _authRules = $v.authRules.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelField;
  }

  @override
  void update(void Function(ModelFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ModelField build() {
    _$ModelField _$result;
    try {
      _$result = _$v ??
          new _$ModelField._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'ModelField', 'name'),
              required: BuiltValueNullFieldError.checkNotNull(
                  required, 'ModelField', 'required'),
              metadata: metadata.build(),
              authRules: authRules.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'metadata';
        metadata.build();
        _$failedField = 'authRules';
        authRules.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ModelField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ModelFieldMetadata extends ModelFieldMetadata {
  @override
  final AWSType type;
  @override
  final bool isList;
  @override
  final bool isHasOne;
  @override
  final bool isHasMany;
  @override
  final bool isBelongsTo;
  @override
  final String? modelName;
  @override
  final String? targetName;
  @override
  final String? associatedName;
  @override
  final String? associatedType;

  factory _$ModelFieldMetadata(
          [void Function(ModelFieldMetadataBuilder)? updates]) =>
      (new ModelFieldMetadataBuilder()..update(updates)).build();

  _$ModelFieldMetadata._(
      {required this.type,
      required this.isList,
      required this.isHasOne,
      required this.isHasMany,
      required this.isBelongsTo,
      this.modelName,
      this.targetName,
      this.associatedName,
      this.associatedType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'ModelFieldMetadata', 'type');
    BuiltValueNullFieldError.checkNotNull(
        isList, 'ModelFieldMetadata', 'isList');
    BuiltValueNullFieldError.checkNotNull(
        isHasOne, 'ModelFieldMetadata', 'isHasOne');
    BuiltValueNullFieldError.checkNotNull(
        isHasMany, 'ModelFieldMetadata', 'isHasMany');
    BuiltValueNullFieldError.checkNotNull(
        isBelongsTo, 'ModelFieldMetadata', 'isBelongsTo');
  }

  @override
  ModelFieldMetadata rebuild(
          void Function(ModelFieldMetadataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelFieldMetadataBuilder toBuilder() =>
      new ModelFieldMetadataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelFieldMetadata &&
        type == other.type &&
        isList == other.isList &&
        isHasOne == other.isHasOne &&
        isHasMany == other.isHasMany &&
        isBelongsTo == other.isBelongsTo &&
        modelName == other.modelName &&
        targetName == other.targetName &&
        associatedName == other.associatedName &&
        associatedType == other.associatedType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, type.hashCode), isList.hashCode),
                                isHasOne.hashCode),
                            isHasMany.hashCode),
                        isBelongsTo.hashCode),
                    modelName.hashCode),
                targetName.hashCode),
            associatedName.hashCode),
        associatedType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ModelFieldMetadata')
          ..add('type', type)
          ..add('isList', isList)
          ..add('isHasOne', isHasOne)
          ..add('isHasMany', isHasMany)
          ..add('isBelongsTo', isBelongsTo)
          ..add('modelName', modelName)
          ..add('targetName', targetName)
          ..add('associatedName', associatedName)
          ..add('associatedType', associatedType))
        .toString();
  }
}

class ModelFieldMetadataBuilder
    implements Builder<ModelFieldMetadata, ModelFieldMetadataBuilder> {
  _$ModelFieldMetadata? _$v;

  AWSType? _type;
  AWSType? get type => _$this._type;
  set type(AWSType? type) => _$this._type = type;

  bool? _isList;
  bool? get isList => _$this._isList;
  set isList(bool? isList) => _$this._isList = isList;

  bool? _isHasOne;
  bool? get isHasOne => _$this._isHasOne;
  set isHasOne(bool? isHasOne) => _$this._isHasOne = isHasOne;

  bool? _isHasMany;
  bool? get isHasMany => _$this._isHasMany;
  set isHasMany(bool? isHasMany) => _$this._isHasMany = isHasMany;

  bool? _isBelongsTo;
  bool? get isBelongsTo => _$this._isBelongsTo;
  set isBelongsTo(bool? isBelongsTo) => _$this._isBelongsTo = isBelongsTo;

  String? _modelName;
  String? get modelName => _$this._modelName;
  set modelName(String? modelName) => _$this._modelName = modelName;

  String? _targetName;
  String? get targetName => _$this._targetName;
  set targetName(String? targetName) => _$this._targetName = targetName;

  String? _associatedName;
  String? get associatedName => _$this._associatedName;
  set associatedName(String? associatedName) =>
      _$this._associatedName = associatedName;

  String? _associatedType;
  String? get associatedType => _$this._associatedType;
  set associatedType(String? associatedType) =>
      _$this._associatedType = associatedType;

  ModelFieldMetadataBuilder();

  ModelFieldMetadataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _isList = $v.isList;
      _isHasOne = $v.isHasOne;
      _isHasMany = $v.isHasMany;
      _isBelongsTo = $v.isBelongsTo;
      _modelName = $v.modelName;
      _targetName = $v.targetName;
      _associatedName = $v.associatedName;
      _associatedType = $v.associatedType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelFieldMetadata other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelFieldMetadata;
  }

  @override
  void update(void Function(ModelFieldMetadataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ModelFieldMetadata build() {
    final _$result = _$v ??
        new _$ModelFieldMetadata._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'ModelFieldMetadata', 'type'),
            isList: BuiltValueNullFieldError.checkNotNull(
                isList, 'ModelFieldMetadata', 'isList'),
            isHasOne: BuiltValueNullFieldError.checkNotNull(
                isHasOne, 'ModelFieldMetadata', 'isHasOne'),
            isHasMany: BuiltValueNullFieldError.checkNotNull(
                isHasMany, 'ModelFieldMetadata', 'isHasMany'),
            isBelongsTo: BuiltValueNullFieldError.checkNotNull(
                isBelongsTo, 'ModelFieldMetadata', 'isBelongsTo'),
            modelName: modelName,
            targetName: targetName,
            associatedName: associatedName,
            associatedType: associatedType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
