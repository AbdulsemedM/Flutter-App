import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/tabs/Home3.dart';
import 'package:loyalty_app/tabs/Michu.dart';

import '../colors.dart';
import '../utils/simple_preference.dart';
import 'package:http/http.dart' as http;

bool loading = true;

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List? user;
  late List Challengs = [];

  @override
  void initState() {
    super.initState();
    getChallenges();
    getUserData();
  }

  Future<void> getUserData() async {
    user = await SimplePreferences().getUser();
    setState(() {});
    print("from home");
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    IconData? parseIconData(dynamic iconData) {
      if (iconData is IconData) {
        return iconData;
      } else if (iconData is String) {
        return IconData(int.parse(iconData), fontFamily: 'MaterialIcons');
        // switch (iconData) {
        //   case iconData:
        //     return FontAwesomeIcons.handshake;
        //   case 'Icons.card_giftcard_sharp':
        //     return Icons.card_giftcard_sharp;
        //   case 'Icons.account_balance_wallet_outlined':
        //     return Icons.account_balance_wallet_outlined;
        //   case 'Icons.account_tree_sharp':
        //     return Icons.account_tree_sharp;
        //   case 'Icons.analytics':
        //     return Icons.analytics;
        //   // Add more cases for other icon strings
        //   default:
        //     return null;
        // }
      } else {
        return null;
      }
    }

    List<IconItem?> iconItems = Challengs!.map((data) {
      IconData? iconData;
      if (data['icon'] is IconData) {
        iconData = data['icon'];
      } else if (data['icon'] is String) {
        final IconData? parsedIcon = parseIconData(data['icon']);
        if (parsedIcon != null) {
          iconData = parsedIcon;
        }
      }
      return IconItem(
        icon: iconData ?? Icons.error, // Default icon in case of invalid data
        title: data['challengeName'] ?? '',
        // disabled: data['isEnabled'],
        onPressed: () {
          print("hello");
          if (data['isEnabled'] == true) {
            // You can customize the onPressed action here
            // For example, navigate to the corresponding screen
            // or show a message
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Home3(), // Replace with your screen widget
              ),
            );
          }
        },
        disabled: data['isEnabled'] != true,
      );
    }).toList();

    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .assured_workload_outlined, // Replace this with your desired icon
                      size: 30,
                      color: Colors.grey, // Adjust the icon size as needed
                    ),
                    const SizedBox(
                        width:
                            10), // Add some space between the icon and the text
                    Text(
                      "Earn",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 35,
                        color: Colors_selector.grey,
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
                  color: Colors_selector
                      .primaryColor, // Adjust the color as needed
                ),
              ),
              loading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: CircularProgressIndicator(
                        color: Colors_selector.secondaryColor,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: iconItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: iconItems[index]!.onPressed,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: iconItems[index]?.disabled == true
                                          ? Colors_selector.grey
                                          : Colors_selector
                                              .primmary1, // Set the color of the border here
                                      width:
                                          2, // Set the width of the border here
                                    ),
                                    shape: BoxShape.circle,
                                    // color: Colors_selector
                                    //     .primaryColor, // Adjust the circle color as needed
                                  ),
                                  child: Center(
                                    child: Icon(
                                      iconItems[index]!.icon,
                                      size: 40,
                                      color: Colors_selector
                                          .grey, // Adjust the icon size and color as needed
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                iconItems[index]!.title,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 16,
                                  color: Colors_selector
                                      .grey, // Adjust the text color as needed
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ]),
          ),
        ),
      ),
    );
  }

  getChallenges() async {
    try {
      final response = await http
          .get(
            Uri.http('63.34.29.151:9000', '/api/challengs/getAll'),
            // headers: <String, String>{
            //   'Content-Type': 'application/json; charset=UTF-8',
            // },
            // body: jsonEncode(body),
          )
          .timeout(Duration(seconds: 15));
      // final json = "[" + response.body + "]";
      List<Map<String, dynamic>> dataList =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      Challengs = dataList;
      setState(() {
        loading = false;
      });
      print(Challengs);
    } catch (e) {
      // Challengs = null;
      setState(() {
        loading = true;
      });
      const message =
          "Something went wrong, please Check your network connection";

      // print(message);
      Fluttertoast.showToast(msg: message, fontSize: 18);
    } finally {
      setState(() {
        loading = false;
      });
      // print(e);
    }
  }
  // return response;
}

class IconItem {
  final IconData icon;
  final String title;
  final VoidCallback onPressed; // Add a callback function
  late bool disabled;
  IconItem(
      {required this.icon,
      required this.title,
      required this.onPressed,
      required this.disabled});
}
