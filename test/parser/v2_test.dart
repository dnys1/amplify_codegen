import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/parser/connection.dart';
import 'package:test/test.dart';

void main() {
  group('Parser', () {
    group('V2', () {
      group('Has many comparison', () {
        late Map<String, Model> v2Models;
        late Map<String, Model> v2IndexedModels;

        setUpAll(() {
          const v2Schema = '''
          type Post @model {
            comments: [Comment] @hasMany(fields: ["id"])
          }

          type Comment @model {
            postID: ID! @primaryKey(sortKeyFields: ["content"])
            content: String!
            post: Post @belongsTo(fields:["postID"])
          }
          ''';

          const v2IndexSchema = '''
          type Post @model {
            id: ID!
            title: String!
            comments: [Comment] @hasMany(indexName: "byPost", fields: ["id"])
          }

          type Comment @model {
            id: ID!
            postID: ID! @index(name: "byPost", sortKeyFields: ["content"])
            content: String!
          }
          ''';

          v2Models = parseSchema(v2Schema);
          v2IndexedModels = parseSchema(v2IndexSchema);
        });

        test('should support connection with @primaryKey on BELONGS_TO side',
            () {
          final postField = v2Models['Comment']!.fieldNamed('post');

          expect(postField.isBelongsTo, isTrue);
          expect(postField.targetName, equals('postID'));
        });

        test('should support connection with @primaryKey on HAS_MANY side', () {
          final commentsField = v2Models['Post']!.fieldNamed('comments');

          expect(commentsField.isHasMany, isTrue);
          expect(commentsField.associatedType, equals('Comment'));
          expect(commentsField.associatedName, equals('post'));
        });

        test('Should support connection with @index on BELONGS_TO side', () {
          final commentsField = v2IndexedModels['Post']!.fieldNamed('comments');

          expect(commentsField.isHasMany, isTrue);
          expect(commentsField.associatedType, equals('Comment'));
          expect(commentsField.associatedName, equals('postID'));
        });
      });

      group('HasOne', () {
        late Map<String, Model> noFields;
        late Map<String, Model> withFields;

        setUpAll(() {
          const noFieldsSchema = '''
          type BatteryCharger @model {
            powerSource: PowerSource @hasOne
          }

          type PowerSource @model {
            id: ID!
            amps: Float!
            volts: Float!
          }''';

          const withFieldsSchema = '''
          type BatteryCharger @model {
            chargerID: ID!
            powerSourceID: ID
            powerSource: PowerSource @hasOne(fields: ["powerSourceID"])
          }

          type PowerSource @model {
            sourceID: ID! @primaryKey
            amps: Float!
            volts: Float!
          }''';

          noFields = parseSchema(noFieldsSchema);
          withFields = parseSchema(withFieldsSchema);
        });

        test('Should support @hasOne with no explicit primary key', () {
          final powerSourceField =
              noFields['BatteryCharger']!.fieldNamed('powerSource');

          expect(powerSourceField.isHasOne, isTrue);
          expect(powerSourceField.associatedType, equals('PowerSource'));
          expect(powerSourceField.associatedName, equals('id'));
        });

        test('Should support @hasOne with an explicit primary key', () {
          final powerSourceField =
              withFields['BatteryCharger']!.fieldNamed('powerSource');

          expect(powerSourceField.isHasOne, isTrue);
          expect(powerSourceField.associatedType, equals('PowerSource'));
          expect(powerSourceField.associatedName, equals('sourceID'));
        });
      });

      group('BelongsTo', () {
        late Map<String, Model> modelMap;

        setUpAll(() {
          const schema = '''
          type Project2 @model {
            id: ID!
            name: String
            team: Team2 @hasOne 
          } 
          
          type Team2 @model {
            id: ID!
            name: String!
            project: Project2! @belongsTo
          }''';

          modelMap = parseSchema(schema);
        });

        test('Should support belongsTo and detect connected field', () {
          final projectField = modelMap['Team2']!.fieldNamed('project');

          expect(projectField.isBelongsTo, isTrue);
          expect(projectField.targetName,
              equals(makeConnectionAttributeName('Team2', 'project')));
        });
      });

      group('HasMany', () {
        late Map<String, Model> modelMap;

        setUpAll(() {
          const schema = '''
          type Blog @model {
            id: ID!
            name: String!
            posts: [Post] @hasMany
          }
          
          type Post @model {
            id: ID!
            title: String!
            blog: Blog @belongsTo
            comments: [Comment] @hasMany
          }
          
          type Comment @model {
            id: ID!
            post: Post @belongsTo
            content: String!
          }''';

          modelMap = parseSchema(schema);
        });

        test('Should detect first has many', () {
          final postsField = modelMap['Blog']!.fieldNamed('posts');

          expect(postsField.isHasMany, isTrue);
          expect(postsField.associatedType, equals('Post'));
          expect(postsField.associatedName, equals('blog'));
        });

        test('Should detect second has many', () {
          final commentsField = modelMap['Post']!.fieldNamed('comments');

          expect(commentsField.isHasMany, isTrue);
          expect(commentsField.associatedType, equals('Comment'));
          expect(commentsField.associatedName, equals('post'));
        });

        test('Should detect first belongsTo', () {
          final blogField = modelMap['Post']!.fieldNamed('blog');

          expect(blogField.isBelongsTo, isTrue);
          expect(blogField.targetName,
              equals(makeConnectionAttributeName('Post', 'blog')));
        });

        test('Should detect second belongsTo', () {
          final blogField = modelMap['Comment']!.fieldNamed('post');

          expect(blogField.isBelongsTo, isTrue);
          expect(blogField.targetName,
              equals(makeConnectionAttributeName('Comment', 'post')));
        });
      });
    });
  });
}
