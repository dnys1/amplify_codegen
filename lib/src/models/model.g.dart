// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Model> _$modelSerializer = new _$ModelSerializer();
Serializer<ModelField> _$modelFieldSerializer = new _$ModelFieldSerializer();
Serializer<TypeInfo> _$typeInfoSerializer = new _$TypeInfoSerializer();

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
      'isReadOnly',
      serializers.serialize(object.isReadOnly,
          specifiedType: const FullType(bool)),
      'authRules',
      serializers.serialize(object.authRules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AuthRule)])),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeInfo)),
      'isPrimaryKey',
      serializers.serialize(object.isPrimaryKey,
          specifiedType: const FullType(bool)),
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
        case 'isReadOnly':
          result.isReadOnly = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'authRules':
          result.authRules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuthRule)]))!
              as BuiltList<Object?>);
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeInfo))! as TypeInfo);
          break;
        case 'isPrimaryKey':
          result.isPrimaryKey = serializers.deserialize(value,
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

class _$TypeInfoSerializer implements StructuredSerializer<TypeInfo> {
  @override
  final Iterable<Type> types = const [TypeInfo, _$TypeInfo];
  @override
  final String wireName = 'TypeInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'isRequired',
      serializers.serialize(object.isRequired,
          specifiedType: const FullType(bool)),
      'isList',
      serializers.serialize(object.isList, specifiedType: const FullType(bool)),
      'isEnum',
      serializers.serialize(object.isEnum, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.awsType;
    if (value != null) {
      result
        ..add('awsType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AWSType)));
    }
    value = object.modelName;
    if (value != null) {
      result
        ..add('modelName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.listType;
    if (value != null) {
      result
        ..add('listType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TypeInfo)));
    }
    return result;
  }

  @override
  TypeInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'awsType':
          result.awsType = serializers.deserialize(value,
              specifiedType: const FullType(AWSType)) as AWSType?;
          break;
        case 'isRequired':
          result.isRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isList':
          result.isList = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'modelName':
          result.modelName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'listType':
          result.listType.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeInfo))! as TypeInfo);
          break;
        case 'isEnum':
          result.isEnum = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  final bool isReadOnly;
  @override
  final BuiltList<AuthRule> authRules;
  @override
  final TypeInfo type;
  @override
  final bool isPrimaryKey;
  @override
  final bool isHasOne;
  @override
  final bool isHasMany;
  @override
  final bool isBelongsTo;
  @override
  final String? targetName;
  @override
  final String? associatedName;
  @override
  final String? associatedType;

  factory _$ModelField([void Function(ModelFieldBuilder)? updates]) =>
      (new ModelFieldBuilder()..update(updates)).build();

  _$ModelField._(
      {required this.name,
      required this.isReadOnly,
      required this.authRules,
      required this.type,
      required this.isPrimaryKey,
      required this.isHasOne,
      required this.isHasMany,
      required this.isBelongsTo,
      this.targetName,
      this.associatedName,
      this.associatedType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'ModelField', 'name');
    BuiltValueNullFieldError.checkNotNull(
        isReadOnly, 'ModelField', 'isReadOnly');
    BuiltValueNullFieldError.checkNotNull(authRules, 'ModelField', 'authRules');
    BuiltValueNullFieldError.checkNotNull(type, 'ModelField', 'type');
    BuiltValueNullFieldError.checkNotNull(
        isPrimaryKey, 'ModelField', 'isPrimaryKey');
    BuiltValueNullFieldError.checkNotNull(isHasOne, 'ModelField', 'isHasOne');
    BuiltValueNullFieldError.checkNotNull(isHasMany, 'ModelField', 'isHasMany');
    BuiltValueNullFieldError.checkNotNull(
        isBelongsTo, 'ModelField', 'isBelongsTo');
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
        isReadOnly == other.isReadOnly &&
        authRules == other.authRules &&
        type == other.type &&
        isPrimaryKey == other.isPrimaryKey &&
        isHasOne == other.isHasOne &&
        isHasMany == other.isHasMany &&
        isBelongsTo == other.isBelongsTo &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, name.hashCode),
                                            isReadOnly.hashCode),
                                        authRules.hashCode),
                                    type.hashCode),
                                isPrimaryKey.hashCode),
                            isHasOne.hashCode),
                        isHasMany.hashCode),
                    isBelongsTo.hashCode),
                targetName.hashCode),
            associatedName.hashCode),
        associatedType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ModelField')
          ..add('name', name)
          ..add('isReadOnly', isReadOnly)
          ..add('authRules', authRules)
          ..add('type', type)
          ..add('isPrimaryKey', isPrimaryKey)
          ..add('isHasOne', isHasOne)
          ..add('isHasMany', isHasMany)
          ..add('isBelongsTo', isBelongsTo)
          ..add('targetName', targetName)
          ..add('associatedName', associatedName)
          ..add('associatedType', associatedType))
        .toString();
  }
}

class ModelFieldBuilder implements Builder<ModelField, ModelFieldBuilder> {
  _$ModelField? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isReadOnly;
  bool? get isReadOnly => _$this._isReadOnly;
  set isReadOnly(bool? isReadOnly) => _$this._isReadOnly = isReadOnly;

  ListBuilder<AuthRule>? _authRules;
  ListBuilder<AuthRule> get authRules =>
      _$this._authRules ??= new ListBuilder<AuthRule>();
  set authRules(ListBuilder<AuthRule>? authRules) =>
      _$this._authRules = authRules;

  TypeInfoBuilder? _type;
  TypeInfoBuilder get type => _$this._type ??= new TypeInfoBuilder();
  set type(TypeInfoBuilder? type) => _$this._type = type;

