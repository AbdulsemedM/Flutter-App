import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/simple_preference.dart';

class Colors_selector {
  String? dark;

  Colors_selector() {
    initializeColor();
  }

  Future<void> initializeColor() async {
    dark = await SimplePreferences().getIsOn();
  }

  static var primaryColor = Colors.lightBlue[400];
  static Color primmary1 = const Color(0xFF08B1F0);
  static Color secondaryColor = Colors.orange;
  static Color tertiaryColor = Colors.white;
  static Color pair1 = const Color(0xffe0f7fa);
  static Color pair2 = const Color(0xffe1f5fe);
  static Color pair3 = const Color.fromARGB(255, 47, 52, 52);
  static Color pair4 = Color.fromARGB(255, 3, 3, 3);
  static Color grey = Colors.grey;

  // Color? get primaryColorValue {
  //   return dark == "false" ? Color(0xFF08B1F0) : primaryColor;
  // }

  // Color? get primary1Value {
  //   return dark == "false" ? Color(0xFF08B1F0) : primaryColor;
  // }

  // Color? get secondaryColorValue {
  //   return dark == "false" ? Colors.orange : primaryColor;
  // }

  // Color? get pair1Value {
  //   return dark == "false"
  //       ? Color(0xffe0f7fa)
  //       : Color.fromARGB(255, 47, 52, 52);
  // }

  // Color? get pair2Value {
  //   return dark == "false" ? Color(0xffe1f5fe) : Color.fromARGB(255, 3, 3, 3);
  // }
}
