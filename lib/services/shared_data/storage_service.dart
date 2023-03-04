import 'package:shared_preferences/shared_preferences.dart';

enum _StorageKey {
  token,
}

class StorageService {
  late SharedPreferences _prefs;
  static final StorageService _service = StorageService._internal();

  StorageService._internal();

  factory StorageService() => _service;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set saveToken(String value) {
    _prefs.setString(_StorageKey.token.name, value);
  }

  String? get token => _prefs.getString(_StorageKey.token.name);

  Future<bool> get deleteToken => _prefs.remove(_StorageKey.token.name);

  void clear() {
    _prefs.remove(_StorageKey.token.name);
  }
}
