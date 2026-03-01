// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_execution_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskExecutionListHash() => r'6ede3b312f457a66311d42f61a7a1a0d3ad06bcd';

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

/// See also [taskExecutionList].
@ProviderFor(taskExecutionList)
const taskExecutionListProvider = TaskExecutionListFamily();

/// See also [taskExecutionList].
class TaskExecutionListFamily extends Family<AsyncValue<List<TaskExecution>>> {
  /// See also [taskExecutionList].
  const TaskExecutionListFamily();

  /// See also [taskExecutionList].
  TaskExecutionListProvider call(String taskId) {
    return TaskExecutionListProvider(taskId);
  }

  @override
  TaskExecutionListProvider getProviderOverride(
    covariant TaskExecutionListProvider provider,
  ) {
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
  String? get name => r'taskExecutionListProvider';
}

/// See also [taskExecutionList].
class TaskExecutionListProvider
    extends AutoDisposeStreamProvider<List<TaskExecution>> {
  /// See also [taskExecutionList].
  TaskExecutionListProvider(String taskId)
    : this._internal(
        (ref) => taskExecutionList(ref as TaskExecutionListRef, taskId),
        from: taskExecutionListProvider,
        name: r'taskExecutionListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$taskExecutionListHash,
        dependencies: TaskExecutionListFamily._dependencies,
        allTransitiveDependencies:
            TaskExecutionListFamily._allTransitiveDependencies,
        taskId: taskId,
      );

  TaskExecutionListProvider._internal(
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
  Override overrideWith(
    Stream<List<TaskExecution>> Function(TaskExecutionListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TaskExecutionListProvider._internal(
        (ref) => create(ref as TaskExecutionListRef),
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
  AutoDisposeStreamProviderElement<List<TaskExecution>> createElement() {
    return _TaskExecutionListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TaskExecutionListProvider && other.taskId == taskId;
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
mixin TaskExecutionListRef
    on AutoDisposeStreamProviderRef<List<TaskExecution>> {
  /// The parameter `taskId` of this provider.
  String get taskId;
}

class _TaskExecutionListProviderElement
    extends AutoDisposeStreamProviderElement<List<TaskExecution>>
    with TaskExecutionListRef {
  _TaskExecutionListProviderElement(super.provider);

  @override
  String get taskId => (origin as TaskExecutionListProvider).taskId;
}

String _$taskExecutionNotifierHash() =>
    r'b82b6e016c48ce6addecad115b9e617024b2e3bd';

/// See also [TaskExecutionNotifier].
@ProviderFor(TaskExecutionNotifier)
final taskExecutionNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TaskExecutionNotifier, void>.internal(
      TaskExecutionNotifier.new,
      name: r'taskExecutionNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$taskExecutionNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TaskExecutionNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
