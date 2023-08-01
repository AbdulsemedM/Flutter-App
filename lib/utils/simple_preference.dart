import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  final Future<SharedPreferences> _preferences = SharedPreferences
      .getInstance(); // Use 'late' keyword for lazy initialization
  static const _keyLanguage = 'language';

  //  Future init() async {
  //   _preferences = await SharedPreferences.getInstance();
  // }

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await _preferences;

    await prefs.setString(_keyLanguage, language);
    if (kDebugMode) {
      print("setLang: $language");
    }
  }

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await _preferences;

    final language = prefs.getString(_keyLanguage);
    if (kDebugMode) {
      print("getLang: $language");
    }
    return language;
  }

  static init() {}
}
