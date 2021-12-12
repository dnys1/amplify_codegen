import 'package:amplify_codegen/src/generator/generator.dart';
import 'package:amplify_codegen/src/helpers/enum.dart';
import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
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
          v.name = value.name.value.camelCase;
        }));
      }
    }));
    builder.body.addAll([
      _valueExtension,
      _listExtension,
    ]);
    return builder.build();
  }

  Extension get _valueExtension => Extension(
        (e) => e
          ..name = '\$$typeName'
          ..on = refer(typeName)
          ..methods.add(_valueGetter),
      );

  Extension get _listExtension => Extension(
        (e) => e
          ..name = '\$${typeName}List'
          ..on = listOf(refer(typeName))
          ..methods.add(_byValueHelper),
      );

  Iterable<Code> get _values sync* {
    for (var value in node.values) {
      final dartName = value.dartName;
      final wireValue = value.wireValue;
      yield Block.of([
        Code('case $typeName.$dartName:'),
        literalString(wireValue).returned.statement,
      ]);
    }
  }

  Method get _valueGetter {
    final switchStatement = Block.of([
      const Code('switch (this) {'),
      ..._values,
      const Code('}'),
    ]);

    return Method(
      (m) => m
        ..name = 'value'
        ..returns = refer('String')
        ..type = MethodType.getter
        ..body = switchStatement,
    );
  }

  Method get _byValueHelper {
    return Method(
      (m) => m
        ..name = 'byValue'
        ..requiredParameters.add(
          Parameter((p) => p
            ..name = 'value'
            ..type = refer('String').nullable),
        )
        ..returns = refer(typeName).nullable
        ..body = Block.of([
          const Code('try {'),
          refer(typeName)
              .property('values')
              .property('firstWhere')
              .call([
                Method(
                  (c) => c
                    ..requiredParameters.add(Parameter((p) => p..name = 'el'))
                    ..lambda = true
                    ..body = const Code('el.value == value'),
                ).closure,
              ])
              .returned
              .statement,
          const Code('} on StateError {'),
          literalNull.returned.statement,
          const Code('}'),
        ]),
    );
  }
}
