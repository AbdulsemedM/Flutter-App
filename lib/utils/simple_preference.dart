// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreferences {
  // late final Future<SharedPreferences> _preferences = SharedPreferences
  //     .getInstance(); // Use 'late' keyword for lazy initialization

  static late SharedPreferences _preferences;
  static late String _keyLanguage;
  static late String _keyUser;
  static late String _keyData;
  static late String _keyBronze;
  static late String _keySilver;
  static late String _keyGold;
  static late String _keyPlatinium;
  static late String _keyChallenge0;
  static late String _keyChallenge1;
  static late String _keyChallenge2;
  static late String _keyChallenge3;
  static late String _keyChallenge4;
  static late String _keyChallenge5;
  static late String _keyChallenge6;
  static late String _keyChallenge7;
  static late String _keyChallenge8;
  static late String _keyIsOn;

  static Future<SharedPreferences> init() async {
    // if (_preferences == null) {
    _preferences = await SharedPreferences.getInstance();
    _keyLanguage = 'language';
    _keyUser = "user_key";
    _keyData = "data_key";
    _keyBronze = "bronze_key";
    _keySilver = "silver_key";
    _keyGold = "gold_key";
    _keyPlatinium = "platinium_key";
    _keyChallenge0 = "challenge_key0";
    _keyChallenge1 = "challenge_key1";
    _keyChallenge2 = "challenge_key2";
    _keyChallenge3 = "challenge_key3";
    _keyChallenge4 = "challenge_key4";
    _keyChallenge5 = "challenge_key5";
    _keyChallenge6 = "challenge_key6";
    _keyChallenge7 = "challenge_key7";
    _keyChallenge8 = "challenge_key8";
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

  Future<void> setData(List<String> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(_keyData, data); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setData: $data");
    }
  }

  Future<void> setBronze(List<String> bronze) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyBronze, bronze); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setBronze: $bronze");
    }
  }

  Future<void> setSilver(List<String> silver) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keySilver, silver); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setSilver: $silver");
    }
  }

  Future<void> setGold(List<String> gold) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(_keyGold, gold); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setGold: $gold");
    }
  }

  Future<void> setPlatinium(List<String> platinium) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyPlatinium, platinium); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setPlatinium: $platinium");
    }
  }

  Future<void> setChallenge0(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge0, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge0: $challenge");
    }
  }

  Future<void> setChallenge1(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge1, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge1: $challenge");
    }
  }

  Future<void> setChallenge2(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge2, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge2: $challenge");
    }
  }

  Future<void> setChallenge3(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge3, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge3: $challenge");
    }
  }

  Future<void> setChallenge4(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge4, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge4: $challenge");
    }
  }

  Future<void> setChallenge5(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge5, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge5: $challenge");
    }
  }

  Future<void> setChallenge6(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge6, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge6: $challenge");
    }
  }

  Future<void> setChallenge7(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge7, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge7: $challenge");
    }
  }

  Future<void> setChallenge8(List<String> challenge) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        _keyChallenge8, challenge); // Note: <String> is not needed here
    if (kDebugMode) {
      print("setChallenge8: $challenge");
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

  Future<List?> getData() async {
    final SharedPreferences prefs = _preferences;

    final data = prefs.getStringList('data_key');
    if (kDebugMode) {
      print("getData: $data");
    }
    return data;
  }

  Future<List?> getChallenge0() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key0');
    if (kDebugMode) {
      print("getchallenge0: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge1() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key1');
    if (kDebugMode) {
      print("getchallenge1: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge2() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key2');
    if (kDebugMode) {
      print("getchallenge2: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge3() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key3');
    if (kDebugMode) {
      print("getchallenge3: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge4() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key4');
    if (kDebugMode) {
      print("getchallenge: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge5() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key5');
    if (kDebugMode) {
      print("getchallenge5: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge6() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key6');
    if (kDebugMode) {
      print("getchallenge6: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge7() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key7');
    if (kDebugMode) {
      print("getchallenge7: $challenge");
    }
    return challenge;
  }

  Future<List?> getChallenge8() async {
    final SharedPreferences prefs = _preferences;

    final challenge = prefs.getStringList('challenge_key8');
    if (kDebugMode) {
      print("getchallenge8: $challenge");
    }
    return challenge;
  }

  Future<List?> getBronze() async {
    final SharedPreferences prefs = _preferences;

    final bronze = prefs.getStringList('bronze_key');
    if (kDebugMode) {
      print("getbronze: $bronze");
    }
    return bronze;
  }

  Future<List?> getSilver() async {
    final SharedPreferences prefs = _preferences;

    final silver = prefs.getStringList('silver_key');
    if (kDebugMode) {
      print("getsilver: $silver");
    }
    return silver;
  }

  Future<List?> getGold() async {
    final SharedPreferences prefs = _preferences;

    final gold = prefs.getStringList('gold_key');
    if (kDebugMode) {
      print("getgold: $gold");
    }
    return gold;
  }

  Future<List?> getPlatinium() async {
    final SharedPreferences prefs = _preferences;

    final platinium = prefs.getStringList('platinium_key');
    if (kDebugMode) {
      print("getPlatinium: $platinium");
    }
    return platinium;
  }

  Future<String?> getIsOn() async {
    final SharedPreferences prefs = _preferences;

    final isOn = prefs.getString('dark');

    print("getLang: $isOn");
    return isOn;
  }

  // static init() {}
}
