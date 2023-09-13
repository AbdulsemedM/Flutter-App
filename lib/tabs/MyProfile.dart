import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/Forgot_pw.dart';
import 'package:loyalty_app/Settings/About_us.dart';
import 'package:loyalty_app/Settings/PaS.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:loyalty_app/utils/simple_preference.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<String> data = [];
  Color myColor = Colors.grey;
  @override
  void initState() {
    super.initState();
    fetchColor();
  }

  Color hexToColor(String hexString) {
    print(hexString);
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors_selector.tertiaryColor, myColor],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    child: BigUserCard(
                      backgroundColor: myColor,
                      settingColor: Colors.white,
                      userName: "James Bond",
                      userProfilePic: const NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4lihOt46X7hUMohEzLcHRy5kIMz_Y65T9AQ&usqp=CAU",
                          scale: 0.1),
                      cardActionWidget: SettingsItem(
                        icons: Icons.edit,
                        iconStyle: IconStyle(
                          withBackground: true,
                          borderRadius: 50,
                          backgroundColor: Colors.yellow[600],
                        ),
                        title: "Modify",
                        subtitle: "Tap to change your data",
                        onTap: () {
                          print("OK");
                        },
                      ),
                    ),
                  ),
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Prisec()),
                        );
                      },
                      icons: Icons.privacy_tip,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors_selector.primaryColor,
                      ),
                      title: 'Privacy and Security',
                      subtitle: "How We Protect Your Privacy",
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About_us()),
                        );
                      },
                      icons: CupertinoIcons.pencil_outline,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors_selector.primaryColor,
                      ),
                      title: 'About Us',
                      subtitle: "Who We Are and What We Do",
                      titleMaxLine: 1,
                      subtitleMaxLine: 1,
                    ),
                    SettingsItem(
                      onTap: () {
                        buildLanguageDialog(context);
                      },
                      icons: FontAwesomeIcons.language,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors_selector.primaryColor,
                      ),
                      title: 'Change Language',
                      subtitle: "Multilingual Support",
                      // trailing: Switch.adaptive(
                      //   value: false,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgot_pw()),
                        );
                      },
                      icons: Icons.password,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors_selector.primaryColor,
                      ),
                      title: 'Change Password ',
                      // subtitle: "Multilingual Support",
                      // trailing: Switch.adaptive(
                      //   value: false,
                      //   onChanged: (value) {},
                      // ),
                    ),
                    SettingsItem(
                      onTap: () {
                        _onBackButtonPressed(context);
                      },
                      icons: Icons.logout,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors_selector.primaryColor,
                      ),
                      title: 'Logout',
                      // subtitle: "Multilingual Support",
                      // trailing: Switch.adaptive(
                      //   value: false,
                      //   onChanged: (value) {},
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void fetchColor() async {
    var datas = await SimplePreferences().getData();
    data = [datas?[0], datas?[1], datas?[2], datas?[3]];
    setState(() {
      myColor = hexToColor(data[3]);
    });
    print(data);
  }
}
