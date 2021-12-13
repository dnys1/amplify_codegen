import 'package:amplify_codegen/src/helpers/field.dart';
import 'package:amplify_codegen/src/models/auth_rule.dart';
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.owner
              ..identityClaim = 'owner'
              ..operations.add(ModelOperation.read)
              ..provider = AuthProvider.userPools
              ..ownerField = 'owner')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.owner
              ..identityClaim = 'cognito:username'
              ..operations.add(ModelOperation.read)
              ..provider = AuthProvider.userPools
              ..ownerField = 'username')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.owner
              ..identityClaim = 'user_name'
              ..operations.addAll(ModelOperation.values)
              ..provider = AuthProvider.userPools
              ..ownerField = 'username')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.owner
              ..identityClaim = 'user_name'
              ..operations.addAll([
                ModelOperation.create,
                ModelOperation.update,
                ModelOperation.delete,
              ])
              ..provider = AuthProvider.userPools
              ..ownerField = 'username')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.groups
              ..groupsField = 'my-group')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.groups
              ..provider = AuthProvider.oidc
              ..groups.add('Foo')
              ..operations.add(ModelOperation.update)
              ..groupClaim = 'cognito:groups')),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.groups
              ..provider = AuthProvider.userPools
              ..groupClaim = 'my:groups'
              ..groups.add('Foo')
              ..operations.add(ModelOperation.update))),
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
            equals(AuthRule((b) => b
              ..allow = AuthStrategy.groups
              ..provider = AuthProvider.userPools
              ..groupClaim = 'my:groups'
              ..groups.add('Foo')
              ..operations.addAll(ModelOperation.values))),
          );
        });
      });
    });
  });
}
