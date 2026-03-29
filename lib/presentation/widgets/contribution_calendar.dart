import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContributionCalendar extends StatelessWidget {
  final Map<DateTime, int> executionData;
  final Color taskColor;
  final DateTime startDate;
  final DateTime endDate;

  const ContributionCalendar({
    super.key,
    required this.executionData,
    required this.taskColor,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7, // 1週間
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: _calculateDayCount(),
      itemBuilder: (context, index) {
        final date = startDate.add(Duration(days: index));
        final count = executionData[_normalizeDate(date)] ?? 0;

        return GestureDetector(
          onTap: () => _showDayDetail(context, date, count),
          child: Container(
            decoration: BoxDecoration(
              color: _getColorForCount(count),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  fontSize: 10,
                  color: count > 0 ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  int _calculateDayCount() {
    return endDate.difference(startDate).inDays + 1;
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Color _getColorForCount(int count) {
    if (count == 0) return Colors.grey[300]!;
    if (count == 1) return taskColor.withOpacity(0.3);
    if (count == 2) return taskColor.withOpacity(0.6);
    return taskColor;
  }

  void _showDayDetail(BuildContext context, DateTime date, int count) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(DateFormat('yyyy年M月d日').format(date)),
        content: Text('実行回数: $count回'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('閉じる'),
          ),
        ],
      ),
    );
  }
}
