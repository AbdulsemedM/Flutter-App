import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:loyalty_app/tabs/History.dart';
import 'package:loyalty_app/tabs/Redeem.dart';
import 'package:flutter/material.dart';
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

  final List<Widget> bottomBarPages = [
    // const Home3(),
    const Redeem(),
    const History(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
          backgroundColor: Colors_selector.primaryColor,
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
          )),
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
  }
}
