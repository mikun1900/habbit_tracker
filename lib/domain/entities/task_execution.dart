import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task_execution.freezed.dart';
part 'task_execution.g.dart';

/// タスク実行記録エンティティ
///
/// 習慣化アプリで管理するタスクの実行記録を表すイミュータブルなエンティティです。
/// Freezedを使用して自動生成されるコードにより、
/// copyWithメソッドや等価性比較が提供されます。
@freezed
class TaskExecution with _$TaskExecution {
  const factory TaskExecution({
    /// 実行記録の一意識別子（UUID）
    required String id,

    /// 関連するタスクのID
    required String taskId,

    /// タスクが実行された日時
    required DateTime executedAt,

    /// 記録が作成された日時
    required DateTime createdAt,
  }) = _TaskExecution;

  /// JSONからTaskExecutionインスタンスを生成
  factory TaskExecution.fromJson(Map<String, dynamic> json) =>
      _$TaskExecutionFromJson(json);
}

/// TaskExecutionエンティティの拡張メソッド
///
/// タスク実行記録の作成を行うための便利メソッドを提供します。
extension TaskExecutionExtension on TaskExecution {
  /// 新規タスク実行記録を作成
  ///
  /// [taskId] 実行されたタスクのID
  /// [executedAt] 実行日時（nullの場合は現在時刻）
  ///
  /// 戻り値: 新規作成されたTaskExecutionインスタンス
  /// - IDは自動生成（UUID v4）
  /// - executedAtが指定されない場合は現在時刻に設定
  /// - createdAtは現在時刻に設定
  static TaskExecution create({required String taskId, DateTime? executedAt}) {
    final now = DateTime.now();
    return TaskExecution(
      id: const Uuid().v4(),
      taskId: taskId,
      executedAt: executedAt ?? now,
      createdAt: now,
    );
  }
}
