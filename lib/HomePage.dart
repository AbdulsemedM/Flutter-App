import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loyalty_app/Profile2.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
// import 'package:loyalty_app/tabs/Favorite.dart';
import 'package:loyalty_app/tabs/History.dart';
// import 'package:loyalty_app/tabs/Home.dart';
// import 'package:loyalty_app/tabs/Home2.dart';
import 'package:loyalty_app/tabs/Home3.dart';
// import 'package:loyalty_app/tabs/Profile.dart';
import 'package:loyalty_app/tabs/Redeem.dart';
// import 'package:loyalty_app/tabs/Search.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:loyalty_app/utils/simple_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const Home3(),
    const Redeem(),
    const History(),
    // const Michu(),
  ];
  // int _selectedIndex = 0;
  // List<String> title = ['Home'.tr, 'redeem'.tr, 'Settings'.tr, 'Profile'.tr];

  // List<Widget> _tabs = [Home2(), Search(), Favorite(), Profile()];

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
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index]),
          ),
          bottomNavigationBar: AnimatedNotchBottomBar(
            /// Provide NotchBottomBarController
            notchBottomBarController: _controller,
            color: Colors.white,
            showLabel: false,
            notchColor: Colors.black87,

            /// restart app if you change removeMargins
            removeMargins: false,
            bottomBarWidth: 500,
            durationInMilliSeconds: 300,
            bottomBarItems: const [
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.home_filled,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.home_filled,
                  color: Colors.blueAccent,
                ),
                itemLabel: 'Page 1',
              ),
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.star,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.star,
                  color: Colors.blueAccent,
                ),
                itemLabel: 'Page 2',
              ),

              ///svg example
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
                activeItem: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                ),
                itemLabel: 'Page 3',
              ),
            ],
            onTap: (index) {
              /// perform action on tab change and to update pages you can update pages without pages
              print('current selected index $index');
              _pageController.jumpToPage(index);
            },
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
                  onPressed: () async {
                    List<String> user = [];
                    SimplePreferences preferences = SimplePreferences();
                    await preferences.setUser(user);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Login_page(),
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
