import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/task_execution_repository.dart';

part 'calendar_provider.g.dart';

@riverpod
class CalendarData extends _$CalendarData {
  @override
  Future<Map<DateTime, int>> build({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    final repository = ref.watch(taskExecutionRepositoryProvider);
    return await repository.getExecutionCountByDate(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );
  }

  // 期間を変更して再読み込み
  Future<void> changeDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.watch(taskExecutionRepositoryProvider);
      return await repository.getExecutionCountByDate(
        startDate: startDate,
        endDate: endDate,
        taskId: taskId,
      );
    });
  }
}
