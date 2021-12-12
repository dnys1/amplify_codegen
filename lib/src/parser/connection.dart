import 'package:amplify_codegen/src/helpers/recase.dart';

String makeConnectionAttributeName(String modelName, String fieldName) {
  return '${modelName}_${fieldName}_id'.camelCase;
}
