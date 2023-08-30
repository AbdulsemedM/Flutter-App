// import 'package:flutter/foundation.dart';
// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// ignore_for_file: unnecessary_null_comparison

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/tabs/History.dart';
// import 'package:loyalty_app/tabs/Michu.dart';
import 'package:loyalty_app/tabs/Redeem.dart';

import 'package:share/share.dart';
import '../login_page.dart';
// import '../utils/simple_preference.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Home3 extends StatefulWidget {
  final List<UserChallengeDTO> challengeUserChallengeDTOs;
  final List<LevelDetail> challengeLevelDetails;
  final ChallengeData challengeData;
  const Home3({
    Key? key,
    required this.challengeUserChallengeDTOs,
    required this.challengeLevelDetails,
    required this.challengeData,
  }) : super(key: key);

  @override
  State<Home3> createState() => _Home3State();
}

class challengeData {
  final String link;
  final String points;
  final String earn; // Add a callback function
  final String image;
  final String name;
  challengeData(
      {required this.link,
      required this.points,
      required this.earn,
      required this.name,
      required this.image});
}

class _Home3State extends State<Home3> {
  // final PageController _controller = PageController();
  // var _currentIndex = 0;
  List<challengeData> challenge = [];

  final PageController _pageController = PageController();
  bool loading = true;
  double _currentPage = 0;
  // List? user;
  // List? challenge0;
  // List? challenge1;
  // List? challenge2;
  // List? challenge3;
  // List? challenge4;
  // List? challenge5;
  // List? challenge6;
  // List? challenge7;
  // List? challenge8;
  // List? bronze;
  // List? silver;
  // List? gold;
  // List? platinium;
  // List? data;
  // late String totalPoints;
  // late String toETB;
  // late String status;
  // late String color;
  // late String bronzePoint = "";
  // late String bronzeStatus = "";
  // late String silverPoint = "";
  // late String silverStatus = "";
  // late String goldPoint = "";
  // late String goldStatus = "";
  // late String platiniumPoint = "";
  // late String platiniumStatus = "";
  // late String challenge0Image;
  // late String challenge0name;
  // late String challenge0earn;
  // late String challenge0Points;
  // late String challenge0Link;
  // late String challenge1Image;
  // late String challenge1name;
  // late String challenge1earn;
  // late String challenge1Points;
  // late String challenge1Link;
  // late String challenge2Image;
  // late String challenge2name;
  // late String challenge2earn;
  // late String challenge2Points;
  // late String challenge2Link;
  // late String challenge3Image;
  // late String challenge3name;
  // late String challenge3earn;
  // late String challenge3Points;
  // late String challenge3Link;
  // late String challenge4Image;
  // late String challenge4name;
  // late String challenge4earn;
  // late String challenge4Points;
  // late String challenge4Link;
  // late String challenge5Image;
  // late String challenge5name;
  // late String challenge5earn;
  // late String challenge5Points;
  // late String challenge5Link;
  // late String challenge6Image;
  // late String challenge6name;
  // late String challenge6earn;
  // late String challenge6Points;
  // late String challenge6Link;
  // late String challenge7Image;
  // late String challenge7name;
  // late String challenge7earn;
  // late String challenge7Points;
  // late String challenge7Link;
  // late String challenge8Image;
  // late String challenge8name;
  // late String challenge8earn;
  // late String challenge8Points;
  // late String challenge8Link;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    // getDatas();
  }

  // Future<void> getDatas() async {
  //   user = await SimplePreferences().getUser();
  //   print(user);
  //   data = await SimplePreferences().getData();
  //   totalPoints = data?[0];
  //   toETB = data?[1];
  //   status = data?[2];
  //   color = data?[3];
  //   silver = await SimplePreferences().getSilver();
  //   silverPoint = silver?[1];
  //   silverStatus = silver?[2];
  //   bronze = await SimplePreferences().getBronze();
  //   bronzePoint = bronze?[1];
  //   bronzeStatus = bronze?[2];
  //   gold = await SimplePreferences().getGold();
  //   goldPoint = gold?[1];
  //   goldStatus = gold?[2];
  //   platinium = await SimplePreferences().getPlatinium();
  //   platiniumPoint = platinium?[1];
  //   platiniumStatus = platinium?[2];
  //   challenge0 = await SimplePreferences().getChallenge0();
  //   if (challenge0 != null) {
  //     challenge0name = challenge0?[4];
  //     challenge0Image = challenge0?[0];
  //     challenge0earn = challenge0?[2];
  //     challenge0Points = challenge0?[3];
  //     challenge0Link = challenge0?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge0earn,
  //         link: challenge0Link,
  //         name: challenge0name,
  //         image: challenge0Image,
  //         points: challenge0Points,
  //       ),
  //     ]);
  //   }
  //   challenge1 = await SimplePreferences().getChallenge1();
  //   if (challenge1 != null) {
  //     challenge1name = challenge1?[4];
  //     challenge1Image = challenge1?[0];
  //     challenge1earn = challenge1?[2];
  //     challenge1Points = challenge1?[3];
  //     challenge1Link = challenge1?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge1earn,
  //         link: challenge1Link,
  //         name: challenge1name,
  //         image: challenge1Image,
  //         points: challenge1Points,
  //       ),
  //     ]);
  //   }
  //   challenge2 = await SimplePreferences().getChallenge2();
  //   if (challenge2 != null) {
  //     challenge2name = challenge2?[4];
  //     challenge2Image = challenge2?[0];
  //     challenge2earn = challenge2?[2];
  //     challenge2Points = challenge2?[3];
  //     challenge2Link = challenge2?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge2earn,
  //         link: challenge2Link,
  //         name: challenge2name,
  //         image: challenge2Image,
  //         points: challenge2Points,
  //       ),
  //     ]);
  //   }
  //   challenge3 = await SimplePreferences().getChallenge3();
  //   if (challenge3 != null) {
  //     challenge3name = challenge3?[4];
  //     challenge3Image = challenge3?[0];
  //     challenge3earn = challenge3?[2];
  //     challenge3Points = challenge3?[3];
  //     challenge3Link = challenge3?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge3earn,
  //         link: challenge3Link,
  //         name: challenge3name,
  //         image: challenge3Image,
  //         points: challenge3Points,
  //       ),
  //     ]);
  //   }
  //   challenge4 = await SimplePreferences().getChallenge4();
  //   if (challenge4 != null) {
  //     challenge4name = challenge4?[4];
  //     challenge4Image = challenge4?[0];
  //     challenge4earn = challenge4?[2];
  //     challenge4Points = challenge4?[3];
  //     challenge4Link = challenge4?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge4earn,
  //         link: challenge4Link,
  //         name: challenge4name,
  //         image: challenge4Image,
  //         points: challenge4Points,
  //       ),
  //     ]);
  //   }
  //   challenge5 = await SimplePreferences().getChallenge5();
  //   if (challenge5 != null) {
  //     challenge5name = challenge5?[4];
  //     challenge5Image = challenge5?[0];
  //     challenge5earn = challenge5?[2];
  //     challenge5Points = challenge5?[3];
  //     challenge5Link = challenge5?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge5earn,
  //         link: challenge5Link,
  //         name: challenge5name,
  //         image: challenge5Image,
  //         points: challenge5Points,
  //       ),
  //     ]);
  //   }
  //   challenge6 = await SimplePreferences().getChallenge6();
  //   if (challenge6 != null) {
  //     challenge6name = challenge6?[4];
  //     challenge6Image = challenge6?[0];
  //     challenge6earn = challenge6?[2];
  //     challenge6Points = challenge6?[3];
  //     challenge6Link = challenge6?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge6earn,
  //         link: challenge6Link,
  //         name: challenge6name,
  //         image: challenge6Image,
  //         points: challenge6Points,
  //       ),
  //     ]);
  //   }
  //   challenge7 = await SimplePreferences().getChallenge7();
  //   if (challenge7 != null) {
  //     challenge7name = challenge7?[4];
  //     challenge7Image = challenge7?[0];
  //     challenge7earn = challenge7?[2];
  //     challenge7Points = challenge7?[3];
  //     challenge7Link = challenge7?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge7earn,
  //         link: challenge7Link,
  //         name: challenge7name,
  //         image: challenge7Image,
  //         points: challenge7Points,
  //       ),
  //     ]);
  //   }
  //   challenge8 = await SimplePreferences().getChallenge8();
  //   if (challenge8 != null) {
  //     challenge8name = challenge8?[4];
  //     challenge8Image = challenge8?[0];
  //     challenge8earn = challenge8?[2];
  //     challenge8Points = challenge8?[3];
  //     challenge8Link = challenge8?[1];
  //     challenge.addAll([
  //       challengeData(
  //         earn: challenge8earn,
  //         link: challenge8Link,
  //         name: challenge8name,
  //         image: challenge8Image,
  //         points: challenge8Points,
  //       ),
  //     ]);
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  //   print("from home");
  //   print(challenge.length);
  // }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void shareApp(String link, String app) {
    // Replace the following variables with your app's name and store link
    String appName = app;
    String storeLink = link;

    Share.share(
      "Check out $appName! Download it from $storeLink",
      subject: "Share $appName",
    );
  }

  Color hexToColor(String hexString) {
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
      backgroundColor: Colors_selector.tertiaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
                )
                // bottomLeft: Radius.circular(30),
                // bottomRight: Radius.circular(30)),
                ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 23, 23, 23),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          hexToColor(widget.challengeData.levelColor),
                          hexToColor(widget.challengeData.levelColor)
                          // Color(0xFFDFB64D),
                          // Color(0xFFDFB64D)
                          // Color.fromRGBO(223, 182, 77, 1),
                          // Color.fromRGBO(223, 182, 77, 1)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.61,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.black,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.zero,
                              bottomRight: Radius.zero,
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        child: Column(children: [
                          // Row(
                          //   children: [
                          //     Align(
                          //         alignment: Alignment.topLeft,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: CircleAvatar(
                          //             radius: 30,
                          //             backgroundColor: Colors.black,
                          //             child:
                          //                 Image.asset("assets/images/michu.png"),
                          //           ),
                          //         )),
                          //     Padding(
                          //       padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                          //       child: Text(
                          //         "Id : 2131242342",
                          //         style: GoogleFonts.roboto(
                          //             fontSize: 17, color: Colors.white),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 20, 0, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "AVAILABLE POINTS",
                                style: GoogleFonts.roboto(color: Colors.grey),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 12, 0, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${widget.challengeData.totalPoints} ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 28, color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                      " = ${widget.challengeData.equivalentETB} ETB",
                                      style: GoogleFonts.roboto(
                                          fontSize: 20, color: Colors.grey)),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Redeem(), // Replace with your screen widget
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.swap_horiz_sharp,
                                            color: hexToColor(widget
                                                .challengeData.levelColor),
                                          ),
                                          Text(
                                            " Exchange",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: hexToColor(widget
                                                    .challengeData.levelColor)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                History(), // Replace with your screen widget
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30.0, 0, 0, 0),
                                        child: Text(
                                          " History >",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Column(
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      widget.challengeData.levelName,
                                      style: GoogleFonts.playfairDisplay(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  )))
                        ],
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 7, 23, 5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (widget.challengeLevelDetails[0]
                                                .status ==
                                            "2"
                                        ? Colors.green
                                        : widget.challengeLevelDetails[0]
                                                    .status ==
                                                "1"
                                            ? Colors.amber
                                            : Colors.grey)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(
                                Icons.emoji_events,
                                color: Colors.brown.shade700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 4),
                            child: Row(
                              children: [
                                Text(
                                  "Bronze",
                                  style: GoogleFonts.roboto(
                                      color: (widget.challengeLevelDetails[0]
                                                  .status ==
                                              "2"
                                          ? Colors.green
                                          : widget.challengeLevelDetails[0]
                                                      .status ==
                                                  "1"
                                              ? Colors.amber
                                              : Colors.grey),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                widget.challengeLevelDetails[0].status == "2"
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                        child: CircleAvatar(
                                            radius: 7,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.done,
                                              size: 12,
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Text(
                            widget.challengeLevelDetails[0].points,
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors_selector.grey),
                          )
                        ],
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width *
                            0.04, // Width of the line
                        decoration: BoxDecoration(
                          color: (widget.challengeLevelDetails[0].status == "2"
                              ? Colors.green
                              : widget.challengeLevelDetails[0].status == "1"
                                  ? Colors.amber
                                  : Colors.grey), // Color of the line
                          // Adjust as needed
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (widget.challengeLevelDetails[1]
                                                .status ==
                                            "2"
                                        ? Colors.green
                                        : widget.challengeLevelDetails[1]
                                                    .status ==
                                                "1"
                                            ? Colors.amber
                                            : Colors.grey)),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(Icons.star_half,
                                  color: Color.fromRGBO(168, 166, 167, 1)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 4),
                            child: Row(
                              children: [
                                Text(
                                  "Silver",
                                  style: GoogleFonts.roboto(
                                      color: (widget.challengeLevelDetails[1]
                                                  .status ==
                                              "2"
                                          ? Colors.green
                                          : widget.challengeLevelDetails[1]
                                                      .status ==
                                                  "1"
                                              ? Colors.amber
                                              : Colors.grey),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                widget.challengeLevelDetails[1].status == "2"
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                        child: CircleAvatar(
                                            radius: 7,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.done,
                                              size: 12,
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Text(
                            widget.challengeLevelDetails[1].points,
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors_selector.grey),
                          )
                        ],
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width *
                            0.04, // Width of the line
                        decoration: BoxDecoration(
                          color: (widget.challengeLevelDetails[1].status == "2"
                              ? Colors.green
                              : widget.challengeLevelDetails[1].status == "1"
                                  ? Colors.amber
                                  : Colors.grey), // Color of the line
                          // Adjust as needed
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (widget.challengeLevelDetails[2]
                                                .status ==
                                            "2"
                                        ? Colors.green
                                        : widget.challengeLevelDetails[2]
                                                    .status ==
                                                "1"
                                            ? Colors.amber
                                            : Colors.grey)),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                Icons.stars,
                                color: Color.fromRGBO(223, 182, 77, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 4),
                            child: Row(
                              children: [
                                Text(
                                  "Gold",
                                  style: GoogleFonts.roboto(
                                      color: (widget.challengeLevelDetails[2]
                                                  .status ==
                                              "2"
                                          ? Colors.green
                                          : widget.challengeLevelDetails[2]
                                                      .status ==
                                                  "1"
                                              ? Colors.amber
                                              : Colors.grey),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                widget.challengeLevelDetails[2].status == "2"
                                    ? const Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            2.0, 0, 0, 0),
                                        child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.done,
                                              size: 12,
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Text(
                            widget.challengeLevelDetails[2].points,
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors_selector.grey),
                          )
                        ],
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width *
                            0.04, // Width of the line
                        decoration: BoxDecoration(
                            color: (widget.challengeLevelDetails[2].status ==
                                    "2"
                                ? Colors.green
                                : widget.challengeLevelDetails[2].status == "1"
                                    ? Colors.amber
                                    : Colors.grey) // Adjust as needed
                            ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (widget.challengeLevelDetails[3]
                                                .status ==
                                            "2"
                                        ? Colors.green
                                        : widget.challengeLevelDetails[3]
                                                    .status ==
                                                "1"
                                            ? Colors.amber
                                            : Colors.grey)),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(Icons.star, color: Colors.cyan),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 4),
                            child: Row(
                              children: [
                                Text(
                                  "Platinium",
                                  style: GoogleFonts.roboto(
                                      color: (widget.challengeLevelDetails[3]
                                                  .status ==
                                              "2"
                                          ? Colors.green
                                          : widget.challengeLevelDetails[3]
                                                      .status ==
                                                  "1"
                                              ? Colors.amber
                                              : Colors.grey),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                widget.challengeLevelDetails[3].status == "2"
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                        child: CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.done,
                                              size: 12,
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Text(
                            widget.challengeLevelDetails[3].points,
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors_selector.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Divider(
                    height: 2,
                    thickness: 1,
                    color: Colors_selector.grey, // Adjust the color as needed
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.challengeUserChallengeDTOs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.90,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                8,
                                0,
                                0,
                              ),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 30,
                                  child: Image.asset(
                                      "assets/images/${widget.challengeUserChallengeDTOs[index].challengeLogo}")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                "You have earned ${widget.challengeUserChallengeDTOs[index].pointsEarned}",
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                  "${widget.challengeUserChallengeDTOs[index].challengeName} Points ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Column(
                                children: [
                                  Text(
                                      "Just share your ${widget.challengeUserChallengeDTOs[index].challengeName} affiliate link and",
                                      style: GoogleFonts.roboto(fontSize: 17)),
                                  Text(
                                      "earn ${widget.challengeUserChallengeDTOs[index].awardPoints} points ",
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.83,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CustomPaint(
                                painter: DashedBorderPainter(borderRadius: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 0, 0),
                                        child: Text(
                                          "${widget.challengeUserChallengeDTOs[index].affliateLink.substring(0, 35)}...",
                                          style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            letterSpacing: 0.0,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: GestureDetector(
                                              onTap: () {
                                                shareApp(
                                                  widget
                                                      .challengeUserChallengeDTOs[
                                                          index]
                                                      .affliateLink,
                                                  widget
                                                      .challengeUserChallengeDTOs[
                                                          index]
                                                      .challengeName,
                                                );
                                              },
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(Icons.share),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                DotsIndicator(
                  dotsCount: widget.challengeUserChallengeDTOs.isEmpty
                      ? 1
                      : widget.challengeUserChallengeDTOs.length,
                  position: _currentPage.toInt(),
                  decorator: DotsDecorator(
                    activeColor: Colors_selector.primaryColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double borderRadius;

  DashedBorderPainter({this.borderRadius = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final dashWidth = 5;
    final dashSpace = 5;

    // Draw top dashed line
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, borderRadius),
        Offset(startX + dashWidth, borderRadius),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw right dashed line
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width - borderRadius, startY),
        Offset(size.width - borderRadius, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Draw bottom dashed line
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height - borderRadius),
        Offset(startX + dashWidth, size.height - borderRadius),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw left dashed line
    startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(borderRadius, startY),
        Offset(borderRadius, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
