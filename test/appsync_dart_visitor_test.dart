import 'dart:io';

import 'package:amplify_codegen/src/generate.dart';
import 'package:test/test.dart';

String loadGolden(String goldenFile) {
  return File(goldenFile).readAsStringSync();
}

void main() {

group('AppSync Dart Visitor', (){
  group('Model Directive', (){
    test('should generate a class for a Simple Model', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          name: String
          bar: String
        }
      ''';
      final expected = loadGolden('simple_model');
      final generatedCode = generateForSchema(schema);

    });

    test('should generate a class for a model with all optional fields except id field', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Model with Key Directive', (){
    test('should generate a class for model with key directive', (){
      const schema = /* GraphQL */ '''
        type authorBook @model @key(name: "byAuthor", fields: ["author_id"]) @key(name: "byBook", fields: ["book_id"]) {
          id: ID!
          author_id: ID!
          book_id: ID!
          author: String
          book: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Model with Auth Directive', (){
    test('should generate class with owner auth', (){
      const schema = /* GraphQL */ '''
        type simpleOwnerAuth @model @auth(rules: [{ allow: owner }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with owner auth allowing others to read:', (){
      const schema = /* GraphQL */ '''
        type allowRead @model @auth(rules: [{ allow: owner, operations: [create, delete, update] }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should include authRules in schema when owner auth is used with ownerField', (){
      const schema = /* GraphQL */ '''
        type Post @model @auth(rules: [{ allow: owner, ownerField: "author" }]) {
          id: ID!
          title: String!
          author: String!
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with static groups', (){
      const schema = /* GraphQL */ '''
        type staticGroups @model @auth(rules: [{ allow: groups, groups: ["Admin"] }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with dynamic groups', (){
      const schema = /* GraphQL */ '''
        type dynamicGroups @model @auth(rules: [{ allow: groups, groupsField: "groups" }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with public authorization', (){
      const schema = /* GraphQL */ '''
        type publicType @model @auth(rules: [{ allow: public }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with private authorization', (){
      const schema = /* GraphQL */ '''
        type privateType @model @auth(rules: [{ allow: private }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should support multiple auth rules', (){
      const schema = /* GraphQL */ '''
        type Post
          @model
          @auth(
            rules: [
              { allow: groups, groups: ["admin"] }
              { allow: owner, operations: ["create", "update"] }
              { allow: public, operation: ["read"] }
            ]
          ) {
          id: ID!
          title: String!
          owner: String!
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with custom claims', (){
      const schema = /* GraphQL */ '''
        type customClaim @model @auth(rules: [{ allow: owner, identityClaim: "user_id" }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate class with custom group claims', (){
      const schema = /* GraphQL */ '''
        type customClaim @model @auth(rules: [{ allow: groups, groups: ["Moderator"], groupClaim: "user_groups" }]) {
          id: ID!
          name: String
          bar: String
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    group('should generate AuthRule with provider information when enabled', (){
      const schema = /* GraphQL */ '''
        type TodoWithAuth
          @model
          @auth(
            rules: [
              { allow: groups, groups: ["admin"] }
              { allow: owner, operations: ["create", "update"] }
              { allow: public, operations: ["read"], provider: "apiKey" }
            ]
          ) {
          id: ID!
          name: String!
        }
      ''';
      
      [true, false].forEach(enableDartNullSafety => {
        const visitor = getVisitor({
          schema,
          selectedType: 'TodoWithAuth',
          enableDartNullSafety,
          enableDartZeroThreeFeatures: true,
          isTimestampFieldsAdded: true,
        });
        const generatedCode = visitor.generate();
        test('inserting auth provider to auth when nullsafety is ${enableDartNullSafety ? 'enabled' : 'disabled'}', (){
          expect(generatedCode).toMatchSnapshot();
        });
      })
    })
  });

  group('Model with Connection Directive', (){
    test('should generate classes for models with one to many connection', (){
      const schema = /* GraphQL */ '''
        type Todo @model {
          id: ID!
          tasks: [Task] @connection(name: "TodoTasks")
        }

        type Task @model {
          id: ID
          todo: Todo @connection(name: "TodoTasks")
        }
      ''';
      const outputModels: string[] = ['Todo', 'Task'];
      outputModels.forEach(model => {
        const generatedCode = getVisitor({schema, selectedType: model}).generate();
        expect(generatedCode).toMatchSnapshot();
      });
    });

    test('should support connection directive with keyName and fields', (){
      const schema = /* GraphQL */ '''
        type Blog @model {
          id: ID!
          name: String!
          posts: [Post] @connection(keyName: "byBlog", fields: ["id"])
          test: [String]
        }
        type Comment @model @key(name: "byPost", fields: ["postID", "content"]) {
          id: ID!
          postID: ID!
          post: Post @connection(fields: ["postID"])
          content: String!
        }
        type Post @model @key(name: "byBlog", fields: ["blogID"]) {
          id: ID!
          title: String!
          blogID: ID!
          blog: Blog @connection(fields: ["blogID"])
          comments: [Comment] @connection(keyName: "byPost", fields: ["id"])
        }
      ''';
      const outputModels: string[] = ['Blog', 'Comment', 'Post'];
      outputModels.forEach(model => {
        const generatedCode = getVisitor({ schema, selectedType: model }).generate();
        expect(generatedCode).toMatchSnapshot();
      });
    });
  });

  group('Enum Generation', (){
    test('should generate a class for enum type', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          status: Status
        }
        enum Status {
          yes
          no
          maybe
        }
      ''';
      const outputModels: string[] = ['SimpleModel', 'Status'];
      outputModels.forEach(model => {
        const generatedCode = getVisitor({ schema, selectedType: model }).generate();
        expect(generatedCode).toMatchSnapshot();
      });
    });
  });

  group('Field tests', (){
    test('should generate correct output for regular field w/o list or nullable', (){
      const schema = /* GraphQL */ '''
        type TestModel @model {
          id: ID!
          floatVal: Float!
          floatNullableVal: Float
          floatList: [Float!]!
          floatNullableList: [Float!]
          nullableFloatList: [Float]!
          nullableFloatNullableList: [Float]
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate correct output for enum field w/o list or nullable', (){
      const schema = /* GraphQL */ '''
        type TestEnumModel @model {
          id: ID!

          enumVal: TestEnum!

          nullableEnumVal: TestEnum

          enumList: [TestEnum!]!
          enumNullableList: [TestEnum!]
          nullableEnumList: [TestEnum]!
          nullableEnumNullableList: [TestEnum]
        }

        enum TestEnum {
          VALUE_ONE
          VALUE_TWO
        }
      ''';
      const visitor = getVisitor({ schema, selectedType: 'TestEnumModel' });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate correct output for appsync scalar types of time and int', (){
      const schema = /* GraphQL */ '''
        type TemporalTimeModel @model {
          id: ID!
          date: AWSDate
          time: AWSTime
          dateTime: AWSDateTime
          timestamp: AWSTimestamp
          intNum: Int
          dateList: [AWSDate]
          timeList: [AWSTime]
          dateTimeList: [AWSDateTime]
          timestampList: [AWSTimestamp]
          intList: [Int]
        }
      ''';
      const visitor = getVisitor({ schema });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Dart Specific Tests', (){
    test('should generate the model provider', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          name: String
        }
      ''';
      const visitor = getVisitor({schema, generate: CodeGenGenerateEnum.loader });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should throw error when a reserved word of dart is used in graphql schema field name', (){
      const schema = /* GraphQL */ '''
        type ReservedWord @model {
          id: ID!
          class: String!
        }
      ''';
      const visitor = getVisitor({ schema });
      expect(visitor.generate).toThrowErrorMatchingInlineSnapshot(
        '"Field name 'class' in type 'ReservedWord' is a reserved word in dart. Please use a non-reserved name instead."',
      );
    });

    test('should throw error when a reserved word of dart is used in graphql schema type name', (){
      const schema = /* GraphQL */ '''
        type class @model {
          id: ID!
          name: String!
        }
      ''';
      const visitor = getVisitor({ schema });
      expect(visitor.generate).toThrowErrorMatchingInlineSnapshot(
        '"Type name 'class' is a reserved word in dart. Please use a non-reserved name instead."',
      );
    });
  });

  group('Null Safety Tests', (){
    test('should generate correct model files if the null safety is enabled', (){
      const schema = /* GraphQL */ '''
        type Blog @model {
          id: ID!
          name: String!
          posts: [Post] @connection(keyName: "byBlog", fields: ["id"])
        }
        type Comment @model @key(name: "byPost", fields: ["postID", "content"]) {
          id: ID!
          postID: ID!
          post: Post @connection(fields: ["postID"])
          content: String!
        }
        type Post @model @key(name: "byBlog", fields: ["blogID"]) {
          id: ID!
          title: String!
          blogID: ID!
          blog: Blog @connection(fields: ["blogID"])
          comments: [Comment] @connection(keyName: "byPost", fields: ["id"])
        }
      ''';
      const outputModels: string[] = ['Blog', 'Comment', 'Post'];
      outputModels.forEach(model => {
        const generatedCode = getVisitor({ schema, selectedType: model, enableDartNullSafety: true }).generate();
        expect(generatedCode).toMatchSnapshot();
      });
    });

    test('should generate correct null safe output for regular field w/o list or nullable', (){
      const schema = /* GraphQL */ '''
        type TestModel @model {
          id: ID!
          floatVal: Float!
          floatNullableVal: Float
          floatList: [Float!]!
          floatNullableList: [Float!]
          nullableFloatList: [Float]!
          nullableFloatNullableList: [Float]
        }
      ''';
      const generatedCode = getVisitor({ schema, selectedType: 'TestModel', enableDartNullSafety: true }).generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate correct internal constructor for a model has only ID field', (){
      const schema = /* GraphQL */ '''
        type TestModel @model {
          id: ID!
        }
      ''';
      const generatedCode = getVisitor({ schema, selectedType: 'TestModel', enableDartNullSafety: true }).generate();
      expect(generatedCode).toMatchSnapshot();
    });

    test('should generate correct null safe output for regular scalar/list fields', (){
      const schema = /* GraphQL */ '''
        type TestModel @model {
          id: ID!
          floatVal: Float!
          floatNullableVal: Float
          floatList: [Float!]!
          floatNullableList: [Float!]
          nullableFloatList: [Float]!
          nullableFloatNullableList: [Float]
          intVal: Int!
          intNullableVal: Int
          intList: [Int!]!
          intNullableList: [Int!]
          nullableIntList: [Int]!
          nullableIntNullableList: [Int]
        }
      ''';
      const generatedCode = getVisitor({ schema, selectedType: 'TestModel', enableDartNullSafety: true }).generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('CustomType (non-model) Tests', (){
    const schema = /* GraphQL */ '''
        type Person @model {
          name: String!
          phone: Phone!
          mailingAddresses: [Address]
        }

        type Contact {
          contactName: String!
          phone: Phone!
          mailingAddresses: [Address]
        }

        type Phone {
          countryCode: String!
          areaCode: String!
          number: String!
        }

        type Address {
          line1: String!
          line2: String
          city: String!
          state: String!
          postalCode: String!
        }
      ''';

    const models = [undefined, 'Person', 'Contact', 'Address'];

    models.forEach(type => {
      test('should generated correct dart class for ${!type ? 'ModelProvider' : type} with nullsafety enabled', (){
        const generatedCode = getVisitor({schema, selectedType: type, generate: !type ? CodeGenGenerateEnum.loader : CodeGenGenerateEnum.code, enableDartNullSafety: true, enableDartZeroThreeFeatures: true }).generate();

        expect(generatedCode).toMatchSnapshot();
      })
    });

    models.forEach(type => {
      test('should generated correct dart class for ${!type ? 'ModelProvider' : type} with nullsafety disabled', (){
        const generatedCode = getVisitor({ schema, selectedType: type, generate: !type ? CodeGenGenerateEnum.loader : CodeGenGenerateEnum.code, enableDartNullSafety: false, enableDartZeroThreeFeatures: true }).generate();

        expect(generatedCode).toMatchSnapshot();
      })
    });

    test('should not generate custom type field in model provider if non model feature is disabled', (){
      const generatedCode = getVisitor({
        schema,
        generate: CodeGenGenerateEnum.loader,
        enableDartNullSafety: true,
        enableDartZeroThreeFeatures: false,
      }).generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Read-only Field Tests', (){
    test('should generate the read-only timestamp fields when isTimestampFields is true', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          name: String
        }
      ''';
      const visitor = getVisitor({ schema, isTimestampFieldsAdded: true, enableDartZeroThreeFeatures: false });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Read-only and Null Safety Combined Tests', (){
    test('should generate the read-only timestamp fields when isTimestampFields is true and with null safety', (){
      const schema = /* GraphQL */ '''
        type SimpleModel @model {
          id: ID!
          name: String
        }
      ''';
      const visitor = getVisitor({ schema, enableDartNullSafety: true, isTimestampFieldsAdded: true, enableDartZeroThreeFeatures: false });
      const generatedCode = visitor.generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });

  group('Many To Many V2 Tests', (){
    test('Should generate the intermediate model successfully', (){
      const schema = /* GraphQL */ '''
        type Post @model {
          id: ID!
          title: String!
          content: String
          tags: [Tag] @manyToMany(relationName: "PostTags")
        }
        
        type Tag @model {
          id: ID!
          label: String!
          posts: [Post] @manyToMany(relationName: "PostTags")
        }
      ''';
      const generatedCode = getVisitor({ schema, transformerVersion: 2 }).generate();
      expect(generatedCode).toMatchSnapshot();
    });
  });
});

}