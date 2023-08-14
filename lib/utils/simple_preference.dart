// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  // late final Future<SharedPreferences> _preferences = SharedPreferences
  //     .getInstance(); // Use 'late' keyword for lazy initialization

  static late SharedPreferences _preferences;
  static late String _keyLanguage;
  static late String _keyUser;
  static late String _keyIsOn;

  static Future<SharedPreferences> init() async {
    // if (_preferences == null) {
    _preferences = await SharedPreferences.getInstance();
    _keyLanguage = 'language';
    _keyUser = "user_key";
    _keyIsOn = "dark";
    // }
    return _preferences;
  }

  Future<void> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(_keyLanguage, language);
    if (kDebugMode) {
      print("setLang: $language");
    }
  }

  Future<void> setUser(List<String> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(_keyUser, user); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setUser: $user");
    }
  }

  Future<void> setIsOn(String isOn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyIsOn, isOn);

    print("setIsOn: $isOn");
  }

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await _preferences;

    final language = prefs.getString('language');
    if (kDebugMode) {
      print("getLang: $language");
    }
    return language;
  }

  Future<List?> getUser() async {
    final SharedPreferences prefs = _preferences;

    final user = prefs.getStringList('user_key');
    if (kDebugMode) {
      print("getUser: $user");
    }
    return user;
  }

  Future<String?> getIsOn() async {
    final SharedPreferences prefs = _preferences;

    final isOn = prefs.getString('dark');

    print("getLang: $isOn");
    return isOn;
  }

  // static init() {}
}
