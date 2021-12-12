/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: constant_identifier_names

library models.model_provider;

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'blog.dart';
import 'post.dart';
import 'comment.dart';
import 'has_many_model.dart';
import 'has_many_child_model.dart';
import 'has_one_model.dart';
import 'belongs_to_model.dart';
import 'child_model.dart';
import 'string_type_model.dart';
import 'string_list_type_model.dart';
import 'int_type_model.dart';
import 'int_list_type_model.dart';
import 'double_type_model.dart';
import 'double_list_type_model.dart';
import 'bool_type_model.dart';
import 'bool_list_type_model.dart';
import 'date_type_model.dart';
import 'date_list_type_model.dart';
import 'date_time_type_model.dart';
import 'date_time_list_type_model.dart';
import 'time_type_model.dart';
import 'time_list_type_model.dart';
import 'timestamp_type_model.dart';
import 'timestamp_list_type_model.dart';
import 'json_type_model.dart';
import 'json_list_type_model.dart';
import 'enum_type_model.dart';
import 'enum_list_type_model.dart';
import 'multi_type_model.dart';
import 'model_nested_custom_type.dart';
import 'all_scalar_types_custom_type.dart';
import 'all_scalar_types_list_custom_type.dart';
import 'simple_custom_type.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'all_scalar_types_custom_type.dart';
import 'all_scalar_types_list_custom_type.dart';
import 'belongs_to_model.dart';
import 'blog.dart';
import 'bool_list_type_model.dart';
import 'bool_type_model.dart';
import 'child_model.dart';
import 'comment.dart';
import 'date_list_type_model.dart';
import 'date_time_list_type_model.dart';
import 'date_time_type_model.dart';
import 'date_type_model.dart';
import 'double_list_type_model.dart';
import 'double_type_model.dart';
import 'enum_list_type_model.dart';
import 'enum_type_model.dart';
import 'has_many_child_model.dart';
import 'has_many_model.dart';
import 'has_one_model.dart';
import 'int_list_type_model.dart';
import 'int_type_model.dart';
import 'json_list_type_model.dart';
import 'json_type_model.dart';
import 'model_nested_custom_type.dart';
import 'multi_type_model.dart';
import 'post.dart';
import 'simple_custom_type.dart';
import 'string_list_type_model.dart';
import 'string_type_model.dart';
import 'time_list_type_model.dart';
import 'time_type_model.dart';
import 'timestamp_list_type_model.dart';
import 'timestamp_type_model.dart';
export 'all_scalar_types_custom_type.dart';
export 'all_scalar_types_list_custom_type.dart';
export 'belongs_to_model.dart';
export 'blog.dart';
export 'bool_list_type_model.dart';
export 'bool_type_model.dart';
export 'child_model.dart';
export 'comment.dart';
export 'date_list_type_model.dart';
export 'date_time_list_type_model.dart';
export 'date_time_type_model.dart';
export 'date_type_model.dart';
export 'double_list_type_model.dart';
export 'double_type_model.dart';
export 'enum_list_type_model.dart';
export 'enum_model.dart';
export 'enum_type_model.dart';
export 'has_many_child_model.dart';
export 'has_many_model.dart';
export 'has_one_model.dart';
export 'int_list_type_model.dart';
export 'int_type_model.dart';
export 'json_list_type_model.dart';
export 'json_type_model.dart';
export 'model_nested_custom_type.dart';
export 'multi_type_model.dart';
export 'post.dart';
export 'simple_custom_type.dart';
export 'string_list_type_model.dart';
export 'string_type_model.dart';
export 'time_list_type_model.dart';
export 'time_type_model.dart';
export 'timestamp_list_type_model.dart';
export 'timestamp_type_model.dart';

class ModelProvider extends ModelProviderInterface {
  static final instance = ModelProvider();

  @override
  String get version => 'fefbc59e9be10814774d53dbcc960943ce0e69ec';
  @override
  List<ModelSchema> get modelSchemas => [
        Blog.schema,
        Post.schema,
        Comment.schema,
        HasManyModel.schema,
        HasManyChildModel.schema,
        HasOneModel.schema,
        BelongsToModel.schema,
        ChildModel.schema,
        StringTypeModel.schema,
        StringListTypeModel.schema,
        IntTypeModel.schema,
        IntListTypeModel.schema,
        DoubleTypeModel.schema,
        DoubleListTypeModel.schema,
        BoolTypeModel.schema,
        BoolListTypeModel.schema,
        DateTypeModel.schema,
        DateListTypeModel.schema,
        DateTimeTypeModel.schema,
        DateTimeListTypeModel.schema,
        TimeTypeModel.schema,
        TimeListTypeModel.schema,
        TimestampTypeModel.schema,
        TimestampListTypeModel.schema,
        JsonTypeModel.schema,
        JsonListTypeModel.schema,
        EnumTypeModel.schema,
        EnumListTypeModel.schema,
        MultiTypeModel.schema,
        ModelNestedCustomType.schema
      ];
  @override
  List<ModelSchema> get customTypeSchemas => [
        AllScalarTypesCustomType.schema,
        AllScalarTypesListCustomType.schema,
        SimpleCustomType.schema
      ];
  @override
  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case 'Blog':
        return Blog.classType;
      case 'Post':
        return Post.classType;
      case 'Comment':
        return Comment.classType;
      case 'HasManyModel':
        return HasManyModel.classType;
      case 'HasManyChildModel':
        return HasManyChildModel.classType;
      case 'HasOneModel':
        return HasOneModel.classType;
      case 'BelongsToModel':
        return BelongsToModel.classType;
      case 'ChildModel':
        return ChildModel.classType;
      case 'StringTypeModel':
        return StringTypeModel.classType;
      case 'StringListTypeModel':
        return StringListTypeModel.classType;
      case 'IntTypeModel':
        return IntTypeModel.classType;
      case 'IntListTypeModel':
        return IntListTypeModel.classType;
      case 'DoubleTypeModel':
        return DoubleTypeModel.classType;
      case 'DoubleListTypeModel':
        return DoubleListTypeModel.classType;
      case 'BoolTypeModel':
        return BoolTypeModel.classType;
      case 'BoolListTypeModel':
        return BoolListTypeModel.classType;
      case 'DateTypeModel':
        return DateTypeModel.classType;
      case 'DateListTypeModel':
        return DateListTypeModel.classType;
      case 'DateTimeTypeModel':
        return DateTimeTypeModel.classType;
      case 'DateTimeListTypeModel':
        return DateTimeListTypeModel.classType;
      case 'TimeTypeModel':
        return TimeTypeModel.classType;
      case 'TimeListTypeModel':
        return TimeListTypeModel.classType;
      case 'TimestampTypeModel':
        return TimestampTypeModel.classType;
      case 'TimestampListTypeModel':
        return TimestampListTypeModel.classType;
      case 'JSONTypeModel':
        return JsonTypeModel.classType;
      case 'JSONListTypeModel':
        return JsonListTypeModel.classType;
      case 'EnumTypeModel':
        return EnumTypeModel.classType;
      case 'EnumListTypeModel':
        return EnumListTypeModel.classType;
      case 'MultiTypeModel':
        return MultiTypeModel.classType;
      case 'ModelNestedCustomType':
        return ModelNestedCustomType.classType;
      default:
        throw ArgumentError(
            'Failed to find model in model provider for model name: ' +
                modelName);
    }
  }
}
