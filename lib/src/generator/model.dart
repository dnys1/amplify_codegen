import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/language.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

import '../helpers/field.dart';

/// Generates libraries for model types.
///
/// Generally, a library consists of two classes: the Model class and the
/// ModelType class; however, custom types have only a Model class.
class ModelGenerator extends LibraryGenerator<ObjectTypeDefinitionNode> {
  ModelGenerator(ObjectTypeDefinitionNode node, this.allModels) : super(node);

  final Map<String, Model> allModels;
  late final Model model = allModels[wireName]!;
  late final Iterable<ModelField> fields =
      model.fields.where((f) => !f.isSynthetic);

  String get modelName => wireName.pascalCase;
  String get modelTypeName => '_${modelName}ModelType';

  @override
  Library? generate() {
    if (allModels[wireName] == null) {
      return null;
    }
    builder.body.add(Class((c) {
      c.docs.add(
        '/** This is an auto generated class representing the $modelName '
        'type in your schema. */',
      );
      c.annotations.add(refer('immutable', metaUri));
      c.name = modelName;

      if (!model.isCustom) {
        c.extend = refer('Model', datastoreUri);
      }

      // Add `classType` for model types
      if (!model.isCustom) {
        c.fields.add(Field(
          (f) => f
            ..static = true
            ..modifier = FieldModifier.constant
            ..type = refer(modelTypeName)
            ..name = 'classType'
            ..assignment = refer(modelTypeName).constInstance([]).code,
        ));
      }

      c.fields.addAll([
        ..._typeFields,
        ..._queryFields,
        _schemaField,
        _pbSchemaField,
      ]);

      if (!model.isCustom) {
        c.methods.addAll(_modelMethods);
      }
      c.methods.addAll(_instanceMethods);

      c.constructors.addAll([
        _unnamedConstructor,
        _internalConstructor,
        _fromJsonConstructor,
      ]);
    }));

    if (!model.isCustom) {
      _buildModelType();
    }

    return builder.build();
  }

  /// Adds `final` fields to the class.
  Iterable<Field> get _typeFields sync* {
    for (var field in fields) {
      final nodeField =
          node.fields.singleWhereOrNull((f) => f.wireName == field.name);
      if (field.isPrimaryKey) {
        // Public final
        yield Field((f) {
          final description = nodeField?.description;
          if (description != null) {
            f.docs.add(description.value);
          }

          f
            ..name = field.dartName
            ..modifier = FieldModifier.final$
            ..type = field.typeReference;
        });
      } else {
        // Private nullable
        yield Field(
          (f) {
            f.name = '_${field.dartName}';
            f.type = field.typeReference.rebuild((t) => t.isNullable = true);
            f.modifier = FieldModifier.final$;
          },
        );
      }
    }
  }

  /// Unwraps [expr] in a block which throws for null values.
  Code _unwrap(Expression expr) {
    return Block.of([
      const Code('if ('),
      expr.equalTo(literalNull).code,
      const Code(') {'),
      refer('DataStoreException', datastoreUri)
          .constInstance(
            [
              refer('DataStoreExceptionMessages', datastoreUri)
                  .property('codeGenRequiredFieldForceCastExceptionMessage'),
            ],
            {
              'recoverySuggestion': refer(
                      'DataStoreExceptionMessages', datastoreUri)
                  .property('codeGenRequiredFieldForceCastRecoverySuggestion'),
            },
          )
          .thrown
          .statement,
      const Code('}'),
      expr.nullChecked.returned.statement,
    ]);
  }

  /// Generates instance methods common to model and custom types.
  Iterable<Method> get _instanceMethods sync* {
    for (var field in fields.where((field) => !field.isPrimaryKey)) {
      final nodeField =
          node.fields.singleWhereOrNull((f) => f.wireName == field.wireName);
      // Public getter
      yield Method(
        (m) {
          final description = nodeField?.description?.value;
          if (description != null) {
            m.docs.add(description);
          }
          final name = field.dartName;
          m
            ..name = name
            ..returns = field.typeReference
            ..lambda = !field.type.isRequired
            ..type = MethodType.getter
            ..body = field.type.isRequired
                ? _unwrap(refer('_$name'))
                : refer('_$name').code;
        },
      );
    }

    // equals
    yield Method(
      (m) => m
        ..name = 'equals'
        ..requiredParameters.add(
          Parameter((p) => p
            ..name = 'other'
            ..type = TypeReference((t) => t
              ..symbol = 'Object'
              ..isNullable = true)),
        )
        ..returns = refer('bool')
        ..body = const Code('return this == other;'),
    );

    // ==
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'operator =='
        ..returns = refer('bool')
        ..requiredParameters.add(
          Parameter((p) => p
            ..name = 'other'
            ..type = TypeReference((t) => t
              ..symbol = 'Object'
              ..isNullable = true)),
        )
        ..lambda = true
        ..body = Code('identical(this, other) || other is $modelName && ' +
            fields.map((field) {
              final getter = field.getter;
              return '$getter == other.$getter';
            }).join('&&')),
    );

