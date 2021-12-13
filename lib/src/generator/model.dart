import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';

import '../helpers/field.dart';

/// Generates libraries for model types. Generally, a library consists of two
/// classes: the Model class and the ModelType class.
class ModelGenerator extends LibraryGenerator<ObjectTypeDefinitionNode> {
  ModelGenerator(ObjectTypeDefinitionNode node, this.allModels) : super(node);

  final Map<String, Model> allModels;
  late final Model model = allModels[wireName]!;
  late final Iterable<ModelField> fields = model.fields.where((f) => !f.ignore);

  String get modelTypeName => '_${typeName}ModelType';

  @override
  Library? generate() {
    if (allModels[wireName] == null) {
      return null;
    }
    builder.body.add(Class((c) {
      c.docs.add(
        '/** This is an auto generated class representing the $typeName '
        'type in your schema. */',
      );
      c.annotations.add(refer('immutable', metaUri).expression);
      c.name = typeName;

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

      c.fields.addAll(_typeFields);
      c.fields.addAll(_queryFields);

      if (!model.isCustom) {
        c.methods.addAll(_modelMethods);
      }
      c.methods.addAll(_instanceMethods);

      c.constructors.addAll([
        _unnamedConstructor,
        _internalConstructor,
        _fromJsonConstructor,
      ]);

      c.fields.add(_schemaField);
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
        ..body = Code('identical(this, other) || other is $typeName && ' +
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
    yield Method(
      (m) => m
        ..annotations.add(refer('override').expression)
        ..name = 'toString'
        ..returns = refer('String')
        ..lambda = false
        ..body = Code('''
        final buffer = StringBuffer();

        buffer.write('$typeName {');
        ''' +
            fields.mapIndexed((index, field) {
              final dartName = field.dartName;
              final getter = field.getter;
              if (index == fields.length - 1) {
                return "buffer.write('$dartName=\$$getter');";
              }
              return "buffer.write('$dartName=\$$getter, ');";
            }).join('\n') +
            '''
        buffer.write('}');

        return buffer.toString();
        '''),
    );

    // copyWith
    yield Method((m) {
      m
        ..name = 'copyWith'
        ..returns = refer(typeName)
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
      m.body = refer(typeName).newInstance([], ctorParams).returned.statement;
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

  Expression _assignmentFor(ModelField field) {
    final name = field.dartName;
    if (field.isPrimaryKey && field.type.awsType == AWSType.ID) {
      return refer(name).ifNullThen(
        refer('UUID').property('getUUID').call([]),
      );
    }
    if (field.type.isList) {
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
                      (field.isPrimaryKey && field.type.awsType == AWSType.ID),
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
        ctor.body = refer(typeName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  Constructor get _fromJsonConstructor => Constructor((ctor) {
        ctor
          ..name = 'fromJson'
          ..factory = true
          ..lambda = false
          ..requiredParameters.add(Parameter((p) {
            p
              ..name = 'json'
              ..type = mapOf('String', 'Object?');
          }));

        // Gather fromJson fields
        final Map<String, Expression> params = {};
        for (var field in fields) {
          final name = field.dartName;
          final jsonName = field.wireName;
          final jsonProp = refer('json').index(literalString(jsonName));
          params[name] = _deserialize(
            jsonProp,
            field.type,
          );
        }
        ctor.body = refer(typeName)
            .newInstanceNamed('_internal', [], params)
            .returned
            .statement;
      });

  /// Generates the expression to serialize [field] to JSON.
  Expression _serialize(
    String name,
    TypeInfo type, [
    int depth = 0,
  ]) {
    // All fields are null at depth=0 (on the model). Null checks ensure that
    // fields in `map` expressions are non-null.
    final isNullable = depth == 0 || !type.isRequired;
    if (type.isList) {
      final reference = refer(name);
      final closure = Method(
        (m) => m
          ..requiredParameters.add(Parameter((p) => p..name = 'el'))
          ..body = _serialize(
            'el',
            type.listType!,
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
      final awsType = type.awsType!;
      final ref = refer(name);
      switch (awsType) {
        case AWSType.AWSDate:
        case AWSType.AWSDateTime:
        case AWSType.AWSTime:
          return isNullable
              ? ref.nullSafeProperty('format').call([])
              : ref.property('format').call([]);
        case AWSType.AWSTimestamp:
          return isNullable
              ? ref.nullSafeProperty('toSeconds').call([])
              : ref.property('toSeconds').call([]);
        default:
          return ref;
      }
    }
  }

  /// Generates the expression to deserialize [node] from JSON.
  Expression _deserialize(
    Expression ref,
    TypeInfo type, {
    int depth = 0,
  }) {
    // All fields are type `dynamic` at depth=0 (from the JSON map). Casts and
    // `cast` expressions ensure types in `map` expressions, and so types do
    // not need to be re-cast (important to avoid unnecessary_casts lint).
    final isDynamic = depth == 0;
    if (type.isList) {
      final list = ref.asA(TypeReference((t) => t
        ..symbol = 'List'
        ..isNullable = !type.isRequired));
      final listType = type.listType!;
      final List<Reference> castArgs = [listType.wireTypeReference];
      final newInst = Method(
        (m) => m
          ..lambda = true
          ..requiredParameters.add(Parameter((p) => p..name = 'el'))
          ..body = _deserialize(
            refer('el'),
            listType,
            depth: depth + 1,
          ).code,
      ).closure;

      // Do not `map` for simple types.
      // e.g. `.map((el) => el).toList()` is redundant.
      if (type.isRequired) {
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
      final isNullable = !type.isRequired;
      final map = refer('Map');
      final newInst = refer(type.modelName!).newInstanceNamed('fromJson', [
        ref
            .asA(map)
            .index(literalString('serializedData'))
            .asA(map)
            .property('cast')
            .call([], {}, [refer('String'), refer('Object').nullable])
      ]);
      // There is no `nullIndex` field on Expression.
      ref = CodeExpression(Block.of([
        (isDynamic ? ref.asA(isNullable ? map.nullable : map) : ref).code,
        const Code('?')
      ]))
          .index(literalString('serializedData'))
          .asA(isNullable ? map.nullable : map);
      return type.isRequired
          ? newInst
          : ref.notEqualTo(literalNull).conditional(newInst, literalNull);
    } else if (type.isEnum) {
      final byValue = refer(type.modelName!)
          .property('values')
          .property('byValue')
          .call([isDynamic ? ref.asA(refer('String').nullable) : ref]);
      return type.isRequired ? byValue.nullChecked : byValue;
    } else {
      final typeName = type.typeReference.symbol;
      final wireType = type.wireTypeReference;
      final awsType = type.awsType;
      final isNullable = !type.isRequired;
      final castRef = isDynamic ? ref.asA(wireType) : ref;
      switch (awsType!) {
        case AWSType.AWSDate:
        case AWSType.AWSDateTime:
        case AWSType.AWSTime:
        case AWSType.AWSTimestamp:
          final ctorName =
              awsType == AWSType.AWSTimestamp ? 'fromSeconds' : 'fromString';
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
          ..name = field.name.constantCase
          ..static = true
          ..modifier = FieldModifier.constant
          ..assignment = refer('QueryField', datastoreUri).constInstance(
            [],
            {
              'fieldName': field.name == 'id'
                  ? literalString('${model.name.camelCase}.id')
                  : literalString(field.name),
              if (field.isHasOne || field.isBelongsTo || field.isHasMany)
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
    if (field.isHasOne) {
      definitionCtor = 'hasOne';
      properties.addAll({
        'key': refer(field.name.constantCase),
        'ofModelName': literalString(field.type.modelName!),
        'associatedKey': refer(field.type.modelName!)
            .property(field.associatedName!.constantCase),
      });
    } else if (field.isBelongsTo) {
      definitionCtor = 'belongsTo';
      properties.addAll({
        'key': refer(field.name.constantCase),
        'ofModelName': literalString(field.type.modelName!),
        'targetName': literalString(field.targetName!),
      });
    } else if (field.isHasMany) {
      definitionCtor = 'hasMany';
      properties.addAll({
        'key': refer(field.name.constantCase),
        'ofModelName': literalString(field.type.modelName!),
        'associatedKey': refer(field.type.modelName!)
            .property(field.associatedName!.constantCase),
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
          if (model.isCustom) {
            definitionCtor = 'customTypeField';
            properties['fieldName'] = literalString(field.name);
          } else if (field.isReadOnly) {
            definitionCtor = 'nonQueryField';
            properties['fieldName'] = literalString(field.name);
          } else {
            definitionCtor = 'field';
            properties['key'] = refer(field.name.constantCase);
          }
          break;
        case ModelFieldType.embedded:
        case ModelFieldType.embeddedCollection:
          properties['fieldName'] = literalString(field.name);
          definitionCtor = 'embedded';
          final customTypeName = field.type.modelName!;
          modelTypeProperies['ofCustomTypeName'] =
              literalString(customTypeName);
          break;
        case ModelFieldType.model:
          definitionCtor = 'field';
          properties['key'] = refer(field.name.constantCase);
          break;
      }
    }

    if (modelFieldType == ModelFieldType.collection) {
      final baseType = field.type.listType!.modelFieldType(
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
      properties['isArray'] = literalBool(field.type.isList);
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
      'authStrategy': refer('AuthStrategy', datastoreUri)
          .property(authRule.allow.name.constantCase),
      if (groupClaim != null) 'groupClaim': literalString(groupClaim),
      if (groups.isNotEmpty) 'groups': literalList(groups),
      'operations': literalList(authRule.operations.map((op) =>
          refer('ModelOperation', datastoreUri)
              .property(op.name.constantCase))),
      if (ownerField != null) 'ownerField': literalString(ownerField),
      if (identityClaim != null) 'identityClaim': literalString(identityClaim),
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

  /// Generates a `ModelType` class for all model types which extends
  /// `ModelType` and provides the `ModelType.fromJson` implementation.
  void _buildModelType() {
    builder.body.add(Class((c) {
      c.name = modelTypeName;
      c.extend = TypeReference(
        (t) => t
          ..symbol = 'ModelType'
          ..types.add(refer(typeName))
          ..url = datastoreUri,
      );
      c.constructors.add(Constructor((ctor) => ctor.constant = true));
      c.methods.add(Method(
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
          ..returns = refer(typeName)
          ..body = Code('return $typeName.fromJson(jsonData);'),
      ));
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
