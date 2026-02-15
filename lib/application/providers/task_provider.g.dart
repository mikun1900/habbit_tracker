// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListHash() => r'9492d430f74ff0b361f40750ffe13d4c953e4f59';

/// タスク一覧のStreamProvider
///
/// すべてのタスク（削除されていないもの）を監視します。
/// タスクが追加・更新・削除されると自動的に再読み込みされます。
///
/// Copied from [taskList].
@ProviderFor(taskList)
final taskListProvider = AutoDisposeStreamProvider<List<Task>>.internal(
  taskList,
  name: r'taskListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskListRef = AutoDisposeStreamProviderRef<List<Task>>;
String _$taskHash() => r'2b6cf381e6cb6d214798ea4038976b86b584c5f6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 特定タスクのFutureProvider
///
/// 指定されたIDのタスクを非同期で取得します。
/// 実行されたことがない場合や削除済みの場合はnullを返します。
///
/// Copied from [task].
@ProviderFor(task)
const taskProvider = TaskFamily();

/// 特定タスクのFutureProvider
///
/// 指定されたIDのタスクを非同期で取得します。
/// 実行されたことがない場合や削除済みの場合はnullを返します。
///
/// Copied from [task].
class TaskFamily extends Family<AsyncValue<Task?>> {
  /// 特定タスクのFutureProvider
  ///
  /// 指定されたIDのタスクを非同期で取得します。
  /// 実行されたことがない場合や削除済みの場合はnullを返します。
  ///
  /// Copied from [task].
  const TaskFamily();

  /// 特定タスクのFutureProvider
  ///
  /// 指定されたIDのタスクを非同期で取得します。
  /// 実行されたことがない場合や削除済みの場合はnullを返します。
  ///
  /// Copied from [task].
  TaskProvider call(String taskId) {
    return TaskProvider(taskId);
  }

  @override
  TaskProvider getProviderOverride(covariant TaskProvider provider) {
    return call(provider.taskId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskProvider';
}

/// 特定タスクのFutureProvider
///
/// 指定されたIDのタスクを非同期で取得します。
/// 実行されたことがない場合や削除済みの場合はnullを返します。
///
/// Copied from [task].
class TaskProvider extends AutoDisposeFutureProvider<Task?> {
  /// 特定タスクのFutureProvider
  ///
  /// 指定されたIDのタスクを非同期で取得します。
  /// 実行されたことがない場合や削除済みの場合はnullを返します。
  ///
  /// Copied from [task].
  TaskProvider(String taskId)
    : this._internal(
        (ref) => task(ref as TaskRef, taskId),
        from: taskProvider,
        name: r'taskProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$taskHash,
        dependencies: TaskFamily._dependencies,
        allTransitiveDependencies: TaskFamily._allTransitiveDependencies,
        taskId: taskId,
      );

  TaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.taskId,
  }) : super.internal();

  final String taskId;

  @override
  Override overrideWith(FutureOr<Task?> Function(TaskRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: TaskProvider._internal(
        (ref) => create(ref as TaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Task?> createElement() {
    return _TaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskProvider && other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TaskRef on AutoDisposeFutureProviderRef<Task?> {
  /// The parameter `taskId` of this provider.
  String get taskId;
}

class _TaskProviderElement extends AutoDisposeFutureProviderElement<Task?>
    with TaskRef {
  _TaskProviderElement(super.provider);

  @override
  String get taskId => (origin as TaskProvider).taskId;
}

String _$taskNotifierHash() => r'c775e413942df26e8216f53a1b059bd3fb8b1345';

/// タスクCRUD用Notifier
///
/// タスクの作成、更新、削除をサポートしています。
///
/// Copied from [TaskNotifier].
@ProviderFor(TaskNotifier)
final taskNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TaskNotifier, void>.internal(
      TaskNotifier.new,
      name: r'taskNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
