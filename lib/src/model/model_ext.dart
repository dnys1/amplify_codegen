import 'package:amplify_codegen/src/helpers/recase.dart';
import 'package:amplify_codegen/src/model/model.pb.dart';

typedef _OrElse<T> = T Function();

extension AuthStrategyX on AuthStrategy {
  static AuthStrategy _defaultOrElse() => AuthStrategy.ALLOW_UNSPECIFIED;
  static AuthStrategy valueOf(
    String value, {
    _OrElse<AuthStrategy> orElse = _defaultOrElse,
  }) {
    return AuthStrategy.values.firstWhere(
      (el) => el.name == 'ALLOW_${value.constantCase}',
      orElse: orElse,
    );
  }

  /// The name in Amplify DataStore.
  // TODO: Update Amplify DataStore to align casing.
  String get dartName => name.substring('ALLOW_'.length);

  /// The default auth provider when not specified.
  AuthProvider get defaultProvider => const {
        AuthStrategy.ALLOW_PUBLIC: AuthProvider.BY_API_KEY,
        AuthStrategy.ALLOW_PRIVATE: AuthProvider.BY_USER_POOLS,
        AuthStrategy.ALLOW_OWNER: AuthProvider.BY_USER_POOLS,
        AuthStrategy.ALLOW_GROUPS: AuthProvider.BY_USER_POOLS,
        AuthStrategy.ALLOW_CUSTOM: AuthProvider.BY_LAMBDA,
      }[this]!;
}

extension AuthProviderX on AuthProvider {
  static AuthProvider _defaultOrElse() => AuthProvider.BY_UNSPECIFIED;
  static AuthProvider valueOf(
    String value, {
    _OrElse<AuthProvider> orElse = _defaultOrElse,
  }) {
    return AuthProvider.values.firstWhere(
      (el) => el.name == 'BY_${value.constantCase}',
      orElse: orElse,
    );
  }

  /// The name in Amplify DataStore.
  // TODO: Update Amplify DataStore to align casing.
  String get dartName => const {
        AuthProvider.BY_API_KEY: 'APIKEY',
        AuthProvider.BY_OIDC: 'OIDC',
        AuthProvider.BY_IAM: 'IAM',
        AuthProvider.BY_USER_POOLS: 'USERPOOLS',
        AuthProvider.BY_LAMBDA: 'FUNCTION',
      }[this]!;
}

extension ModelOperationX on ModelOperation {
  static ModelOperation _defaultOrElse() => ModelOperation.OP_UNSPECIFIED;
  static ModelOperation valueOf(
    String value, {
    _OrElse<ModelOperation> orElse = _defaultOrElse,
  }) {
    return ModelOperation.values.firstWhere(
      (el) => el.name == 'OP_${value.constantCase}',
      orElse: orElse,
    );
  }

  /// All values, minus the unspecified one.
  static const List<ModelOperation> values = [
    ModelOperation.OP_CREATE,
    ModelOperation.OP_READ,
    ModelOperation.OP_UPDATE,
    ModelOperation.OP_DELETE,
  ];

  /// The name in Amplify DataStore.
  // TODO: Update Amplify DataStore to align casing.
  String get dartName => name.substring('OP_'.length);
}

extension GraphQLTypeX on GraphQLType {
  static GraphQLType _defaultOrElse() => GraphQLType.TYPE_UNSPECIFIED;
  static GraphQLType valueOf(
    String value, {
    _OrElse<GraphQLType> orElse = _defaultOrElse,
  }) {
    return GraphQLType.values.firstWhere(
      (el) => el.name == 'TYPE_${value.constantCase}',
      orElse: orElse,
    );
  }
}
