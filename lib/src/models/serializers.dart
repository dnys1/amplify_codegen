import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'auth_rule.dart';
import 'claimant.dart';
import 'model.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthStrategy,
  AuthProvider,
  ModelOperation,
  AuthRule,
  Claimant,
  Model,
  ModelField,
  TypeInfo,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(AWSTypeSerializer()))
    .build();
