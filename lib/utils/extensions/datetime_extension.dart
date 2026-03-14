extension DateTimeExtension on DateTime {
  /// 日付を正規化して時間を00:00:00にする
  DateTime get normalized {
    return DateTime(year, month, day);
  }

  /// 指定されたDateTimeと同日かどうかをチェックする
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
