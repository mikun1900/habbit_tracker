// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_execution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TaskExecution _$TaskExecutionFromJson(Map<String, dynamic> json) {
  return _TaskExecution.fromJson(json);
}

/// @nodoc
mixin _$TaskExecution {
  /// 実行記録の一意識別子（UUID）
  String get id => throw _privateConstructorUsedError;

  /// 関連するタスクのID
  String get taskId => throw _privateConstructorUsedError;

  /// タスクが実行された日時
  DateTime get executedAt => throw _privateConstructorUsedError;

  /// 記録が作成された日時
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TaskExecution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskExecution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskExecutionCopyWith<TaskExecution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskExecutionCopyWith<$Res> {
  factory $TaskExecutionCopyWith(
    TaskExecution value,
    $Res Function(TaskExecution) then,
  ) = _$TaskExecutionCopyWithImpl<$Res, TaskExecution>;
  @useResult
  $Res call({
    String id,
    String taskId,
    DateTime executedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class _$TaskExecutionCopyWithImpl<$Res, $Val extends TaskExecution>
    implements $TaskExecutionCopyWith<$Res> {
  _$TaskExecutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskExecution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? executedAt = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            taskId: null == taskId
                ? _value.taskId
                : taskId // ignore: cast_nullable_to_non_nullable
                      as String,
            executedAt: null == executedAt
                ? _value.executedAt
                : executedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskExecutionImplCopyWith<$Res>
    implements $TaskExecutionCopyWith<$Res> {
  factory _$$TaskExecutionImplCopyWith(
    _$TaskExecutionImpl value,
    $Res Function(_$TaskExecutionImpl) then,
  ) = __$$TaskExecutionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String taskId,
    DateTime executedAt,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$TaskExecutionImplCopyWithImpl<$Res>
    extends _$TaskExecutionCopyWithImpl<$Res, _$TaskExecutionImpl>
    implements _$$TaskExecutionImplCopyWith<$Res> {
  __$$TaskExecutionImplCopyWithImpl(
    _$TaskExecutionImpl _value,
    $Res Function(_$TaskExecutionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskExecution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? executedAt = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$TaskExecutionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        taskId: null == taskId
            ? _value.taskId
            : taskId // ignore: cast_nullable_to_non_nullable
                  as String,
        executedAt: null == executedAt
            ? _value.executedAt
            : executedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskExecutionImpl implements _TaskExecution {
  const _$TaskExecutionImpl({
    required this.id,
    required this.taskId,
    required this.executedAt,
    required this.createdAt,
  });

  factory _$TaskExecutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskExecutionImplFromJson(json);

  /// 実行記録の一意識別子（UUID）
  @override
  final String id;

  /// 関連するタスクのID
  @override
  final String taskId;

  /// タスクが実行された日時
  @override
  final DateTime executedAt;

  /// 記録が作成された日時
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TaskExecution(id: $id, taskId: $taskId, executedAt: $executedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskExecutionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.executedAt, executedAt) ||
                other.executedAt == executedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, taskId, executedAt, createdAt);

  /// Create a copy of TaskExecution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskExecutionImplCopyWith<_$TaskExecutionImpl> get copyWith =>
      __$$TaskExecutionImplCopyWithImpl<_$TaskExecutionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskExecutionImplToJson(this);
  }
}

abstract class _TaskExecution implements TaskExecution {
  const factory _TaskExecution({
    required final String id,
    required final String taskId,
    required final DateTime executedAt,
    required final DateTime createdAt,
  }) = _$TaskExecutionImpl;

  factory _TaskExecution.fromJson(Map<String, dynamic> json) =
      _$TaskExecutionImpl.fromJson;

  /// 実行記録の一意識別子（UUID）
  @override
  String get id;

  /// 関連するタスクのID
  @override
  String get taskId;

  /// タスクが実行された日時
  @override
  DateTime get executedAt;

  /// 記録が作成された日時
  @override
  DateTime get createdAt;

  /// Create a copy of TaskExecution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskExecutionImplCopyWith<_$TaskExecutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
