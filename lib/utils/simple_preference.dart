import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  // late final Future<SharedPreferences> _preferences = SharedPreferences
  //     .getInstance(); // Use 'late' keyword for lazy initialization

  static late SharedPreferences _preferences;
  static late String _keyLanguage;
  static late String isOn;

  static Future<SharedPreferences> init() async {
    // if (_preferences == null) {
    _preferences = await SharedPreferences.getInstance();
    _keyLanguage = 'language';
    isOn = "false";
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

  Future<String?> getLanguage() async {
    final SharedPreferences prefs = await _preferences;

    final language = prefs.getString('language');
    if (kDebugMode) {
      print("getLang: $language");
    }
    return language;
  }

  Future<void> setIsOn(String isOn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isOn == "true") {
      prefs.setString(isOn, "true");
    } else {
      prefs.setString(isOn, "false");
    }
    if (kDebugMode) {
      print("setIsOn: $isOn");
    }
  }

  Future<String?> getIsOn() async {
    final SharedPreferences prefs = await _preferences;

    final isOn = prefs.getString('isOn');
    if (kDebugMode) {
      print("getLang: $isOn");
    }
    return isOn;
  }

  // static init() {}
}
