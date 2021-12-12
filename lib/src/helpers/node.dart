import 'package:gql/ast.dart';

extension ValueHelpers on ValueNode {
  String get stringValue {
    if (this is EnumValueNode) {
      return (this as EnumValueNode).name.value;
    } else if (this is StringValueNode) {
      return (this as StringValueNode).value;
    }
    throw ArgumentError(runtimeType);
  }

  List<String> get listValue {
    if (this is! ListValueNode) {
      throw ArgumentError(runtimeType);
    }
    return (this as ListValueNode)
        .values
        .map((node) => node.stringValue)
        .toList();
  }
}
