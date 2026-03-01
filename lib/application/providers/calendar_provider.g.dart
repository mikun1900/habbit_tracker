// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarDataHash() => r'7c4ec65206f6a30a037f90b4b87fea4f7c0fb6c7';

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

abstract class _$CalendarData
    extends BuildlessAutoDisposeAsyncNotifier<Map<DateTime, int>> {
  late final DateTime startDate;
  late final DateTime endDate;
  late final String? taskId;

  FutureOr<Map<DateTime, int>> build({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  });
}

/// See also [CalendarData].
@ProviderFor(CalendarData)
const calendarDataProvider = CalendarDataFamily();

/// See also [CalendarData].
class CalendarDataFamily extends Family<AsyncValue<Map<DateTime, int>>> {
  /// See also [CalendarData].
  const CalendarDataFamily();

  /// See also [CalendarData].
  CalendarDataProvider call({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) {
    return CalendarDataProvider(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );
  }

  @override
  CalendarDataProvider getProviderOverride(
    covariant CalendarDataProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      taskId: provider.taskId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'calendarDataProvider';
}

/// See also [CalendarData].
class CalendarDataProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<CalendarData, Map<DateTime, int>> {
  /// See also [CalendarData].
  CalendarDataProvider({
    required DateTime startDate,
    required DateTime endDate,
    String? taskId,
  }) : this._internal(
         () => CalendarData()
           ..startDate = startDate
           ..endDate = endDate
           ..taskId = taskId,
         from: calendarDataProvider,
         name: r'calendarDataProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$calendarDataHash,
         dependencies: CalendarDataFamily._dependencies,
         allTransitiveDependencies:
             CalendarDataFamily._allTransitiveDependencies,
         startDate: startDate,
         endDate: endDate,
         taskId: taskId,
       );

  CalendarDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.taskId,
  }) : super.internal();

  final DateTime startDate;
  final DateTime endDate;
  final String? taskId;

  @override
  FutureOr<Map<DateTime, int>> runNotifierBuild(
    covariant CalendarData notifier,
  ) {
    return notifier.build(
      startDate: startDate,
      endDate: endDate,
      taskId: taskId,
    );
  }

  @override
  Override overrideWith(CalendarData Function() create) {
    return ProviderOverride(
      origin: this,
      override: CalendarDataProvider._internal(
        () => create()
          ..startDate = startDate
          ..endDate = endDate
          ..taskId = taskId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        taskId: taskId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CalendarData, Map<DateTime, int>>
  createElement() {
    return _CalendarDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarDataProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.taskId == taskId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, taskId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CalendarDataRef
    on AutoDisposeAsyncNotifierProviderRef<Map<DateTime, int>> {
  /// The parameter `startDate` of this provider.
  DateTime get startDate;

  /// The parameter `endDate` of this provider.
  DateTime get endDate;

  /// The parameter `taskId` of this provider.
  String? get taskId;
}

class _CalendarDataProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CalendarData,
          Map<DateTime, int>
        >
    with CalendarDataRef {
  _CalendarDataProviderElement(super.provider);

  @override
  DateTime get startDate => (origin as CalendarDataProvider).startDate;
  @override
  DateTime get endDate => (origin as CalendarDataProvider).endDate;
  @override
  String? get taskId => (origin as CalendarDataProvider).taskId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
