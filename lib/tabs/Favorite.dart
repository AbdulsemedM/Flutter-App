// import 'dart:ffi';

import 'package:android_play_install_referrer/android_play_install_referrer.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launch_review/launch_review.dart';
import 'package:loyalty_app/Forgot_pw.dart';
import 'package:loyalty_app/Settings/About_us.dart';
import 'package:loyalty_app/Settings/PaS.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
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
    _checkDarkMode();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // _checkDarkMode();
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> _checkDarkMode() async {
    isOn = await SimplePreferences().getIsOn();
    print(isOn);
  }

  // checkDarkMode() {
  //   print("${isOn!}here");
  //   if (isOn == "true") {
  //     setState(() {
  //       Colors_selector.pair1 = Color(0xff546e7a);
  //       Colors_selector.pair2 = Color(0xff546e7a);
  //       Colors_selector.primaryColor = Colors.lightBlue[400];
  //       Colors_selector.primmary1 = Color(0xFF08B1F0);
  //     });
  //   } else {
  //     setState(() {
  //       Colors_selector.pair1 = Color(0xffe0f7fa);
  //       Colors_selector.pair2 = Color(0xffe1f5fe);
  //       Colors_selector.primaryColor = Colors.lightBlue[400];
  //       Colors_selector.primmary1 = Color(0xFF08B1F0);
  //     });
  //   }
  // }

  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Afaan Oromoo', 'locale': Locale('or', 'ET')},
    {'name': 'አማርኛ', 'locale': Locale('am', 'ET')},
    {'name': 'Somali', 'locale': Locale('en', 'US')},
  ];
  updateLanguage(Locale locale) async {
    Get.back();
    Get.updateLocale(locale);
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

  void shareApp() {
    // Replace the following variables with your app's name and store link
    const String appName = "Your App Name";
    const String storeLink = "https://yourappstorelink.com";

    Share.share(
      "Check out $appName! Download it from $storeLink",
      subject: "Share $appName",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.tertiaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors_selector.tertiaryColor,
                  Colors_selector.tertiaryColor
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.apps, // Replace this with your desired icon
                          size: 20,
                          color: Colors
                              .grey[700], // Adjust the icon size as needed
                        ),
                        const SizedBox(
                            width:
                                10), // Add some space between the icon and the text
                        Text(
                          "General",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      height: 2,
                      thickness: 4,
                      color: Colors_selector.grey, // Adjust the color as needed
                    ),
                  ),
                  // SizedBox(height: 10),
                  Card(
                      color: Colors.grey[100],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(14),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: ListTile(
                                leading: Icon(
                                  Icons.privacy_tip_outlined,
                                  color: Colors_selector.primaryColor,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Prisec()),
                                  );
                                },
                                title: Text("Privacy and Security".tr),
                                trailing: Icon(Icons.keyboard_arrow_right)),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About_us()),
                                  );
                                },
                                leading: Icon(
                                  Icons.people,
                                  color: Colors_selector.primaryColor,
                                ),
                                title: Text("About Us".tr),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right)),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Forgot_pw()),
                                  );
                                },
                                title: Text("Change Password".tr),
                                leading: Icon(
                                  Icons.lock_outline,
                                  color: Colors_selector.primaryColor,
                                ),
                                trailing: const Icon(Icons.edit)),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.language,
                                  color: Colors_selector.primaryColor,
                                ),
                                onTap: (() {
                                  buildLanguageDialog(context);
                                }),
                                title: Text("Change Language".tr),
                                trailing: const Icon(Icons.edit)),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                            child: ListTile(
                              onTap: (() => _onBackButtonPressed(context)),
                              title: Text("Logout".tr),
                              // trailing: const Icon(Icons.logout_outlined),
                              leading: Icon(
                                Icons.logout_outlined,
                                color: Colors_selector.secondaryColor,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons
                              .view_carousel, // Replace this with your desired icon
                          size: 20,
                          color: Colors
                              .grey[700], // Adjust the icon size as needed
                        ),
                        const SizedBox(
                            width:
                                10), // Add some space between the icon and the text
                        Text(
                          "More",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      height: 2,
                      thickness: 4,
                      color: Colors_selector.grey, // Adjust the color as needed
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: SwitchListTile(
                        secondary: Icon(
                          Icons.dark_mode,
                          color: Colors_selector.primaryColor,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 7, 4),
                        title: Text(
                          "Dark Theme".tr,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        value: isOn == "true" ? true : false,
                        onChanged: (bool value) async {
                          setState(() {
                            isOn = value == true ? "true" : "false";
                            // SimplePreferences preferences = SimplePreferences();
                            // await preferences.setIsOn(isOn!);
                          });
                          SimplePreferences preferences = SimplePreferences();
                          await preferences.setIsOn(isOn!);

                          // isOn = "${value}";
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ListTile(
                      title: const Text("Share the app to friends"),
                      leading: Icon(
                        Icons.share,
                        color: Colors_selector.primaryColor,
                      ),
                      onTap: () =>
                          shareApp(), // Call the shareApp function when tapped
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ListTile(
                        onTap: () {
                          LaunchReview.launch(
                              androidAppId: "com.example.CooPlay");
                        },
                        title: Text("Rate us".tr),
                        leading: Icon(
                          Icons.star,
                          color: Colors_selector.primaryColor,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ListTile(
                      // onTap: () async {
                      //   // Create a dynamic link
                      //   final DynamicLinkParameters parameters =
                      //       DynamicLinkParameters(
                      //     uriPrefix: 'https://your-app-page.link',
                      //     link: Uri.parse(
                      //         'https://your-app-page.link/some-content'),
                      //     androidParameters: AndroidParameters(
                      //       packageName: 'com.example.yourapp',
                      //     ),
                      //     // Add more platform-specific parameters if needed
                      //   );

                      //   final ShortDynamicLink dynamicUrl =
                      //       await FirebaseDynamicLinks.instance
                      //           .buildShortLink(parameters);
                      //   final Uri shortUrl = dynamicUrl.shortUrl;
                      //   print(shortUrl);
                      //   // Share the dynamic link
                      //   // ...
                      // },
                      onTap: () async {
                        final referralLink = await getReferralLink();
                        // ignore: unnecessary_null_comparison
                        if (referralLink != null) {
                          // You can display the referral link or perform any action with it
                          print('Referral Link: $referralLink');
                        } else {
                          // Handle error
                          print('Error getting referral link');
                        }
                      },
                      title: Text("Feedbacks".tr),
                      leading: Icon(
                        Icons.feedback_outlined,
                        color: Colors_selector.primaryColor,
                      ),

                      // trailing: Icon(Icons.edit),
                    ),
                  ),
                ],
              )),
        )),
      ),
    );
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
                  onPressed: () async {
                    List<String> user = [];
                    SimplePreferences preferences = SimplePreferences();
                    await preferences.setUser(user);
                    await preferences.setRefresh("null");
                    // ignore: use_build_context_synchronously
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

  Future<String> getReferralLink() async {
    try {
      final referrer = await AndroidPlayInstallReferrer.installReferrer;
      final utmParams = referrer.installReferrer; // Get the install referrer

      // Replace 'YOUR_APP_ID' with your actual app's package name
      final playStoreLink =
          'https://play.google.com/store/apps/details?id=com.coop.michu_test.coop_michu&${referrer.installReferrer}';

      // Append the utmParams to your Play Store link
      final referralLink = '$playStoreLink&$utmParams';
      Map<String, String> queryParams = Uri.parse(playStoreLink)
          .queryParameters; // returns Map<String, String>
      // Get the `utm_content` parameter.
      String? utmContent = queryParams["utm_content"];
      print("hereee");
      print(utmContent);

      return referralLink;
    } on PlatformException catch (e) {
      print('Failed to retrieve install referrer: $e');
      return "null";
    }
  }
}
