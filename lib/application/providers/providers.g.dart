// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHelperHash() => r'683fa9404a88f06f488c6c1730184415165224b4';

/// DatabaseHelperプロバイダー
///
/// アプリケーション全体で使用するシングルトンデータベースインスタンスを提供します。
///
/// Copied from [databaseHelper].
@ProviderFor(databaseHelper)
final databaseHelperProvider = AutoDisposeProvider<DatabaseHelper>.internal(
  databaseHelper,
  name: r'databaseHelperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseHelperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseHelperRef = AutoDisposeProviderRef<DatabaseHelper>;
String _$taskLocalDataSourceHash() =>
    r'15d63ed1fa99cb6cc1b259328a4518122464d4d1';

/// TaskLocalDataSourceプロバイダー
///
/// タスクのローカルデータソースを提供します。
/// DatabaseHelperに依存しています。
///
/// Copied from [taskLocalDataSource].
@ProviderFor(taskLocalDataSource)
final taskLocalDataSourceProvider =
    AutoDisposeProvider<TaskLocalDataSource>.internal(
      taskLocalDataSource,
      name: r'taskLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskLocalDataSourceRef = AutoDisposeProviderRef<TaskLocalDataSource>;
String _$taskExecutionLocalDataSourceHash() =>
    r'3ad78b512491c0b11f34f1e381fd8aa789bdaf94';

/// TaskExecutionLocalDataSourceプロバイダー
///
/// タスク実行記録のローカルデータソースを提供します。
/// DatabaseHelperに依存しています。
///
/// Copied from [taskExecutionLocalDataSource].
@ProviderFor(taskExecutionLocalDataSource)
final taskExecutionLocalDataSourceProvider =
    AutoDisposeProvider<TaskExecutionLocalDataSource>.internal(
      taskExecutionLocalDataSource,
      name: r'taskExecutionLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskExecutionLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskExecutionLocalDataSourceRef =
    AutoDisposeProviderRef<TaskExecutionLocalDataSource>;
String _$taskRepositoryHash() => r'2baadc212df7fc5a18622c20109acd34955ad87a';

/// TaskRepositoryプロバイダー
///
/// タスクリポジトリを提供します。
/// TaskLocalDataSourceに依存しています。
///
/// Copied from [taskRepository].
@ProviderFor(taskRepository)
final taskRepositoryProvider = AutoDisposeProvider<TaskRepository>.internal(
  taskRepository,
  name: r'taskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskRepositoryRef = AutoDisposeProviderRef<TaskRepository>;
String _$taskExecutionRepositoryHash() =>
    r'dc3eef731624919ba565ab30689c8fa9a3466720';

/// TaskExecutionRepositoryプロバイダー
///
/// タスク実行記録リポジトリを提供します。
/// TaskExecutionLocalDataSourceに依存しています。
///
/// Copied from [taskExecutionRepository].
@ProviderFor(taskExecutionRepository)
final taskExecutionRepositoryProvider =
    AutoDisposeProvider<TaskExecutionRepository>.internal(
      taskExecutionRepository,
      name: r'taskExecutionRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskExecutionRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskExecutionRepositoryRef =
    AutoDisposeProviderRef<TaskExecutionRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
