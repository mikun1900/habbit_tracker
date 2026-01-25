import 'package:uuid/uuid.dart';
import '../../domain/entities/task_execution.dart';
import '../../domain/repositories/task_execution_repository.dart';
import '../datasources/task_execution_local_datasource.dart';

class TaskExecutionRepositoryImpl implements TaskExecutionRepository {
  final TaskExecutionLocalDataSource _dataSource;

  TaskExecutionRepositoryImpl(this._dataSource);

  @override
  Future<TaskExecution> createExecution(TaskExecution execution) async {
    try {
      final executionMap = _executionToMap(execution);
      await _dataSource.insertExecution(executionMap);
      return execution;
    } catch (e) {
      throw Exception('実行記録作成に失敗しました: $e');
    }
  }

  @override
  Future<TaskExecution?> getExecutionById(String id) async {
    try {
      final executionMap = await _dataSource.getExecutionById(id);
      return executionMap != null ? _mapToExecution(executionMap) : null;
    } catch (e) {
      throw Exception('実行記録取得に失敗しました: $e');
    }
  }

  @override
  Future<List<TaskExecution>> getExecutionsByTaskId(String taskId) async {
    try {
      final executionMaps = await _dataSource.getExecutionsByTaskId(taskId);
      return executionMaps.map(_mapToExecution).toList();
    } catch (e) {
      throw Exception('実行記録一覧取得に失敗しました: $e');
    }
  }

  @override
  Future<List<TaskExecution>> getExecutionsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    try {
      _validateDateRange(startDate, endDate);

      final executionMaps = await _dataSource.getExecutionsByDateRange(
        startDate: startDate,
        endDate: endDate,
        taskId: taskId,
      );
      return executionMaps.map(_mapToExecution).toList();
    } catch (e) {
      throw Exception('期間内の実行記録取得に失敗しました: $e');
    }
  }

  @override
  Stream<List<TaskExecution>> watchExecutionsByTaskId(String taskId) async* {
    try {
      while (true) {
        yield await getExecutionsByTaskId(taskId);
        await Future.delayed(const Duration(seconds: 1));
      }
    } catch (e) {
      throw Exception('実行記録監視に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteExecution(String id) async {
    try {
      await _dataSource.deleteExecution(id);
    } catch (e) {
      throw Exception('実行記録削除に失敗しました: $e');
    }
  }

  @override
  Future<TaskExecution?> getTodayExecution(String taskId) async {
    try {
      final executionMap = await _dataSource.getTodayExecution(taskId);
      return executionMap != null ? _mapToExecution(executionMap) : null;
    } catch (e) {
      throw Exception('当日の実行記録取得に失敗しました: $e');
    }
  }

  @override
  Future<Map<DateTime, int>> getExecutionCountByDate({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    try {
      _validateDateRange(startDate, endDate);

      final executions = await getExecutionsByDateRange(
        startDate: startDate,
        endDate: endDate,
        taskId: taskId,
      );

      final Map<DateTime, int> countMap = {};
      for (final execution in executions) {
        final date = _normalizeDate(execution.executedAt);
        countMap[date] = (countMap[date] ?? 0) + 1;
      }

      return countMap;
    } catch (e) {
      throw Exception('日付別実行回数計算に失敗しました: $e');
    }
  }

  /// TaskExecution エンティティを Map に変換
  Map<String, dynamic> _executionToMap(TaskExecution execution) {
    return {
      'id': execution.id,
      'task_id': execution.taskId,
      'executed_at': execution.executedAt.millisecondsSinceEpoch,
      'created_at': execution.createdAt.millisecondsSinceEpoch,
    };
  }

  /// Map を TaskExecution エンティティに変換
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

  /// DateTime を正規化（時刻を00:00:00にする）
  DateTime _normalizeDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// 日付範囲の妥当性チェック
  void _validateDateRange(DateTime startDate, DateTime endDate) {
    if (startDate.isAfter(endDate)) {
      throw ArgumentError('開始日時は終了日時よりも前である必要があります');
    }
  }
}
