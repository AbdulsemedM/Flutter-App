import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:loyalty_app/tabs/Favorite.dart';
import 'package:loyalty_app/tabs/Home.dart';
import 'package:loyalty_app/tabs/Home2.dart';
import 'package:loyalty_app/tabs/Profile.dart';
import 'package:loyalty_app/tabs/Search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> title = ['Home'.tr, 'redeem'.tr, 'Settings'.tr, 'Profile'.tr];

  List<Widget> _tabs = [Home2(), Search(), Favorite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
          backgroundColor: Colors_selector.primaryColor,
          // appBar: AppBar(
          //   leading: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(25.0),
          //       child: GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(builder: (context) => Profile2()),
          //           );
          //         },
          //         child: Image.network(
          //           "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_800_800/0/1657298878780?e=2147483647&v=beta&t=uEtiMEuRFMp1gmPv3orz0TTxgo-tSTbHpAc8W2LGqkU",
          //           height: 50.0,
          //           width: 50.0,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ),
          //   elevation: 0.0,
          //   backgroundColor: Colors_selector.primaryColor,
          //   title: Text(
          //     title[_selectedIndex].tr,
          //     style: TextStyle(color: Colors_selector.secondaryColor),
          //   ),
          //   automaticallyImplyLeading: false,
          //   centerTitle: true,
          //   actions: [
          //     IconButton(
          //       icon: const Icon(Icons.monetization_on_sharp,
          //           color: Colors.yellowAccent),
          //       tooltip: 'Conis',
          //       onPressed: () {},
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(child: Center(child: Text("4.2"))),
          //     )
          //   ],
          // ),
          body: _tabs[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: GNav(
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              gap: 12,
              backgroundColor: Colors_selector.pair2,
              activeColor: Colors_selector.primaryColor,
              color: Colors_selector.grey,
              tabBackgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              curve: Curves.easeOutExpo,
              duration: Duration(milliseconds: 400),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  iconSize: 30,
                  text: "Home".tr,
                  textStyle: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors_selector
                        .primaryColor, // Customize the text color as needed
                  ),
                ),
                GButton(
                  icon: Icons.card_giftcard,
                  iconSize: 30,
                  text: "Redeem".tr,
                  textStyle: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors_selector
                        .primaryColor, // Customize the text color as needed
                  ),
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Settings".tr,
                  textStyle: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors_selector
                        .primaryColor, // Customize the text color as needed
                  ),
                  iconSize: 30,
                ),
                GButton(
                  icon: FontAwesomeIcons.user,
                  iconSize: 30,
                  text: "Profile".tr,
                  textStyle: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors_selector
                        .primaryColor, // Customize the text color as needed
                  ),
                ),
              ],
            ),
          )

// bottomNavigationBar:GNav(
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
