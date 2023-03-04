import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  bool sameDateTo(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  /// Compare month between date
  /// -1: current date is before month to targe date
  /// 0: current date same month to targe date
  /// 1: current date is future month to targe date
  int compareMonth(DateTime date) {
    if (year < date.year) {
      // before
      return -1;
    }
    if (year == date.year) {
      if (month < date.month) {
        return -1;
      } else if (month == date.month) {
        return 0;
      } else {
        return 1;
      }
    }
    return 1;
  }

  DateTime withoutDay() {
    return DateTime(year, month);
  }

  String dateTimeToString() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Get start of week is sunday
  DateTime startWeek() {
    if (weekday == DateTime.sunday) {
      return this;
    }
    final start = subtract(
      Duration(
        days: weekday,
      ),
    );
    return start;
  }

  /// Get end of week is saturday
  DateTime endWeek() {
    if (weekday == DateTime.sunday) {
      var end = add(
        const Duration(
          days: 6,
        ),
      );
      if (end.month != month) {
        end = nextMonth().subtract(const Duration(days: 1));
      }
      return end;
    }
    final end = add(
      Duration(
        days: DateTime.daysPerWeek - weekday - 1,
      ),
    );
    return end;
  }

  DateTime startMonth() {
    return DateTime(year, month, 1);
  }

  DateTime endMonth() {
    return nextMonth().subtract(const Duration(days: 1));
  }

  DateTime startYear() {
    return DateTime(year, 1, 1);
  }

  DateTime endYear() {
    return nextYear().subtract(const Duration(days: 1));
  }

  DateTime lastMonth() {
    return DateTime(year, month - 1, 1);
  }

  DateTime nextMonth() {
    return DateTime(year, month + 1, 1);
  }

  DateTime lastYear() {
    return DateTime(year - 1, 1, 1);
  }

  DateTime nextYear() {
    return DateTime(year + 1, 1, 1);
  }

  int get totalWeekMonth {
    final date = this;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth =
        DateTime(date.year, date.month + 1).subtract(const Duration(days: 1));
    final endOfFirstWeek = firstDayOfMonth.endWeek();
    final startOfLastWeek = lastDayOfMonth.startWeek();
    final rangeOfDate = startOfLastWeek.day - endOfFirstWeek.day;
    return (rangeOfDate ~/ 7) + 2;
  }

  /// return the no of week in month
  int get weekInMonth {
    final date = this;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth =
        DateTime(date.year, date.month + 1).subtract(const Duration(days: 1));
    final endOfFirstWeek = firstDayOfMonth.endWeek();
    if (date.day <= endOfFirstWeek.day) {
      return 1;
    } else if (date.day >= lastDayOfMonth.day) {
      return totalWeekMonth;
    } else {
      final rangeOfDate = date.day - endOfFirstWeek.day;
      var week = 1; // add 1 for first week;
      week += rangeOfDate ~/ 7;
      if (rangeOfDate % 7 > 0) {
        week += 1;
      }
      return week;
    }
  }

  DateTime startOfDate() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  DateTime endOfDate() {
    return DateTime(year, month, day, 23, 59, 59);
  }
}
