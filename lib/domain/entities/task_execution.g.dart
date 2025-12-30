// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_execution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskExecutionImpl _$$TaskExecutionImplFromJson(Map<String, dynamic> json) =>
    _$TaskExecutionImpl(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      executedAt: DateTime.parse(json['executedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TaskExecutionImplToJson(_$TaskExecutionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'executedAt': instance.executedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
