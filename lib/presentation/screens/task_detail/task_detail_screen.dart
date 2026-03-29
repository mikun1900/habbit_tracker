import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskDetailScreen extends ConsumerWidget {
  final String taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('タスク詳細')),
      body: Center(child: Text('タスクID: $taskId の詳細がここに表示されます')),
    );
  }
}
