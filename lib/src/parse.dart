import 'package:amplify_codegen/src/generator/types.dart';
import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:amplify_codegen/src/models/auth_rule.dart';
import 'package:amplify_codegen/src/models/model.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';

/// Parses [schema] into a list of [Model] objects.
List<Model> parseSchema(String schema) {
  final doc = parseString(schema);
  final models = <Model>[];
  for (var definition in doc.definitions) {
    final isModel = definition is ObjectTypeDefinitionNode;
    if (!isModel) {
      continue;
    }
    final model = Model((b) {
      final authRules = definition.directives.authRules;
      b
        ..name = definition.name.value
        ..authRules.addAll(authRules)
        ..fields.addAll(definition.modelFields)
        ..isCustom = definition.directives
            .every((directive) => directive.name.value != 'model');
    });
    models.add(model);
  }
  return models;
}

extension ModelFields on ObjectTypeDefinitionNode {
  /// Returns whether `this` is a [Model].
  bool get isModel =>
      directives.any((directive) => directive.name.value == 'model');

  /// Returns all fields as [ModelField] objects.
  Iterable<ModelField> get modelFields sync* {
    for (var field in fields) {
      yield ModelField(
        (f) {
          f
            ..name = name.value
            ..required = field.type.isNonNull
            ..authRules.addAll(field.directives.authRules);

          _buildTypeFor(f.metadata, field.type);

          f.metadata
            ..isBelongsTo = field.isBelongsTo
            ..isHasOne = field.isHasOne
            ..isHasMany = field.isHasMany;

          if (field.isBelongsTo) {
            f.metadata.targetName = f.metadata.modelName;
          }
          if (field.isHasOne || field.isHasMany) {
            f.metadata
              ..associatedName = ''
              ..associatedType = f.metadata.modelName;
          }
        },
      );
    }
  }
}

void _buildTypeFor(ModelFieldMetadataBuilder builder, TypeNode node) {
  if (node is NamedTypeNode) {
    builder.isList = false;
    builder.type = AWSType.values.firstWhere(
      (el) => el.name == node.name.value,
      orElse: () {
        builder.modelName = node.name.value;
        return AWSType.Model;
      },
    );
    return;
  } else if (node is ListTypeNode) {
    builder.isList = true;
    _buildTypeFor(builder, node.type);
    return;
  }
  throw ArgumentError(node.runtimeType);
}

extension AuthRules on List<DirectiveNode> {
  DirectiveNode? get authRuleDirective {
    return firstWhereOrNull((node) => node.name.value == 'auth');
  }

  Iterable<AuthRule> get authRules sync* {
    final directive = authRuleDirective;
    if (directive == null) {
      return;
    }
    final rulesArg = directive.arguments.single.value as ListValueNode;
    final ruleValues = rulesArg.values.cast<ObjectValueNode>();
    for (var ruleValue in ruleValues) {
      final rule = AuthRuleBuilder();
      for (var field in ruleValue.fields) {
        final node = field.value;
        switch (field.name.value) {
          case 'allow':
            rule.allow = AuthStrategy.deserialize(_valueOf(node))!;
            break;
          case 'provider':
            rule.provider = AuthProvider.deserialize(_valueOf(node))!;
            break;
          case 'ownerField':
            rule.ownerField = _valueOf(node);
            break;
          case 'identityClaim':
            rule.identityClaim = _valueOf(node);
            break;
          case 'groupClaim':
            rule.groupClaim = _valueOf(node);
            break;
          case 'groups':
            rule.groups.addAll(_listValueOf(node));
            break;
          case 'groupsField':
            rule.groupsField = _valueOf(node);
            break;
          case 'operations':
            rule.operations.addAll((node as ListValueNode).values.map((node) {
              return ModelOperation.deserialize(_valueOf(node))!;
            }));
            break;
          default:
            throw StateError('Unknown key: ${field.name.value}');
        }
        yield rule.build();
      }
    }
  }
}

String _valueOf(ValueNode node) {
  if (node is EnumValueNode) {
    return node.name.value;
  } else if (node is StringValueNode) {
    return node.value;
  }
  throw ArgumentError(node.runtimeType);
}

List<String> _listValueOf(ValueNode node) {
  if (node is! ListValueNode) {
    throw ArgumentError(node.runtimeType);
  }
  return node.values.map(_valueOf).toList();
}
