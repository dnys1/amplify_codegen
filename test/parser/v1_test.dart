import 'package:amplify_codegen/amplify_codegen.dart';
import 'package:amplify_codegen/src/parser/connection.dart';
import 'package:test/test.dart';

void main() {
  group('Parser', () {
    group('V1', () {
      group('Bi-Directional connection (named connection)', () {
        group('1:Many', () {
          late Map<String, Model> modelMap;

          setUp(() {
            const schema = '''
            type Post @model {
              comments: [Comment] @connection(name: "postConnection")
            }

            type Comment @model {
              post: Post @connection(name: "postConnection")
            }''';

            modelMap = parseSchema(schema);
          });

          test('should return HAS_MANY for Post.comments field connection info',
              () {
            final commentsField = modelMap['Post']!.fieldNamed('comments');
            expect(commentsField.isHasMany, isTrue);
            expect(commentsField.associatedType, equals('Comment'));
            expect(commentsField.associatedName, equals('post'));
          });

          test(
              'should return BELONGS_TO for Comment.post field connection info',
              () {
            final commentsField = modelMap['Comment']!.fieldNamed('post');
            expect(commentsField.isBelongsTo, isTrue);
            expect(commentsField.targetName,
                equals(makeConnectionAttributeName('Comment', 'post')));
          });
        });

        group('1:1', () {
          late Map<String, Model> modelMap;

          setUp(() {
            const schema = '''
            type Person @model {
              license: License @connection(name: "PersonLicense")
            }

            type License @model {
              person: Person! @connection(name: "PersonLicense")
            }''';

            modelMap = parseSchema(schema);
          });

          test('should return HAS_ONE Person.license field', () {
            final licenseField = modelMap['Person']!.fieldNamed('license');
            expect(licenseField.isHasOne, isTrue);
            expect(licenseField.associatedType, equals('License'));
            expect(licenseField.associatedName, equals('person'));
          });

          test('should return BELONGS_TO License.person field', () {
            final personField = modelMap['License']!.fieldNamed('person');
            expect(personField.isBelongsTo, isTrue);
            expect(personField.targetName,
                equals(makeConnectionAttributeName('License', 'person')));
          });

          test(
              'should throw error when the One:One connection has optional field on both sides',
              () {
            const schema = '''
            type Person @model {
              license: License @connection(name: "PersonLicense")
            }

            type License @model {
              person: Person @connection(name: "PersonLicense")
            }''';

            expect(() => parseSchema(schema), throwsStateError);
          });
        });
      });

      group('Uni-directional connection (unnamed connection)', () {
        late Map<String, Model> modelMap;

        setUpAll(() {
          const schema = '''
          type Post @model {
            comments: [Comment] @connection
          }

          type Comment @model {
            post: Post @connection
          }''';

          modelMap = parseSchema(schema);
        });

        test('should return HAS_MANY for Post.comments', () {
          final commentsField = modelMap['Post']!.fieldNamed('comments');

          expect(commentsField.isHasMany, isTrue);
          expect(commentsField.associatedType, equals('Comment'));
          expect(commentsField.associatedName, equals('post'));
        });

        test('should return BELONGS_TO for Comment.post', () {
          final postField = modelMap['Comment']!.fieldNamed('post');

          expect(postField.isBelongsTo, isTrue);
          expect(postField.targetName, equals('commentPostId'));
        });
      });

      group('connection v2', () {
        late Map<String, Model> modelMap;

        setUpAll(() {
          const schema = '''
          type Post @model {
            comments: [Comment] @connection(keyName: "byPost", fields: ["id"])
          }

          type Comment @model @key(name: "byPost", fields: ["postID", "content"]) {
            postID: ID!
            content: String!
            post: Post @connection(fields: ["postID"])
          }''';

          modelMap = parseSchema(schema);
        });

        test('should support connection with @key on BELONGS_TO side', () {
          final postField = modelMap['Comment']!.fieldNamed('post');

          expect(postField.isBelongsTo, isTrue);
          expect(postField.targetName, equals('postID'));
        });
      });
    });
  });
}