  bool? _isPrimaryKey;
  bool? get isPrimaryKey => _$this._isPrimaryKey;
  set isPrimaryKey(bool? isPrimaryKey) => _$this._isPrimaryKey = isPrimaryKey;

  bool? _isHasOne;
  bool? get isHasOne => _$this._isHasOne;
  set isHasOne(bool? isHasOne) => _$this._isHasOne = isHasOne;

  bool? _isHasMany;
  bool? get isHasMany => _$this._isHasMany;
  set isHasMany(bool? isHasMany) => _$this._isHasMany = isHasMany;

  bool? _isBelongsTo;
  bool? get isBelongsTo => _$this._isBelongsTo;
  set isBelongsTo(bool? isBelongsTo) => _$this._isBelongsTo = isBelongsTo;

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

  ModelFieldBuilder() {
    ModelField._setDefaults(this);
  }

  ModelFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isReadOnly = $v.isReadOnly;
      _authRules = $v.authRules.toBuilder();
      _type = $v.type.toBuilder();
      _isPrimaryKey = $v.isPrimaryKey;
      _isHasOne = $v.isHasOne;
      _isHasMany = $v.isHasMany;
      _isBelongsTo = $v.isBelongsTo;
      _targetName = $v.targetName;
      _associatedName = $v.associatedName;
      _associatedType = $v.associatedType;
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
              isReadOnly: BuiltValueNullFieldError.checkNotNull(
                  isReadOnly, 'ModelField', 'isReadOnly'),
              authRules: authRules.build(),
              type: type.build(),
              isPrimaryKey: BuiltValueNullFieldError.checkNotNull(
                  isPrimaryKey, 'ModelField', 'isPrimaryKey'),
              isHasOne: BuiltValueNullFieldError.checkNotNull(
                  isHasOne, 'ModelField', 'isHasOne'),
              isHasMany: BuiltValueNullFieldError.checkNotNull(
                  isHasMany, 'ModelField', 'isHasMany'),
              isBelongsTo: BuiltValueNullFieldError.checkNotNull(
                  isBelongsTo, 'ModelField', 'isBelongsTo'),
              targetName: targetName,
              associatedName: associatedName,
              associatedType: associatedType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'authRules';
        authRules.build();
        _$failedField = 'type';
        type.build();
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

class _$TypeInfo extends TypeInfo {
  @override
  final AWSType? awsType;
  @override
  final bool isRequired;
  @override
  final bool isList;
  @override
  final String? modelName;
  @override
  final TypeInfo? listType;
  @override
  final bool isEnum;

  factory _$TypeInfo([void Function(TypeInfoBuilder)? updates]) =>
      (new TypeInfoBuilder()..update(updates)).build();

  _$TypeInfo._(
      {this.awsType,
      required this.isRequired,
      required this.isList,
      this.modelName,
      this.listType,
      required this.isEnum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isRequired, 'TypeInfo', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(isList, 'TypeInfo', 'isList');
    BuiltValueNullFieldError.checkNotNull(isEnum, 'TypeInfo', 'isEnum');
  }

  @override
  TypeInfo rebuild(void Function(TypeInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeInfoBuilder toBuilder() => new TypeInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeInfo &&
        awsType == other.awsType &&
        isRequired == other.isRequired &&
        isList == other.isList &&
        modelName == other.modelName &&
        listType == other.listType &&
        isEnum == other.isEnum;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, awsType.hashCode), isRequired.hashCode),
                    isList.hashCode),
                modelName.hashCode),
            listType.hashCode),
        isEnum.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeInfo')
          ..add('awsType', awsType)
          ..add('isRequired', isRequired)
          ..add('isList', isList)
          ..add('modelName', modelName)
          ..add('listType', listType)
          ..add('isEnum', isEnum))
        .toString();
  }
}

class TypeInfoBuilder implements Builder<TypeInfo, TypeInfoBuilder> {
  _$TypeInfo? _$v;

  AWSType? _awsType;
  AWSType? get awsType => _$this._awsType;
  set awsType(AWSType? awsType) => _$this._awsType = awsType;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  bool? _isList;
  bool? get isList => _$this._isList;
  set isList(bool? isList) => _$this._isList = isList;

  String? _modelName;
  String? get modelName => _$this._modelName;
  set modelName(String? modelName) => _$this._modelName = modelName;

  TypeInfoBuilder? _listType;
  TypeInfoBuilder get listType => _$this._listType ??= new TypeInfoBuilder();
  set listType(TypeInfoBuilder? listType) => _$this._listType = listType;

  bool? _isEnum;
  bool? get isEnum => _$this._isEnum;
  set isEnum(bool? isEnum) => _$this._isEnum = isEnum;

  TypeInfoBuilder() {
    TypeInfo._setDefaults(this);
  }

  TypeInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _awsType = $v.awsType;
      _isRequired = $v.isRequired;
      _isList = $v.isList;
      _modelName = $v.modelName;
      _listType = $v.listType?.toBuilder();
      _isEnum = $v.isEnum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeInfo;
  }

  @override
  void update(void Function(TypeInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeInfo build() {
    _$TypeInfo _$result;
    try {
      _$result = _$v ??
          new _$TypeInfo._(
              awsType: awsType,
              isRequired: BuiltValueNullFieldError.checkNotNull(
                  isRequired, 'TypeInfo', 'isRequired'),
              isList: BuiltValueNullFieldError.checkNotNull(
                  isList, 'TypeInfo', 'isList'),
              modelName: modelName,
              listType: _listType?.build(),
              isEnum: BuiltValueNullFieldError.checkNotNull(
                  isEnum, 'TypeInfo', 'isEnum'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listType';
        _listType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TypeInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
