import 'package:base_flutter/utils/date_util.dart';
import 'package:json_annotation/json_annotation.dart';

const serverDateTime = "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'";
const serverDate2 = "dd/MM/yyyy";

class DateConverter implements JsonConverter<DateTime, String> {
  final String format;

  const DateConverter({
    this.format = serverDateTime,
  });

  const DateConverter.format2({
    this.format = serverDate2,
  });

  @override
  DateTime fromJson(String json) {
    if (json.contains("Z")) {
      json = json.replaceAll(RegExp(r'\..\d+Z'), "Z");
    }
    return parseDate(json, format)!;
  }

  @override
  String toJson(DateTime date) => formatDate(date, format);
}

class NullableDateConverter implements JsonConverter<DateTime?, String?> {
  final String format;

  const NullableDateConverter({
    this.format = serverDateTime,
  });

  const NullableDateConverter.format2({
    this.format = serverDate2,
  });

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    if (json.contains("Z")) {
      json = json.replaceAll(RegExp(r'\..\d+Z'), "Z");
    }
    return parseDate(json, format)!;
  }

  @override
  String? toJson(DateTime? date) => formatDate(date, format);
}
