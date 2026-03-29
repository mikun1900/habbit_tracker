import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:habbit_tracker/domain/entities/task.dart';

class TaskCard extends ConsumerWidget {
  final Task task;
  final VoidCallback onTap;
  final VoidCallback onExecute;

  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
    required this.onExecute,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(int.parse(task.color.replaceFirst('#', '0xff'))),
            shape: BoxShape.circle,
          ),
        ),
        title: Text(task.name),
        subtitle: Text(
          '作成日: ${DateFormat('yyyy/MM/dd').format(task.createdAt)}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle_outline),
          onPressed: onExecute,
        ),
        onTap: onTap,
      ),
    );
  }
}
