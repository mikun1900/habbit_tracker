import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/task_execution.dart';
import '../../domain/repositories/task_execution_repository.dart';

part 'task_execution_provider.g.dart';

@riverpod
Stream<List<TaskExecution>> taskExecutionList(
  TaskExecutionListRef ref,
  String taskId,
) {
  final repository = ref.watch(taskExecutionRepositoryProvider);
  return repository.watchExecutionsByTaskId(taskId);
}

@riverpod
class TaskExecutionNotifier extends _$TaskExecutionNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addExecution({
    required String taskId,
    DateTime? executedAt,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(taskExecutionRepositoryProvider);
      final execution = TaskExecutionExtension.create(
        taskId: taskId,
        executedAt: executedAt,
      );
      return await repository.createExecution(execution);
    });
  }

  Future<void> removeExecution(String executionId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(taskExecutionRepositoryProvider);
      await repository.deleteExecution(executionId);
    });
  }

  Future<bool> canExecuteToday(String taskId) async {
    final repository = ref.read(taskExecutionRepositoryProvider);
    final todayExecution = await repository.getTodayExecution(taskId);
    return todayExecution == null;
  }
}
