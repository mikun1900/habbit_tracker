import 'package:habbit_tracker/domain/entities/task_execution.dart';
import 'package:habbit_tracker/domain/repositories/task_execution_repository.dart';
import 'package:habbit_tracker/infrastructure/datasources/task_execution_local_datasource.dart';

class TaskExecutionRepositoryImpl implements TaskExecutionRepository {
  final TaskExecutionLocalDataSource _dataSource;

  TaskExecutionRepositoryImpl(this._dataSource);

  @override
  Future<TaskExecution> createExecution(TaskExecution execution) async {
    final executionMap = _executionToMap(execution);
    await _dataSource.insertExecution(executionMap);
    return execution;
  }

  @override
  Future<TaskExecution?> getExecutionById(String id) async {
    final executionMap = await _dataSource.getExecutionById(id);
    return executionMap != null ? _mapToExecution(executionMap) : null;
  }

  @override
  Future<List<TaskExecution>> getExecutionsByTaskId(String taskId) async {
    final executionMaps = await _dataSource.getExecutionsByTaskId(taskId);
    return executionMaps.map(_mapToExecution).toList();
  }

  @override
  Future<List<TaskExecution>> getExecutionsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    final executionMaps = await _dataSource.getExecutionsByDateRange(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );
    return executionMaps.map(_mapToExecution).toList();
  }

  @override
  Stream<List<TaskExecution>> watchExecutionsByTaskId(String taskId) async* {
    while (true) {
      yield await getExecutionsByTaskId(taskId);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<void> deleteExecution(String id) async {
    await _dataSource.deleteExecution(id);
  }

  @override
  Future<TaskExecution?> getTodayExecution(String taskId) async {
    final executionMap = await _dataSource.getTodayExecution(taskId);
    return executionMap != null ? _mapToExecution(executionMap) : null;
  }

  @override
  Future<Map<DateTime, int>> getExecutionCountByDate({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    final executions = await getExecutionsByDateRange(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );

    final Map<DateTime, int> countMap = {};
    for (final execution in executions) {
      final date = DateTime(
        execution.executedAt.year,
        execution.executedAt.month,
        execution.executedAt.day,
      );
      countMap[date] = (countMap[date] ?? 0) + 1;
    }

    return countMap;
  }

  Map<String, dynamic> _executionToMap(TaskExecution execution) {
    return {
      'id': execution.id,
      'task_id': execution.taskId,
      'executed_at': execution.executedAt.millisecondsSinceEpoch,
      'created_at': execution.createdAt.millisecondsSinceEpoch,
    };
  }

  TaskExecution _mapToExecution(Map<String, dynamic> map) {
    return TaskExecution(
      id: map['id'] as String,
      taskId: map['task_id'] as String,
      executedAt: DateTime.fromMillisecondsSinceEpoch(
        map['executed_at'] as int,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }
}
