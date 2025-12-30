import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

/// タスクエンティティ
///
/// 習慣化アプリで管理するタスクを表すイミュータブルなエンティティです。
/// Freezedを使用して自動生成されるコードにより、
/// copyWithメソッドや等価性比較が提供されます。
@freezed
class Task with _$Task {
  const factory Task({
    /// タスクの一意識別子（UUID）
    required String id,

    /// タスク名（最大255文字）
    required String name,

    /// タスクのカラーコード（例: "#FF5733"）
    required String color,

    /// 作成日時
    required DateTime createdAt,

    /// 更新日時
    required DateTime updatedAt,

    /// 削除フラグ（論理削除用）
    @Default(false) bool isDeleted,
  }) = _Task;

  /// JSONからTaskインスタンスを生成
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

/// Taskエンティティの拡張メソッド
///
/// タスクの作成や更新を行うための便利メソッドを提供します。
extension TaskExtension on Task {
  /// 新規タスクを作成
  ///
  /// [name] タスク名
  /// [color] カラーコード（例: "#FF5733"）
  ///
  /// 戻り値: 新規作成されたTaskインスタンス
  /// - IDは自動生成（UUID v4）
  /// - createdAtとupdatedAtは現在時刻に設定
  static Task create({required String name, required String color}) {
    final now = DateTime.now();
    return Task(
      id: const Uuid().v4(),
      name: name,
      color: color,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// タスクを更新
  ///
  /// [name] 新しいタスク名（nullの場合は現在の値を維持）
  /// [color] 新しいカラーコード（nullの場合は現在の値を維持）
  ///
  /// 戻り値: 更新された新しいTaskインスタンス
  /// - updatedAtは自動的に現在時刻に更新される
  Task update({String? name, String? color}) {
    return copyWith(
      name: name ?? this.name,
      color: color ?? this.color,
      updatedAt: DateTime.now(),
    );
  }
}
