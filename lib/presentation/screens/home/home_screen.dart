import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habbit_tracker/presentation/widgets/task_card.dart';

// TODO: 実際のプロバイダーをインポート
// import 'package:habit_tracker/application/providers/task_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 実際のプロバイダーを使用
    // final taskListAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Habit Tracker')),
      body: const Center(child: Text('タスク一覧がここに表示されます')),
      // TODO: 実際のFABを実装
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: タスク追加画面に遷移
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