    // hashCode
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'hashCode'
        ..returns = refer('int')
        ..type = MethodType.getter
        ..lambda = true
        ..body = const Code('toString().hashCode'),
    );

    // toString
    final buffer = refer('buffer');
    yield Method((m) => m
      ..annotations.add(refer('override').expression)
      ..name = 'toString'
      ..returns = refer('String')
      ..lambda = false
      ..body = Block.of([
        refer('StringBuffer').newInstance([]).assignFinal('buffer').statement,
        buffer
            .property('write')
            .call([literalString('$modelName {')]).statement,
        ...fields.mapIndexed((index, field) {
          final dartName = dartEscape(field.dartName);
          var getter = field.getter;
          // '$_class$' -> '${_class$}'
          if (getter.contains('\$')) {
            getter = '{$getter}';
          }
          var assignment = '$dartName=\$$getter';
          if (index < fields.length - 1) {
            assignment += ', ';
          }
          return buffer
              .property('write')
              .call([literalString(assignment)]).statement;
        }),
        buffer.property('write').call([literalString('}')]).statement,
        buffer.property('toString').call([]).returned.statement,
      ]));

    // copyWith
    yield Method((m) {
      m
        ..name = 'copyWith'
        ..returns = refer(modelName)
        ..lambda = false
        ..optionalParameters.addAll([
          for (var field in fields)
            Parameter(
              (p) => p
                ..name = field.dartName
                ..required = false
                ..named = true
                ..type =
                    field.typeReference.rebuild((t) => t.isNullable = true),
            )
        ]);

      final ctorParams = <String, Expression>{};
      for (var field in fields) {
        final name = field.dartName;
        ctorParams[name] = refer(name).ifNullThen(refer('this').property(name));
      }
      m.body = refer(modelName).newInstance([], ctorParams).returned.statement;
    });

    // toJson
    yield Method((m) {
      if (!model.isCustom) {
        m.annotations.add(refer('override'));
      }
      m
        ..name = 'toJson'
        ..returns = mapOf('String', 'Object?')
        ..lambda = true;

      // Gather toJson fields
      final jsonObj = <String, Object?>{};
      for (var field in fields) {
        final jsonName = field.wireName;
        final getter = field.getter;
        final type = field.type;
        jsonObj[jsonName] = _serialize(getter, type);
      }

      m.body = literalMap(jsonObj).code;
    });
  }

  /// Model-specific fields, not valid for custom types.
  Iterable<Method> get _modelMethods sync* {
    // getInstanceType
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'getInstanceType'
        ..lambda = true
        ..returns = refer(modelTypeName)
        ..body = const Code('classType'),
    );

    // getId
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'getId'
        ..returns = refer('String')
        ..body = refer(model.primaryKeyField.name).returned.statement,
    );
  }

  /// Creates the `_internal` constructor.
  Constructor get _internalConstructor => Constructor((ctor) => ctor
    ..name = '_internal'
    ..constant = true
    ..optionalParameters.addAll([
      for (var field in fields)
        Parameter(
          (p) {
            final type = field.typeReference;
            final isID = field.isPrimaryKey;
            p
              ..name = field.dartName
              ..named = true
              ..type = isID ? null : type
              ..required = field.type.isRequired
              ..toThis = isID;
          },
        ),
    ])
    ..initializers.addAll([
      for (var field in fields.where((field) => !field.isPrimaryKey))
        Code('_${field.dartName} = ${field.dartName}'),
    ]));

  /// Gets the constructor assignment expression for [field].
  Expression _assignmentFor(ModelField field) {
    final name = field.dartName;
    if (field.isPrimaryKey && field.type.graphqlType == GraphQLType.TYPE_ID) {
      return refer(name).ifNullThen(
        refer('UUID', datastoreUri).property('getUUID').call([]),
      );
    }
    if (field.type.isArray) {
      return refer('$name != null').conditional(
        refer('List').newInstanceNamed('unmodifiable', [refer(name)]),
        literalNull,
      );
    }
    return refer(name);
  }

  /// Creates the unnamed factory constructor.
  Constructor get _unnamedConstructor => Constructor((ctor) {
        ctor
          ..factory = true
          ..lambda = false
          ..optionalParameters.addAll([
            for (var field in fields)
              Parameter((p) {
                final name = field.dartName;
                final type = field.typeReference.rebuild(
                  (t) => t.isNullable = !field.type.isRequired ||
                      (field.isPrimaryKey &&
                          field.type.graphqlType == GraphQLType.TYPE_ID),
                );
                p
                  ..name = name
                  ..named = true
                  ..type = type
                  ..required = !type.isNullable!;
              }),
          ]);

        // Gather the parameters needed to construct the `_internal` call.
        final Map<String, Expression> params = {
          for (var field in fields) field.dartName: _assignmentFor(field),
        };
        ctor.body = refer(modelName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  /// Creates the `fromJson` constructor.
  Constructor get _fromJsonConstructor => Constructor((ctor) {
        ctor
          ..name = 'fromJson'
          ..lambda = false
          ..requiredParameters.add(Parameter((p) {
            p
              ..name = 'json'
              ..type = mapOf('String', 'Object?');
          }));

        // Gather fromJson fields
        for (var field in fields) {
          final name = field.getter;
          final jsonName = field.wireName;
          final jsonProp = refer('json').index(literalString(jsonName));
          ctor.initializers.add(refer(name)
              .assign(_deserialize(
                jsonProp,
                field.type,
                isPrimaryKey: field.isPrimaryKey,
              ))
              .code);
        }
      });

  /// Generates the expression to serialize the field named [name] to JSON.
  Expression _serialize(
    String name,
    ModelField_TypeInfo type, [
    int depth = 0,
  ]) {
    // All fields are null at depth=0 (on the model). Null checks ensure that
    // fields in `map` expressions are non-null.
    final isNullable = depth == 0 || !type.isRequired;
    if (type.isArray) {
      final reference = refer(name);
      final closure = Method(
        (m) => m
          ..requiredParameters.add(Parameter((p) => p..name = 'el'))
          ..body = _serialize(
            'el',
            type.arrayType,
            depth + 1,
          ).code,
      ).closure;
      if (type.isRequired) {
        return reference
            .property('map')
            .call([closure])
            .property('toList')
            .call([]);
      } else {
        return reference
            .nullSafeProperty('map')
            .call([closure])
            .property('toList')
            .call([]);
      }
    } else if (type.isModel) {
      return isNullable
          ? refer(name).nullSafeProperty('toJson').call([])
          : refer(name).property('toJson').call([]);
    } else if (type.isEnum) {
      return isNullable
          ? refer(name).nullSafeProperty('value')
          : refer(name).property('value');
    } else {
      final graphqlType = type.graphqlType;
      final ref = refer(name);
      switch (graphqlType) {
        case GraphQLType.TYPE_AWS_DATE:
        case GraphQLType.TYPE_AWS_DATE_TIME:
        case GraphQLType.TYPE_AWS_TIME:
          return isNullable
              ? ref.nullSafeProperty('format').call([])
              : ref.property('format').call([]);
        case GraphQLType.TYPE_AWS_TIMESTAMP:
          return isNullable
              ? ref.nullSafeProperty('toSeconds').call([])
              : ref.property('toSeconds').call([]);
        default:
          return ref;
      }
    }
  }

  /// Generates the expression to deserialize [ref] from JSON.
  Expression _deserialize(
    Expression ref,
    ModelField_TypeInfo type, {
    bool isPrimaryKey = false,
    int depth = 0,
  }) {
    // All fields are type `dynamic` at depth=0 (from the JSON map). Casts and
    // `cast` expressions ensure types in `map` expressions, and so types do
    // not need to be re-cast (important to avoid unnecessary_casts lint).
    final isDynamic = depth == 0;

    // TODO: Remove when client libraries are fixed
    // Make no assumptions about the data being deserialized - only primary key
    // we can say for sure is non-null.
    final isNullable =
        !type.isRequired || !isPrimaryKey && depth == 0; // !type.isRequired
    final isRequired = !isNullable;
    if (type.isArray) {
      final list = ref.asA(TypeReference((t) => t
        ..symbol = 'List'
        ..isNullable = isNullable));
      final listType = type.arrayType;
      final List<Reference> castArgs = [listType.wireTypeReference];
      final newInst = Method((m) => m
        ..lambda = true
        ..requiredParameters.add(Parameter((p) => p..name = 'el'))
        ..body = _deserialize(
          refer('el'),
          listType,
          depth: depth + 1,
        ).code).closure;

      // Do not `map` for simple types.
      // e.g. `.map((el) => el).toList()` is redundant.
      if (isRequired) {
        return type.isPrimitive
            ? list.property('cast').call([], {}, castArgs)
            : list
                .property('cast')
                .call([], {}, castArgs)
                .property('map')
                .call([newInst])
                .property('toList')
                .call([]);
      } else {
        return type.isPrimitive
            ? list.nullSafeProperty('cast').call([], {}, castArgs)
            : list
                .nullSafeProperty('cast')
                .call([], {}, castArgs)
                .property('map')
                .call([newInst])
                .property('toList')
                .call([]);
      }
    } else if (type.isModel) {
      final map = refer('Map');
      final newInst = refer(type.modelName).newInstanceNamed('fromJson', [
        (isDynamic || isNullable ? ref.asA(map) : ref)
            .index(literalString('serializedData'))
            .asA(map)
            .property('cast')
            .call([], {}, [refer('String'), refer('Object').nullable])
      ]);
      // There is no `nullIndex` method on Expression.
      ref = CodeExpression(Block.of([
        (isDynamic ? ref.asA(isNullable ? map.nullable : map) : ref).code,
        const Code('?')
      ]))
          .index(literalString('serializedData'))
          .asA(isNullable ? map.nullable : map);
      return isRequired
          ? newInst
          : ref.notEqualTo(literalNull).conditional(newInst, literalNull);
    } else if (type.isEnum) {
      final byValue = refer(type.modelName)
          .property('values')
          .property('byValue')
          .call([isDynamic ? ref.asA(refer('String').nullable) : ref]);
      return isRequired ? byValue.nullChecked : byValue;
    } else {
      final typeName = type.typeReference.symbol;
      var wireType = type.wireTypeReference;
      if (isNullable) {
        wireType = wireType.nullable;
      }
      final graphqlType = type.graphqlType;
      final castRef = isDynamic ? ref.asA(wireType) : ref;
      switch (graphqlType) {
        case GraphQLType.TYPE_AWS_DATE:
        case GraphQLType.TYPE_AWS_DATE_TIME:
        case GraphQLType.TYPE_AWS_TIME:
        case GraphQLType.TYPE_AWS_TIMESTAMP:
          final ctorName = graphqlType == GraphQLType.TYPE_AWS_TIMESTAMP
              ? 'fromSeconds'
              : 'fromString';
          final decode = refer(typeName).newInstanceNamed(ctorName, [
            // At depth == 0, refs are null checked below.
            // At depth > 1, refs have already been cast.
            depth == 0 ? ref.asA(wireType.nonNull) : ref,
          ]);
          return isNullable
              ? ref.notEqualTo(literalNull).conditional(decode, literalNull)
              : decode;
        default:
          return castRef;
      }
    }
  }

  /// Generates query fields for the model.
  Iterable<Field> get _queryFields sync* {
    if (model.isCustom) {
      return;
    }
    for (var field in fields.where((field) => !field.isReadOnly)) {
      final modelFieldType = field.modelFieldType(
        isCustom: model.isCustom,
        models: allModels,
      );
      yield Field(
        (f) => f
          ..name = queryFieldName(field.dartName)
          ..static = true
          ..modifier = FieldModifier.constant
          ..assignment = refer('QueryField', datastoreUri).constInstance(
            [],
            {
              'fieldName': field.name == 'id'
                  ? literalString('${model.name.camelCase}.id')
                  : literalString(field.name),
              if (field.association != ModelAssociation.IS_UNSPECIFIED)
                'fieldType': refer('ModelFieldType').newInstance([
                  refer('ModelFieldTypeEnum').property(modelFieldType.name),
                ], {
                  if (allModels[field.type.dartModelName!]!.isCustom)
                    'ofCustomTypeName': literalString(field.type.dartModelName!)
                  else
                    'ofModelName': literalString(field.type.dartModelName!),
                })
            },
            [refer('dynamic')],
          ).code,
      );
    }
  }

  /// Creates a `modelSchemaDefinition.addField` call.
  Code _schemaDefinitionField(ModelField field) {
    final def = refer('modelSchemaDefinition');
    final modelFieldType = field.modelFieldType(
      isCustom: model.isCustom,
      models: allModels,
    );
    late String definitionCtor;
    Map<String, Expression> properties = {
      'isRequired': literalBool(field.type.isRequired),
      if (field.isReadOnly) 'isReadOnly': literalBool(true),
    };
    final Map<String, Expression> modelTypeProperies = {};
    if (field.association == ModelAssociation.IS_HAS_ONE) {
      definitionCtor = 'hasOne';
      properties.addAll({
        'key': refer(queryFieldName(field.dartName)),
        'ofModelName': literalString(field.type.modelName),
        'associatedKey': refer(field.type.modelName)
            .property(queryFieldName(field.associatedName)),
      });
    } else if (field.association == ModelAssociation.IS_BELONGS_TO) {
      definitionCtor = 'belongsTo';
      properties.addAll({
        'key': refer(queryFieldName(field.dartName)),
        'ofModelName': literalString(field.type.modelName),
        'targetName': literalString(field.targetName),
      });
    } else if (field.association == ModelAssociation.IS_HAS_MANY) {
      definitionCtor = 'hasMany';
      properties.addAll({
        'key': refer(queryFieldName(field.dartName)),
        'ofModelName': literalString(field.type.modelName),
        'associatedKey': refer(field.type.modelName)
            .property(queryFieldName(field.associatedName)),
      });
    } else if (field.isPrimaryKey) {
      definitionCtor = 'id';
      properties = {'name': literalString(field.name)};
    } else {
      switch (modelFieldType) {
        case ModelFieldType.string:
        case ModelFieldType.int:
        case ModelFieldType.double:
        case ModelFieldType.date:
        case ModelFieldType.dateTime:
        case ModelFieldType.time:
        case ModelFieldType.timestamp:
        case ModelFieldType.bool:
        case ModelFieldType.enumeration:
        case ModelFieldType.collection:
        case ModelFieldType.model:
          if (model.isCustom) {
            definitionCtor = 'customTypeField';
            properties['fieldName'] = literalString(field.name);
          } else if (field.isReadOnly) {
            definitionCtor = 'nonQueryField';
            properties['fieldName'] = literalString(field.name);
          } else {
            definitionCtor = 'field';
            properties['key'] = refer(queryFieldName(field.dartName));
          }
          break;
        case ModelFieldType.embedded:
        case ModelFieldType.embeddedCollection:
          properties['fieldName'] = literalString(field.name);
          definitionCtor = 'embedded';
          final customTypeName = field.type.modelName;
          modelTypeProperies['ofCustomTypeName'] =
              literalString(customTypeName);
          break;
      }
    }

    if (modelFieldType == ModelFieldType.collection) {
      final baseType = field.type.arrayType.modelFieldType(
        isCustom: model.isCustom,
        models: allModels,
      );
      modelTypeProperies['ofModelName'] = literalString(baseType.name);
    }

    if (definitionCtor == 'field' ||
        definitionCtor == 'nonQueryField' ||
        definitionCtor == 'customTypeField' ||
        definitionCtor == 'embedded') {
      properties['ofType'] = refer('ModelFieldType').constInstance([
        refer('ModelFieldTypeEnum').property(modelFieldType.name),
      ], modelTypeProperies);
      properties['isArray'] = literalBool(field.type.isArray);
    }

    // TODO: Support all constructors
    if ((definitionCtor == 'field' || definitionCtor == 'nonQueryField') &&
        field.authRules.isNotEmpty) {
      properties['authRules'] =
          literalConstList(field.authRules.map(_buildAuthRule).toList());
    }

    return def.property('addField').call([
      refer('ModelFieldDefinition')
          .property(definitionCtor)
          .call([], properties)
    ]).statement;
  }

  /// Constructs an AuthRule for [authRule].
  Expression _buildAuthRule(AuthRule authRule) {
    final ownerField = authRule.ownerField;
    final identityClaim = authRule.identityClaim;
    final groupClaim = authRule.groupClaim;
    final groups = authRule.groups;
    return refer('AuthRule', datastoreUri).constInstance([], {
      'authStrategy':
          refer('AuthStrategy', datastoreUri).property(authRule.allow.dartName),
      if (authRule.hasGroupClaim()) 'groupClaim': literalString(groupClaim),
      if (groups.isNotEmpty) 'groups': literalList(groups),
      'operations': literalList(authRule.operations.map(
          (op) => refer('ModelOperation', datastoreUri).property(op.dartName))),
      if (authRule.hasOwnerField()) 'ownerField': literalString(ownerField),
      if (authRule.hasIdentityClaim())
        'identityClaim': literalString(identityClaim),
      if (authRule.hasProvider())
        'provider': refer('AuthRuleProvider', datastoreUri)
            .property(authRule.provider.dartName),
    });
  }

  /// The static `schema` field on the Model.
  Field get _schemaField {
    // Build schema definition
    final schemaDefinition = Method((m) {
      m.requiredParameters.add(Parameter((p) => p
        ..name = 'modelSchemaDefinition'
        ..type = refer('ModelSchemaDefinition', datastoreUri)));
      final def = refer('modelSchemaDefinition');

      m.body = Block.of([
        // Name + plural name
        def.property('name').assign(literalString(node.name.value)).statement,
        def
            .property('pluralName')
            .assign(literalString(node.name.value + 's'))
            .statement,

        // Fields
        for (var field in fields) _schemaDefinitionField(field),

        // Auth Rules
        if (model.authRules.isNotEmpty)
          def
              .property('authRules')
              .assign(literalConstList(
                  model.authRules.map(_buildAuthRule).toList()))
              .statement,
      ]);
    });
    return Field((f) {
      f
        ..name = 'schema'
        ..static = true
        ..modifier = FieldModifier.final$
        ..assignment =
            refer('Model', datastoreUri).property('defineSchema').call([], {
          'define': schemaDefinition.closure,
        }).code;
    });
  }

  /// The static `pbSchema` field on the Model.
  Field get _pbSchemaField => Field((f) {
        const uint8List = Reference('Uint8List', 'dart:typed_data');
        final schemaBuffer = model.writeToBuffer();
        f
          ..docs.add('/// The model schema as a Protocol Buffer.')
          ..static = true
          ..late = true
          ..modifier = FieldModifier.final$
          ..name = 'pbSchema'
          ..type = uint8List
          ..assignment = uint8List.newInstanceNamed('fromList', [
            literalConstList([
              for (var byte in schemaBuffer)
                refer('0x${byte.toRadixString(16).padLeft(2, '0')}'),
            ])
          ]).code;
      });

  /// Generates a `ModelType` class for all model types which extends
  /// `ModelType` and provides the `ModelType.fromJson` implementation.
  void _buildModelType() {
    builder.body.add(Class((c) {
      c.name = modelTypeName;
      c.extend = TypeReference(
        (t) => t
          ..symbol = 'ModelType'
          ..types.add(refer(modelName))
          ..url = datastoreUri,
      );
      c.constructors.add(Constructor((ctor) => ctor.constant = true));
      c.methods.addAll([
        // modelName
        Method(
          (m) => m
            ..annotations.add(
              refer('override').expression,
            )
            ..name = 'modelName'
            ..returns = refer('String')
            ..lambda = true
            ..body = literalString(wireName).code,
        ),

        // fromJson
        Method(
          (m) => m
            ..annotations.add(
              refer('override').expression,
            )
            ..name = 'fromJson'
            ..requiredParameters.add(Parameter(
              (p) => p
                ..name = 'jsonData'
                ..type = mapOf('String', 'Object?')
                ..named = false,
            ))
            ..returns = refer(modelName)
            ..body = Code('return $modelName.fromJson(jsonData);'),
        ),
      ]);
    }));
  }
}

enum ModelFieldType {
  string,
  int,
  double,
  date,
  dateTime,
  time,
  timestamp,
  bool,
  // below types use ofModelName
  enumeration,
  model,
  collection,
  // below types use ofCustomTypeName
  embedded,
  embeddedCollection,
}
