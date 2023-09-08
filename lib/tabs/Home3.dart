// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/tabs/History.dart';
import 'package:loyalty_app/tabs/Redeem.dart';
import 'package:loyalty_app/utils/simple_preference.dart';
import 'package:share/share.dart';
import '../login_page.dart';
import 'package:http/http.dart' as http;

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
  // List<challengeData> challenge = [];
  late ChallengeData challengeData;
  List<LevelDetail> challengeLevelDetails = [];
  List<String> data = [];
  bool refresh = false;
  bool refresh1 = false;

  final PageController _pageController = PageController();
  bool loading = true;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    getref();
  }

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
                        colors: refresh1
                            ? [hexToColor(data[3]), hexToColor(data[3])]
                            : [
                                hexToColor(widget.challengeData.levelColor),
                                hexToColor(widget.challengeData.levelColor)
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
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18.0, 20, 0, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "AVAILABLE POINTS",
                                    style:
                                        GoogleFonts.roboto(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(18.0, 20, 8, 0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        _handleRefresh();
                                      },
                                      child: Icon(Icons.sync,
                                          color: refresh1
                                              ? hexToColor(data[3])
                                              : hexToColor(widget
                                                  .challengeData.levelColor)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 12, 0, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    refresh1
                                        ? data[0]
                                        : widget.challengeData.totalPoints,
                                    style: GoogleFonts.roboto(
                                        fontSize: 26, color: Colors.white),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                      refresh1
                                          ? " = ${data[1]} ETB"
                                          : " = ${widget.challengeData.equivalentETB} ETB",
                                      style: GoogleFonts.roboto(
                                          fontSize: 18, color: Colors.grey)),
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
                                            color: refresh1
                                                ? hexToColor(data[3])
                                                : hexToColor(widget
                                                    .challengeData.levelColor),
                                          ),
                                          Text(
                                            " Exchange",
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                color: refresh1
                                                    ? hexToColor(data[3])
                                                    : hexToColor(widget
                                                        .challengeData
                                                        .levelColor)),
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
                                      refresh
                                          ? data[2]
                                          : widget.challengeData.levelName,
                                      style: GoogleFonts.playfairDisplay(
                                          // fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontSize: 12),
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
                                    color: refresh
                                        ? ((challengeLevelDetails[0].status ==
                                                "2"
                                            ? Colors.green
                                            : challengeLevelDetails[0].status ==
                                                    "1"
                                                ? Colors.amber
                                                : Colors.grey))
                                        : ((widget.challengeLevelDetails[0]
                                                    .status ==
                                                "2"
                                            ? Colors.green
                                            : widget.challengeLevelDetails[0]
                                                        .status ==
                                                    "1"
                                                ? Colors.amber
                                                : Colors.grey))),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(
                                Icons.emoji_events,
                                color: Colors.brown.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 4),
                            child: Row(
                              children: [
                                Text(
                                  refresh
                                      ? (challengeLevelDetails[0].levelName)
                                      : (widget
                                          .challengeLevelDetails[0].levelName),
                                  style: GoogleFonts.roboto(
                                      color: refresh
                                          ? ((challengeLevelDetails[0].status ==
                                                  "2"
                                              ? Colors.green
                                              : challengeLevelDetails[0]
                                                          .status ==
                                                      "1"
                                                  ? Colors.amber
                                                  : Colors.grey))
                                          : ((widget.challengeLevelDetails[0]
                                                      .status ==
                                                  "2"
                                              ? Colors.green
                                              : widget.challengeLevelDetails[0]
                                                          .status ==
                                                      "1"
                                                  ? Colors.amber
                                                  : Colors.grey)),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                refresh
                                    ? (challengeLevelDetails[0].status == "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                                    : (widget.challengeLevelDetails[0].status ==
                                            "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                              ],
                            ),
                          ),
                          Text(
                            refresh
                                ? (challengeLevelDetails[0].points)
                                : (widget.challengeLevelDetails[0].points),
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
                          color: refresh
                              ? ((challengeLevelDetails[0].status == "2"
                                  ? Colors.green
                                  : challengeLevelDetails[0].status == "1"
                                      ? Colors.amber
                                      : Colors.grey))
                              : ((widget.challengeLevelDetails[0].status == "2"
                                  ? Colors.green
                                  : widget.challengeLevelDetails[0].status ==
                                          "1"
                                      ? Colors.amber
                                      : Colors.grey)), // Color of the line
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
                                    color: refresh
                                        ? (challengeLevelDetails[1].status ==
                                                "2"
                                            ? Colors.green
                                            : challengeLevelDetails[1].status ==
                                                    "1"
                                                ? Colors.amber
                                                : Colors.grey)
                                        : (widget.challengeLevelDetails[1]
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
                                  refresh
                                      ? challengeLevelDetails[1].levelName
                                      : widget
                                          .challengeLevelDetails[1].levelName,
                                  style: GoogleFonts.roboto(
                                      color: refresh
                                          ? (challengeLevelDetails[1].status ==
                                                  "2"
                                              ? Colors.green
                                              : challengeLevelDetails[1]
                                                          .status ==
                                                      "1"
                                                  ? Colors.amber
                                                  : Colors.grey)
                                          : (widget.challengeLevelDetails[1]
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
                                refresh
                                    ? (challengeLevelDetails[1].status == "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                                    : (widget.challengeLevelDetails[1].status ==
                                            "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                              ],
                            ),
                          ),
                          Text(
                            refresh
                                ? challengeLevelDetails[1].points
                                : widget.challengeLevelDetails[1].points,
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
                          color: refresh
                              ? (challengeLevelDetails[1].status == "2"
                                  ? Colors.green
                                  : challengeLevelDetails[1].status == "1"
                                      ? Colors.amber
                                      : Colors.grey)
                              : (widget.challengeLevelDetails[1].status == "2"
                                  ? Colors.green
                                  : widget.challengeLevelDetails[1].status ==
                                          "1"
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
                                    color: refresh
                                        ? (challengeLevelDetails[2].status ==
                                                "2"
                                            ? Colors.green
                                            : challengeLevelDetails[2].status ==
                                                    "1"
                                                ? Colors.amber
                                                : Colors.grey)
                                        : (widget.challengeLevelDetails[2]
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
                                  refresh
                                      ? challengeLevelDetails[2].levelName
                                      : widget
                                          .challengeLevelDetails[2].levelName,
                                  style: GoogleFonts.roboto(
                                      color: refresh
                                          ? (challengeLevelDetails[2].status ==
                                                  "2"
                                              ? Colors.green
                                              : challengeLevelDetails[2]
                                                          .status ==
                                                      "1"
                                                  ? Colors.amber
                                                  : Colors.grey)
                                          : (widget.challengeLevelDetails[2]
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
                                refresh
                                    ? (challengeLevelDetails[2].status == "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                                    : (widget.challengeLevelDetails[2].status ==
                                            "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                              ],
                            ),
                          ),
                          Text(
                            refresh
                                ? challengeLevelDetails[2].points
                                : widget.challengeLevelDetails[2].points,
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
                            color: refresh
                                ? (challengeLevelDetails[2].status == "2"
                                    ? Colors.green
                                    : challengeLevelDetails[2].status == "1"
                                        ? Colors.amber
                                        : Colors.grey)
                                : (widget.challengeLevelDetails[2].status == "2"
                                    ? Colors.green
                                    : widget.challengeLevelDetails[2].status ==
                                            "1"
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
                                    color: refresh
                                        ? (challengeLevelDetails[3].status ==
                                                "2"
                                            ? Colors.green
                                            : challengeLevelDetails[3].status ==
                                                    "1"
                                                ? Colors.amber
                                                : Colors.grey)
                                        : (widget.challengeLevelDetails[3]
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
                                  refresh
                                      ? challengeLevelDetails[3].levelName
                                      : widget
                                          .challengeLevelDetails[3].levelName,
                                  style: GoogleFonts.roboto(
                                      color: refresh
                                          ? (challengeLevelDetails[3].status ==
                                                  "2"
                                              ? Colors.green
                                              : challengeLevelDetails[3]
                                                          .status ==
                                                      "1"
                                                  ? Colors.amber
                                                  : Colors.grey)
                                          : (widget.challengeLevelDetails[3]
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
                                refresh
                                    ? (challengeLevelDetails[3].status == "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                                    : (widget.challengeLevelDetails[3].status ==
                                            "2"
                                        ? const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                2.0, 0, 0, 0),
                                            child: CircleAvatar(
                                                radius: 7,
                                                backgroundColor: Colors.green,
                                                child: Icon(
                                                  Icons.done,
                                                  size: 12,
                                                  color: Colors.white,
                                                )),
                                          )
                                        : Container())
                              ],
                            ),
                          ),
                          Text(
                            refresh
                                ? challengeLevelDetails[3].points
                                : widget.challengeLevelDetails[3].points,
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
                                  child: Image.network(
                                      "${widget.challengeUserChallengeDTOs[index].challengeLogo}")),
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
                              padding: EdgeInsets.all(7.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                        text: TextSpan(
                                            style: GoogleFonts.roboto(
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  "Just share your ${widget.challengeUserChallengeDTOs[index].challengeName} affiliate link and",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                                  " earn ${widget.challengeUserChallengeDTOs[index].awardPoints} points ",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600))
                                        ])),
                                  ),
                                  // Text(
                                  //     "Just share your ${widget.challengeUserChallengeDTOs[index].challengeName} affiliate link and",
                                  //     style: GoogleFonts.roboto(fontSize: 15)),
                                  // Text(
                                  //     "earn ${widget.challengeUserChallengeDTOs[index].awardPoints} points ",
                                  //     style: GoogleFonts.roboto(
                                  //         fontSize: 17,
                                  //         fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.82,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CustomPaint(
                                painter: DashedBorderPainter(borderRadius: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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

  _handleRefresh() async {
    final user = await SimplePreferences().getUser();
    // print(data);

    try {
      final challenge = await http.get(
        Uri.http('10.1.177.123:9000',
            'api/userChallenges/getByUsername/${user?[0].toString()}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var Data = jsonDecode(challenge.body);
      print(Data);

      // Iterate through userChallengeDTOs in the challenge
      // for (var userChallengeDTO in Data['userChallengeDTOs']) {
      //   challengeUserChallengeDTOs.add(UserChallengeDTO(
      //     challengeLogo: userChallengeDTO['challengeLogo'],
      //     challengeName: userChallengeDTO['challengeName'],
      //     pointsEarned: userChallengeDTO['pointsEarned'],
      //     awardPoints: userChallengeDTO['awardPoints'],
      //     affliateLink: userChallengeDTO['affliateLink'],
      //   ));
      // }
      List<LevelDetail> level = [];

      challengeData = ChallengeData(
        totalPoints: Data['totalPoints'],
        equivalentETB: Data['equivalentETB'],
        levelName: Data['levelName'],
        levelColor: Data['levelColor'],
      );
      // print(challengeLevelDetails[1].status);
      setState(() {
        challengeLevelDetails = [];
        for (var levelDetail in Data['levelDetails']) {
          challengeLevelDetails.add(LevelDetail(
            levelName: levelDetail['levelName'],
            points: levelDetail['points'],
            status: levelDetail['status'],
          ));
          // print(levelDetail['status']);
        }

        print(widget.challengeLevelDetails[3].status);
        // challengeLevelDetails.addAll(level);
        data = [
          challengeData.totalPoints,
          challengeData.equivalentETB,
          challengeData.levelName,
          challengeData.levelColor
        ];
        // widget.challengeData = data;
        SetData(data);
        refresh = true;
        refresh1 = true;
        loading = false;
        setRef();
      });
      const message = 'Updated successfully!';
      Fluttertoast.showToast(msg: message, fontSize: 18);
      // print("heeeee");
      // SimplePreferences preferences = SimplePreferences();
      // await preferences.setData(data);
      // for (int i = 0; i < challengeLevelDetails.length; i++) {
      //   print("hereeee we go !!!${challengeLevelDetails[i].levelName}");
      // }
    } catch (e) {
      print(e.toString());
      const message = 'Something went wrong! please try again.';
      Fluttertoast.showToast(msg: e.toString(), fontSize: 18);
    }
  }

  _handleRefresh3() async {
    final user = await SimplePreferences().getUser();
    try {
      final challenge = await http.get(
        Uri.http('10.1.177.123:9000',
            'api/userChallenges/getByUsername/${user?[0].toString()}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var Data = jsonDecode(challenge.body);
      print(Data);
      setState(() {
        challengeLevelDetails = [];
        for (var levelDetail in Data['levelDetails']) {
          challengeLevelDetails.add(LevelDetail(
            levelName: levelDetail['levelName'],
            points: levelDetail['points'],
            status: levelDetail['status'],
          ));
          // print(levelDetail['status']);
        }
        loading = false;
        refresh = true;
      });
    } catch (e) {}
  }

  _handleRefresh1() async {
    final myData = await SimplePreferences().getData();
    print(myData);

    _handleRefresh3();
    try {
      setState(() {
        // print(widget.challengeLevelDetails[3].status);
        // challengeLevelDetails.addAll(level);
        data = [];
        data = [myData?[0], myData?[1], myData?[2], myData?[3]];
        print("heeeeessss");
        print(data);
        // data = myData!.isNotEmpty ? myData : [" "];
        refresh1 = true;
        setRef();
      });
    } catch (e) {
      print(e.toString());
      const message = 'Something went wrong! please try again.';
      Fluttertoast.showToast(msg: e.toString(), fontSize: 18);
    }
  }

  void getref() async {
    final ref = await SimplePreferences().getRefresh();
    if (ref == "true") {
      _handleRefresh1();
      setState(() {
        refresh = false;
        loading = true;
      });
    }
  }

  void setRef() async {
    SimplePreferences preferences = SimplePreferences();
    await preferences.setRefresh("true");
  }
}

void SetData(List<String> data) async {
  SimplePreferences preferences = SimplePreferences();
  await preferences.setData(data);
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

    final dashWidth = 3;
    final dashSpace = 3;

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

// class DataModel extends ChangeNotifier {
//   late ChallengeData challengeData;
//   List<LevelDetail> challengeLevelDetails = [];
//   List<String> data = [];

//   void addItem(String item) async {
//     final user = await SimplePreferences().getUser();
//     try {
//       final challenge = await http.get(
//         Uri.http('10.1.177.123:9000',
//             'api/userChallenges/getByUsername/${user?[0].toString()}'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       var Data = jsonDecode(challenge.body);
//       challengeData = ChallengeData(
//         totalPoints: Data['totalPoints'],
//         equivalentETB: Data['equivalentETB'],
//         levelName: Data['levelName'],
//         levelColor: Data['levelColor'],
//       );
//       // print(challengeLevelDetails[1].status);
//       challengeLevelDetails = [];
//       for (var levelDetail in Data['levelDetails']) {
//         challengeLevelDetails.add(LevelDetail(
//           levelName: levelDetail['levelName'],
//           points: levelDetail['points'],
//           status: levelDetail['status'],
//         ));
//         // print(levelDetail['status']);
//       }
//       // challengeLevelDetails.addAll(level);
//       data = [
//         challengeData.totalPoints,
//         challengeData.equivalentETB,
//         challengeData.levelName,
//         challengeData.levelColor
//       ];
//     } catch (e) {}
//     notifyListeners();
//   }
// }
