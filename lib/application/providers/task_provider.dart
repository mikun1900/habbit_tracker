import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:habbit_tracker/domain/entities/task.dart';
import 'providers.dart';

part 'task_provider.g.dart';

/// タスク一覧のStreamProvider
///
/// すべてのタスク（削除されていないもの）を監視します。
/// タスクが追加・更新・削除されると自動的に再読み込みされます。
@riverpod
Stream<List<Task>> taskList(TaskListRef ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.watchAllTasks();
}

/// 特定タスクのFutureProvider
///
/// 指定されたIDのタスクを非同期で取得します。
/// 実行されたことがない場合や削除済みの場合はnullを返します。
@riverpod
Future<Task?> task(TaskRef ref, String taskId) async {
  final repository = ref.watch(taskRepositoryProvider);
  return await repository.getTaskById(taskId);
}

/// タスクCRUD用Notifier
///
/// タスクの作成、更新、削除をサポートしています。
@riverpod
class TaskNotifier extends _$TaskNotifier {
  @override
  FutureOr<void> build() {
    // 初期化処理は不要
  }

  /// 新しいタスクを作成します
  ///
  /// Tasks が正常に保存されると、taskListが自動的に更新されます。
  /// [task] 保存するタスク
  Future<void> addTask(Task task) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.createTask(task);
    // taskListProviderを無効化して再読み込みをトリガー
    ref.invalidate(taskListProvider);
  }

  /// 既存のタスクを更新します
  ///
  /// [task] 更新するタスク（idは必須）
  Future<void> updateTask(Task task) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.updateTask(task);
    // taskListProviderを無効化して再読み込みをトリガー
    ref.invalidate(taskListProvider);
    // 個別のtaskProviderも無効化
    ref.invalidate(taskProvider(task.id));
  }

  /// タスクを論理削除します
  ///
  /// データベースから完全には削除されず、削除フラグが立ちます。
  /// [taskId] 削除するタスクのID
  Future<void> deleteTask(String taskId) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.deleteTask(taskId);
    // taskListProviderを無効化して再読み込みをトリガー
    ref.invalidate(taskListProvider);
    // 個別のtaskProviderも無効化
    ref.invalidate(taskProvider(taskId));
  }

  /// タスクを完全に削除します
  ///
  /// データベースから完全に削除されます。
  /// [taskId] 削除するタスクのID
  Future<void> permanentlyDeleteTask(String taskId) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.permanentlyDeleteTask(taskId);
    // taskListProviderを無効化して再読み込みをトリガー
    ref.invalidate(taskListProvider);
    // 個別のtaskProviderも無効化
    ref.invalidate(taskProvider(taskId));
  }
}
