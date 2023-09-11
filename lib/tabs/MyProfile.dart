import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/utils/simple_preference.dart';

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
