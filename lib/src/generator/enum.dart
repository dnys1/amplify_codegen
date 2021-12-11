import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:code_builder/code_builder.dart';
import 'package:gql/ast.dart';

class EnumGenerator extends LibraryGenerator<EnumTypeDefinitionNode> {
  EnumGenerator(EnumTypeDefinitionNode node) : super(node);

  @override
  Library generate() {
    builder.body.add(Enum((e) {
      final description = node.description?.value;
      if (description != null) {
        e.docs.add(description);
      }
      e.name = typeName;
      for (var value in node.values) {
        e.values.add(EnumValue((v) {
          final description = value.description?.value;
          if (description != null) {
            v.docs.add(description);
          }
          v.name = value.name.value;
        }));
      }
    }));
    return builder.build();
  }
}
