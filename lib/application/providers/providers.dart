import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:habbit_tracker/infrastructure/database/database_helper.dart';
import 'package:habbit_tracker/infrastructure/datasources/task_local_datasource.dart';
import 'package:habbit_tracker/infrastructure/datasources/task_execution_local_datasource.dart';
import 'package:habbit_tracker/infrastructure/repositories/task_repository_impl.dart';
import 'package:habbit_tracker/infrastructure/repositories/task_execution_repository_impl.dart';
import 'package:habbit_tracker/domain/repositories/task_repository.dart';
import 'package:habbit_tracker/domain/repositories/task_execution_repository.dart';

part 'providers.g.dart';

/// DatabaseHelperプロバイダー
///
/// アプリケーション全体で使用するシングルトンデータベースインスタンスを提供します。
@riverpod
DatabaseHelper databaseHelper(DatabaseHelperRef ref) {
  return DatabaseHelper.instance;
}

/// TaskLocalDataSourceプロバイダー
///
/// タスクのローカルデータソースを提供します。
/// DatabaseHelperに依存しています。
@riverpod
TaskLocalDataSource taskLocalDataSource(TaskLocalDataSourceRef ref) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return TaskLocalDataSource(dbHelper);
}

/// TaskExecutionLocalDataSourceプロバイダー
///
/// タスク実行記録のローカルデータソースを提供します。
/// DatabaseHelperに依存しています。
@riverpod
TaskExecutionLocalDataSource taskExecutionLocalDataSource(
  TaskExecutionLocalDataSourceRef ref,
) {
  final dbHelper = ref.watch(databaseHelperProvider);
  return TaskExecutionLocalDataSource(dbHelper);
}

/// TaskRepositoryプロバイダー
///
/// タスクリポジトリを提供します。
/// TaskLocalDataSourceに依存しています。
@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  final dataSource = ref.watch(taskLocalDataSourceProvider);
  return TaskRepositoryImpl(dataSource);
}

/// TaskExecutionRepositoryプロバイダー
///
/// タスク実行記録リポジトリを提供します。
/// TaskExecutionLocalDataSourceに依存しています。
@riverpod
TaskExecutionRepository taskExecutionRepository(
  TaskExecutionRepositoryRef ref,
) {
  final dataSource = ref.watch(taskExecutionLocalDataSourceProvider);
  return TaskExecutionRepositoryImpl(dataSource);
}
