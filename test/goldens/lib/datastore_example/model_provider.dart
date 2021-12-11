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
import 'j_s_o_n_type_model.dart';
import 'j_s_o_n_list_type_model.dart';
import 'enum_type_model.dart';
import 'enum_list_type_model.dart';
import 'multi_type_model.dart';
import 'model_nested_custom_type.dart';
import 'all_scalar_types_custom_type.dart';
import 'all_scalar_types_list_custom_type.dart';
import 'simple_custom_type.dart';

class ModelProvider extends ModelProviderInterface {
  @override
  String get version => '95b5df4760144642248da339f2866829b8e55a1c';
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
        JSONTypeModel.schema,
        JSONListTypeModel.schema,
        EnumTypeModel.schema,
        EnumListTypeModel.schema,
        MultiTypeModel.schema,
        ModelNestedCustomType.schema,
        AllScalarTypesCustomType.schema,
        AllScalarTypesListCustomType.schema,
        SimpleCustomType.schema
      ];
}
