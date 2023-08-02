// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/Forgot_pw.dart';
import 'package:loyalty_app/Settings/About_us.dart';
import 'package:loyalty_app/Settings/PaS.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:get/get.dart';
// import 'package:loyalty_app/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../utils/simple_preference.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with WidgetsBindingObserver {
  String? isOn;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkDarkMode();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkDarkMode();
    }
  }

  // ignore: non_constant_identifier_names
  Future<bool?> _checkDarkMode() async {
    isOn = await SimplePreferences().getIsOn();
    if (isOn == "true") {
      setState(() {});
      return true;
    } else {
      setState(() {});
      return false;
    }
  }

  checkDarkMode() {
    print("${isOn!}here");
    if (isOn == "true") {
      setState(() {
        Colors_selector.pair1 = Color(0xff546e7a);
        Colors_selector.pair2 = Color(0xff546e7a);
        Colors_selector.primaryColor = Colors.lightBlue[400];
        Colors_selector.primmary1 = Color(0xFF08B1F0);
      });
    } else {
      setState(() {
        Colors_selector.pair1 = Color(0xffe0f7fa);
        Colors_selector.pair2 = Color(0xffe1f5fe);
        Colors_selector.primaryColor = Colors.lightBlue[400];
        Colors_selector.primmary1 = Color(0xFF08B1F0);
      });
    }
  }

  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Afaan Oromoo', 'locale': Locale('or', 'ET')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
    {'name': 'Somali', 'locale': Locale('en', 'US')},
  ];
  updateLanguage(Locale locale) async {
    Get.back();
    Get.updateLocale(locale);
    // await SimplePreferences.setLanguage(locale as String);

    // final SharedPreferences prefs = await _prefs;
    // if (locale == 'am_Et') {
    //   await prefs.setBool('isAmharic', true);
    //   await prefs.setBool('isOromiffa', false);
    // }
    // if (locale == 'en_US') {
    //   await prefs.setBool('isAmharic', false);
    //   await prefs.setBool('isOromiffa', false);
    // }
    // if (locale == 'or_ET') {
    //   await prefs.setBool('isAmharic', false);
    //   await prefs.setBool('isOromiffa', true);
    // }
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            backgroundColor: Colors_selector.pair2,
            title: Text('Choose Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () async {
                          String selectedLocale = locale[index]['name'];
                          print(selectedLocale);
                          SimplePreferences preferences = SimplePreferences();
                          await preferences.setLanguage(selectedLocale);
                          updateLanguage(locale[index]['locale']);

                          // await prefs.setBool('repeat', true);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors_selector.secondaryColor,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors_selector.pair1, Colors_selector.pair2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("General".tr,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
              ),
              // SizedBox(height: 10),
              Card(
                  color: Colors_selector.pair1,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Card(
                        color: Colors_selector.pair1,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Prisec()),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            // side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // tileColor: Colors.orangeAccent,
                          title: Text("Privacy and Security".tr),
                          leading: Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors_selector.secondaryColor,
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 5,
                        height: 1,
                        color: Colors_selector.grey,
                      ),
                      Card(
                        color: Colors_selector.pair1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => About_us()),
                            );
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              // side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // hoverColor: Colors.orange[700],
                            // selectedColor: Colors.orange[700],
                            // tileColor: Colors.orangeAccent,
                            title: Text("About Us".tr),
                            leading: Icon(
                              Icons.people,
                              color: Colors_selector.secondaryColor,
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 5,
                        height: 1,
                        color: Colors_selector.grey,
                      ),
                      Card(
                        color: Colors_selector.pair1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgot_pw()),
                            );
                          },
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              // side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // hoverColor: Colors.orange[700],
                            // selectedColor: Colors.orange[700],
                            // tileColor: Colors.orangeAccent,
                            title: Text("Change Password".tr),
                            leading: Icon(
                              Icons.lock_outline,
                              color: Colors_selector.secondaryColor,
                            ),
                            trailing: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 5,
                        height: 1,
                        color: Colors_selector.grey,
                      ),
                      Card(
                        color: Colors_selector.pair1,
                        child: GestureDetector(
                          onTap: (() {
                            buildLanguageDialog(context);
                          }),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              // side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // tileColor: Colors.orangeAccent,
                            title: Text("Change Language".tr),
                            leading: Icon(
                              FontAwesomeIcons.language,
                              color: Colors_selector.secondaryColor,
                            ),
                            trailing: Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 5,
                        height: 1,
                        color: Colors_selector.grey,
                      ),
                      Card(
                        color: Colors_selector.pair1,
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            //<-- SEE HERE
                            // side: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // tileColor: Colors.orangeAccent,
                          title: Text("Change Location".tr),
                          leading: Icon(
                            Icons.location_on,
                            color: Colors_selector.secondaryColor,
                          ),
                          trailing: Icon(Icons.edit),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 5,
                        height: 1,
                        color: Colors_selector.grey,
                      ),
                      Card(
                        color: Colors_selector.pair1,
                        child: GestureDetector(
                          onTap: (() => _onBackButtonPressed(context)),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              //<-- SEE HERE
                              // side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // tileColor: Colors.orangeAccent,
                            title: Text("Logout".tr),
                            leading: Icon(
                              Icons.login_outlined,
                              color: Colors_selector.secondaryColor,
                            ),
                            // trailing: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("More".tr,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                    secondary: Icon(
                      Icons.dark_mode,
                      color: Colors_selector.secondaryColor,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 7, 4),
                    title: Text(
                      "Dark Theme".tr,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    value: isOn == "true" ? true : false,
                    onChanged: (bool value) async {
                      setState(() {
                        isOn = value == true ? "true" : "false";
                        checkDarkMode();
                      });
                      SimplePreferences preferences = SimplePreferences();
                      await preferences.setIsOn(isOn!);

                      // isOn = !isOn;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors_selector.primaryColor,
                  title: Text("Report Bug".tr),

                  leading: Icon(
                    // Icons.bug_report_outlined
                    FontAwesomeIcons.message,
                    color: Colors_selector.secondaryColor,
                  ),

                  // trailing: Icon(Icons.edit),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors_selector.primaryColor,
                  title: Text("Send Feedback".tr),
                  leading: Icon(
                    Icons.feedback_outlined,
                    color: Colors_selector.secondaryColor,
                  ),

                  // trailing: Icon(Icons.edit),
                ),
              ),
            ],
          )),
    ));
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors_selector.pair2,
            title: Text("Confirm Exit".tr),
            content: Text("Do you want to Logout?".tr),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No".tr)),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Login_page(),
                      ),
                    );
                  },
                  child: Text(
                    "Yes".tr,
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
    // return exitapp ?? false;
  }
}
