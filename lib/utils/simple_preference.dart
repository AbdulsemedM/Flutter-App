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

  // Future<void> setBronze(List<String> bronze) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setStringList(
  //       _keyBronze, bronze); // Note: <String> is not needed here
  //   if (kDebugMode) {
  //     print("setBronze: $bronze");
  //   }
  // }

  // Future<void> setSilver(List<String> silver) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setStringList(
  //       _keySilver, silver); // Note: <String> is not needed here
  //   if (kDebugMode) {
  //     print("setSilver: $silver");
  //   }
  // }

  // Future<void> setGold(List<String> gold) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setStringList(_keyGold, gold); // Note: <String> is not needed here
  //   if (kDebugMode) {
  //     print("setGold: $gold");
  //   }
  // }

  // Future<void> setPlatinium(List<String> platinium) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setStringList(
  //       _keyPlatinium, platinium); // Note: <String> is not needed here
  //   if (kDebugMode) {
  //     print("setPlatinium: $platinium");
  //   }
  // }

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

  // Future<List?> getBronze() async {
  //   final SharedPreferences prefs = _preferences;

  //   final bronze = prefs.getStringList('bronze_key');
  //   if (kDebugMode) {
  //     print("getbronze: $bronze");
  //   }
  //   return bronze;
  // }

  // Future<List?> getSilver() async {
  //   final SharedPreferences prefs = _preferences;

  //   final silver = prefs.getStringList('silver_key');
  //   if (kDebugMode) {
  //     print("getsilver: $silver");
  //   }
  //   return silver;
  // }

  // Future<List?> getGold() async {
  //   final SharedPreferences prefs = _preferences;

  //   final gold = prefs.getStringList('gold_key');
  //   if (kDebugMode) {
  //     print("getgold: $gold");
  //   }
  //   return gold;
  // }

  // Future<List?> getPlatinium() async {
  //   final SharedPreferences prefs = _preferences;

  //   final platinium = prefs.getStringList('platinium_key');
  //   if (kDebugMode) {
  //     print("getPlatinium: $platinium");
  //   }
  //   return platinium;
  // }

  Future<String?> getIsOn() async {
    final SharedPreferences prefs = _preferences;

    final isOn = prefs.getString('dark');

    print("getLang: $isOn");
    return isOn;
  }

  // static init() {}
}
