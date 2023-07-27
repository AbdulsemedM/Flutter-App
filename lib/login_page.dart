// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

// import 'package:cooplay/Forgot_pw.dart';
// import 'package:cooplay/Signup.dart';
// import 'package:cooplay/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loyalty_app/Forgot_pw.dart';
import 'package:loyalty_app/HomePage.dart';
import 'package:loyalty_app/Signup.dart';
import 'package:loyalty_app/colors.dart';
// import 'package:protest/tabs/Home.dart';
import 'package:get/get.dart';
// import 'package:protest/LocalString.dart';

// ignore: camel_case_types
class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

// ignore: camel_case_types
class _Login_pageState extends State<Login_page> {
  bool _passwordVisible = false;
  DateTime timeBackPressed = DateTime.now();
  TextEditingController pnumber = TextEditingController();
  TextEditingController password = TextEditingController();

  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Afaan Oromoo', 'locale': Locale('or', 'ET')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
    {'name': 'Somali', 'locale': Locale('en', 'US')},
  ];

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          // ignore: avoid_print
                          print(locale[index]['locale']);
                          updateLanguage(locale[index]['locale']);
                          // await prefs.setBool('repeat', true);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors_selector.primmary1,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  updateLanguage(Locale locale) async {
    Get.back();
    Get.updateLocale(locale);
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          const message = 'press again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();
          return exit(0);
        }
      },
      child: Scaffold(
        // backgroundColor: Colors.cyan,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors_selector.pair1,
                      Colors_selector.pair2,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          buildLanguageDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text("Languages".tr),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Center(
                        child: Image.asset(
                          'assets/images/Cap.png',
                          height: screenHeight * 0.3,
                          width: screenWidth * 0.6,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Login".tr,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors_selector
                              .primmary1, // You can use your color here
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // You can use your color here
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              controller: pnumber,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_android),
                                border: InputBorder.none,
                                labelText: "Phone Number".tr,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // You can use your color here
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              controller: password,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors_selector.primmary1,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                border: InputBorder.none,
                                labelText: "Password".tr,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Forgot_pw(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot".tr,
                                style: TextStyle(
                                  color: Colors_selector
                                      .secondaryColor, // You can use your color here
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3,
                          vertical: screenHeight * 0.02,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(screenHeight * 0.01),
                            decoration: BoxDecoration(
                              color: Colors_selector
                                  .primmary1, // You can use your color here
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Login".tr,
                                style: TextStyle(
                                  color: Colors
                                      .white, // You can use your color here
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // _isLoading
                      //     ? CircularProgressIndicator(
                      //         color: Colors.white, // You can use your color here
                      //       )
                      //     : SizedBox(),
                      SizedBox(height: screenHeight * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Row(
                          children: [
                            Text(
                              "Don't have an account? ".tr,
                              style: TextStyle(
                                color:
                                    Colors.black, // You can use your color here
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                              child: Text(
                                "Signup here".tr,
                                style: TextStyle(
                                  color: Colors_selector
                                      .primmary1, // You can use your color here
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.08),
                      Text(
                        "copyright 1894-2023 © Coop Bank of Oromia",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text("All Rights Reserved"),
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
