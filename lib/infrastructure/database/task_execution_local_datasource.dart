import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';

class TaskExecutionLocalDataSource {
  final DatabaseHelper _dbHelper;

  TaskExecutionLocalDataSource(this._dbHelper);

  /// 実行記録を挿入
  Future<void> insertExecution(Map<String, dynamic> executionMap) async {
    final db = await _dbHelper.database;
    await db.insert(
      DatabaseHelper.tableTaskExecution,
      executionMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// IDで実行記録を取得
  Future<Map<String, dynamic>?> getExecutionById(String id) async {
    final db = await _dbHelper.database;
    final results = await db.query(
      DatabaseHelper.tableTaskExecution,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? results.first : null;
  }

  /// タスクIDで実行記録を取得（降順）
  Future<List<Map<String, dynamic>>> getExecutionsByTaskId(
    String taskId,
  ) async {
    final db = await _dbHelper.database;
    return await db.query(
      DatabaseHelper.tableTaskExecution,
      where: 'task_id = ?',
      whereArgs: [taskId],
      orderBy: 'executed_at DESC',
    );
  }

  /// 期間内の実行記録を取得
  Future<List<Map<String, dynamic>>> getExecutionsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    final db = await _dbHelper.database;
    final startMillis = startDate.millisecondsSinceEpoch;
    final endMillis = endDate.millisecondsSinceEpoch;

    if (taskId != null) {
      return await db.query(
        DatabaseHelper.tableTaskExecution,
        where: 'task_id = ? AND executed_at BETWEEN ? AND ?',
        whereArgs: [taskId, startMillis, endMillis],
        orderBy: 'executed_at ASC',
      );
    } else {
      return await db.query(
        DatabaseHelper.tableTaskExecution,
        where: 'executed_at BETWEEN ? AND ?',
        whereArgs: [startMillis, endMillis],
        orderBy: 'executed_at ASC',
      );
    }
  }

  /// 実行記録を削除
  Future<void> deleteExecution(String id) async {
    final db = await _dbHelper.database;
    await db.delete(
      DatabaseHelper.tableTaskExecution,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 当日の実行記録を取得
  Future<Map<String, dynamic>?> getTodayExecution(String taskId) async {
    final db = await _dbHelper.database;
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final results = await db.query(
      DatabaseHelper.tableTaskExecution,
      where: 'task_id = ? AND executed_at BETWEEN ? AND ?',
      whereArgs: [
        taskId,
        startOfDay.millisecondsSinceEpoch,
        endOfDay.millisecondsSinceEpoch,
      ],
      limit: 1,
    );

    return results.isNotEmpty ? results.first : null;
  }

  /// タスクIDの全実行記録を削除（タスク削除時用）
  Future<void> deleteAllExecutionsByTaskId(String taskId) async {
    final db = await _dbHelper.database;
    await db.delete(
      DatabaseHelper.tableTaskExecution,
      where: 'task_id = ?',
      whereArgs: [taskId],
    );
  }

  /// 日付ごとの実行回数を計算
  Future<Map<String, int>> getExecutionCountByDate({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    final executions = await getExecutionsByDateRange(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );

    final Map<String, int> countMap = {};
    for (final execution in executions) {
      final executedAt = DateTime.fromMillisecondsSinceEpoch(
        execution['executed_at'] as int,
      );
      final dateKey =
          '${executedAt.year}-${executedAt.month.toString().padLeft(2, '0')}-${executedAt.day.toString().padLeft(2, '0')}';

      countMap[dateKey] = (countMap[dateKey] ?? 0) + 1;
    }

    return countMap;
  }

  /// 最新の実行記録を取得
  Future<Map<String, dynamic>?> getLatestExecution(String taskId) async {
    final db = await _dbHelper.database;
    final results = await db.query(
      DatabaseHelper.tableTaskExecution,
      where: 'task_id = ?',
      whereArgs: [taskId],
      orderBy: 'executed_at DESC',
      limit: 1,
    );

    return results.isNotEmpty ? results.first : null;
  }

  /// 指定期間のタスク実行回数を取得
  Future<int> getExecutionCountInRange({
    required String taskId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await _dbHelper.database;
    final startMillis = startDate.millisecondsSinceEpoch;
    final endMillis = endDate.millisecondsSinceEpoch;

    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${DatabaseHelper.tableTaskExecution} '
      'WHERE task_id = ? AND executed_at BETWEEN ? AND ?',
      [taskId, startMillis, endMillis],
    );

    return (result.first['count'] as int?) ?? 0;
  }
}
