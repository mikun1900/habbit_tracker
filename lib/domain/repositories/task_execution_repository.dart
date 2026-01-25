import '../entities/task_execution.dart';

/// タスク実行記録のリポジトリインターフェース
abstract class TaskExecutionRepository {
  Future<TaskExecution> createExecution(TaskExecution execution);
  Future<TaskExecution?> getExecutionById(String id);
  Future<List<TaskExecution>> getExecutionsByTaskId(String taskId);
  Future<List<TaskExecution>> getExecutionsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  });
  Stream<List<TaskExecution>> watchExecutionsByTaskId(String taskId);
  Future<void> deleteExecution(String id);
  Future<TaskExecution?> getTodayExecution(String taskId);
  Future<Map<DateTime, int>> getExecutionCountByDate({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  });
}
