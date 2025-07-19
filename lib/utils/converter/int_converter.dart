import 'package:json_annotation/json_annotation.dart';

class IntConverter implements JsonConverter<int, String> {
  const IntConverter();

  @override
  int fromJson(String json) {
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int value) => value.toString();
}

class NullableIntConverter implements JsonConverter<int?, String?> {
  const NullableIntConverter();

  @override
  int? fromJson(String? json) {
    if (json == null) return null;
    return int.tryParse(json) ?? 0;
  }

  @override
  String? toJson(int? value) => value?.toString();
}
