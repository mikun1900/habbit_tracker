import 'package:flutter/material.dart';

class CalendarColorCalculator {
  static Color getColorForCount(int count, Color baseColor) {
    if (count == 0) {
      return Colors.grey[300]!;
    } else if (count == 1) {
      return baseColor.withOpacity(0.3);
    } else if (count == 2) {
      return baseColor.withOpacity(0.6);
    } else {
      return baseColor;
    }
  }
}
