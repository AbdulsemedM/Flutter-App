import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  static late SharedPreferences
      _preferences; // Use 'late' keyword for lazy initialization
  static const _keyLanguage = 'language';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLanguage(String language) async {
    await _preferences.setString(_keyLanguage, language);
  }

  static String? getLanguage() {
    return _preferences.getString(_keyLanguage);
  }
}
