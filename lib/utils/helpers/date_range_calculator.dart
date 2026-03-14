class DateRangeCalculator {
  static DateTime getStartDate(int monthsAgo) {
    final now = DateTime.now();
    return DateTime(now.year, now.month - monthsAgo, now.day);
  }

  static int getDayCount(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }
}
