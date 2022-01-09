import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:test/test.dart';

void main() {
  List<AuthRule> parseAuthRules(String schema) {
    return (parseString(schema).definitions.single as ObjectTypeDefinitionNode)
        .directives
        .authRules
        .toList();
  }

  group('Parser', () {
    group('Auth Rules', () {
      group('Owner Auth', () {
        test(
            'should add default owner field when owner auth is missing ownerField',
            () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: owner, identityClaim: "owner", operations: [read], provider: userPools}
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_OWNER
              ..identityClaim = 'owner'
              ..operations.add(ModelOperation.OP_READ)
              ..provider = AuthProvider.BY_USER_POOLS
              ..ownerField = 'owner'),
          );
        });

        test(
            'should add default identityClaim cognito:userName if the directive is missing it',
            () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: owner, ownerField: "username", operations: [read], provider: userPools}
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_OWNER
              ..identityClaim = 'cognito:username'
              ..operations.add(ModelOperation.OP_READ)
              ..provider = AuthProvider.BY_USER_POOLS
              ..ownerField = 'username'),
          );
        });

        test('should add operations when its missing', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: owner, ownerField: "username", provider: userPools, identityClaim: "user_name"}
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_OWNER
              ..identityClaim = 'user_name'
              ..operations.addAll(ModelOperationX.values)
              ..provider = AuthProvider.BY_USER_POOLS
              ..ownerField = 'username'),
          );
        });

        test('should add provider when its missing', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: owner, ownerField: "username", operations: [create, update, delete], identityClaim: "user_name"}
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_OWNER
              ..identityClaim = 'user_name'
              ..operations.addAll([
                ModelOperation.OP_CREATE,
                ModelOperation.OP_UPDATE,
                ModelOperation.OP_DELETE,
              ])
              ..provider = AuthProvider.BY_USER_POOLS
              ..ownerField = 'username'),
          );
        });
      });

      group('Group Auth', () {
        test('should filter dynamic group auth rule', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: groups, groupsField: "my-group" }
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_GROUPS
              ..provider = AuthProvider.BY_USER_POOLS
              ..groupsField = 'my-group'
              ..operations.addAll(ModelOperationX.values)
              ..groupClaim = 'cognito:groups'),
          );
        });

        test('should add groupClaim field when its missing', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: groups, provider: oidc, groups: ["Foo"], operations: [update] }
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_GROUPS
              ..provider = AuthProvider.BY_OIDC
              ..groups.add('Foo')
              ..operations.add(ModelOperation.OP_UPDATE)
              ..groupClaim = 'cognito:groups'
              ..groupsField = 'groups'),
          );
        });

        test('should add provider field when its missing', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: groups, groupClaim: "my:groups", groups: ["Foo"], operations: [update] }
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_GROUPS
              ..provider = AuthProvider.BY_USER_POOLS
              ..groupClaim = 'my:groups'
              ..groups.add('Foo')
              ..operations.add(ModelOperation.OP_UPDATE)
              ..groupsField = 'groups'),
          );
        });

        test('should add default operations when its missing', () {
          const schema = '''
          type DummyType @auth(rules: [
            { allow: groups, groupClaim: "my:groups", groups: ["Foo"] }
          ]) {}
          ''';
          final authRule = parseAuthRules(schema).single;
          expect(
            authRule,
            equals(AuthRule()
              ..allow = AuthStrategy.ALLOW_GROUPS
              ..provider = AuthProvider.BY_USER_POOLS
              ..groupClaim = 'my:groups'
              ..groups.add('Foo')
              ..operations.addAll(ModelOperationX.values)
              ..groupsField = 'groups'),
          );
        });
      });
    });
  });
}
