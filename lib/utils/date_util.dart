import 'package:intl/intl.dart';

String formatDate(DateTime? date, String format) {
  if (date == null) return "";
  final dateFormat = DateFormat(format);
  return dateFormat.format(date);
}

DateTime? parseDate(String? strDate, String format, {bool utc = true}) {
  if (strDate == null) return null;
  try {
    return DateFormat(format).parse(strDate, utc).toLocal();
  } catch (e) {
    return null;
  }
}

DateTime startOfMonth(DateTime date, {bool utc = false}) {
  if (utc) {
    return DateTime.utc(date.year, date.month, 1);
  }
  return DateTime(date.year, date.month, 1);
}

DateTime endOfMonth(DateTime date, {bool utc = false}) {
  if (utc) {
    return DateTime.utc(date.year, date.month + 1, 0);
  }
  return DateTime(date.year, date.month + 1, 0);
}
