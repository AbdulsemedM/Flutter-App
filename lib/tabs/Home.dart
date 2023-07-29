// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:loyalty_app/colors.dart';
// import 'package:loyalty_app/login_page.dart';
import 'package:loyalty_app/menu/Challenges.dart';
import 'package:loyalty_app/menu/Help.dart';
import 'package:loyalty_app/menu/Locations.dart';
import 'package:loyalty_app/menu/Products.dart';
import 'package:loyalty_app/menu/register/Register.dart';
import 'package:loyalty_app/menu/Share.dart';
// import 'package:protest/menu/convert_coins.dart';
import 'package:get/get.dart';
// import 'package:hovering/hovering.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _menuSelector({required IconData icon, required String name}) {
    return Container(
      width: 60, // Adjust the width of the container as needed
      height: 80, // Adjust the height of the container as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40, // Adjust the icon size as needed
            color: Colors_selector
                .secondaryColor, // Adjust the icon color as needed
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  final List<String> images = [
    'https://media.licdn.cn/dms/image/C4E1BAQHkN7Cli0qSYw/company-background_10000/0/1607605666419?e=2159024400&v=beta&t=hylf9iaLVH9MRMFrjyPsTA7jV9kq81sVfuECjLlHp38',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQigbYPGO85v2rNJ1CGfXqPzJqyKwvSjke425KRb3niXZKKCYfEu6f3ZpNVwN3gUS0bCbw&usqp=CAU',
    'https://pbs.twimg.com/media/FgtTwl2X0AAG4fg.jpg',
    'https://pbs.twimg.com/media/FhWwJI4WAAQ6vao?format=jpg&name=large',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbYLjD2pzvno_e9lVCDpt8OWmyfH_2Cu3NZw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnBXSQib9AIRl9t3hThI3xUWBPf5dCjRg4NswOK3Qz0usA8TvnE6WOeBY4pQn3n30hd-s&usqp=CAU',
  ];
  List<Widget> generateImagesTiles() {
    return images
        .map((element) => ClipRRect(
              // ignore: sort_child_properties_last
              child: Image.network(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Colors_selector.primaryColor,
      backgroundColor: Colors_selector.secondaryColor,
      onRefresh: _handleRefresh,
      animSpeedFactor: 2,
      // height: 250,
      springAnimationDurationInMilliseconds: 1500,
      child: SingleChildScrollView(
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
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                "Latest".tr,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
                items: generateImagesTiles(),
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Menu".tr,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 545,
                          child: GridView.count(
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.5,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showChallengeDialog(context);
                                },
                                child: _menuSelector(
                                    icon: Icons.games, name: "Challenges".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ShowSimpleDialog(context);
                                },
                                child: _menuSelector(
                                    icon: Icons.change_circle,
                                    name: "Convert Coins".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: _menuSelector(
                                    icon: Icons.person_add,
                                    name: "Register".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Locations()));
                                },
                                child: _menuSelector(
                                    icon: Icons.location_on,
                                    name: "Locations".tr),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Share()),
                                    );
                                  },
                                  child: _menuSelector(
                                      icon: Icons.share, name: "Share".tr)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Help()),
                                    );
                                  },
                                  child: _menuSelector(
                                      icon: Icons.help, name: "Help".tr)),
                              GestureDetector(
                                onTap: () {
                                  LaunchReview.launch(
                                      androidAppId: "com.example.CooPlay");
                                },
                                child: _menuSelector(
                                    icon: Icons.star_rate, name: "Rate us".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Products()));
                                },
                                child: _menuSelector(
                                    icon: Icons.shopping_cart,
                                    name: "Other products".tr),
                              ),
                            ],
                          ),
                        )),
                  ]),
            )
          ]),
        ),
      )),
    );
  }

  // ignore: non_constant_identifier_names
  void ShowSimpleDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors_selector.pair2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "  You have 4.2 Golden coins  ".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "  which is equal to 25 Birr  ".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Withdraw to your account ".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "withdraw".tr,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "convert to a mobile topup".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Convert".tr,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  const SizedBox(height: 15),
                ],
              ),
            ));
      });

  void showChallengeDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors_selector.pair2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "If you want to see your products gifts press here.".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      // ignore: duplicate_ignore
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Gifts".tr,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Challenges()));
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If you want to try some challenges press here.".tr,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Challenges".tr,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Challenges()));
                      }),
                  const SizedBox(height: 15),
                ],
              ),
            ));
      });
}
