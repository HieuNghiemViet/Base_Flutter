import 'package:json_annotation/json_annotation.dart';

class DoubleConverter implements JsonConverter<double, String> {
  const DoubleConverter();

  @override
  double fromJson(String json) {
    return double.tryParse(json) ?? 0;
  }

  @override
  String toJson(double value) => value.toString();
}

class NullableDoubleConverter implements JsonConverter<double?, String?> {
  const NullableDoubleConverter();

  @override
  double? fromJson(String? json) {
    if (json == null) return null;
    return double.tryParse(json) ?? 0;
  }

  @override
  String? toJson(double? value) => value?.toString();
}
