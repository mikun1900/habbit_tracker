import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskFormScreen extends ConsumerWidget {
  const TaskFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('タスク登録・編集')),
      body: const Center(child: Text('タスクフォームがここに表示されます')),
    );
  }
}
