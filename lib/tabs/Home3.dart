// ignore_for_file: unnecessary_null_comparison

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/tabs/History.dart';
import 'package:loyalty_app/tabs/Redeem.dart';
import 'package:share/share.dart';
import '../login_page.dart';

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
    // getDatas();
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(18.0, 20, 0, 0),
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
                                    const EdgeInsets.fromLTRB(18, 12, 0, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${widget.challengeData.totalPoints}",
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
                                      " = ${widget.challengeData.equivalentETB} ETB",
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
                                          // fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  )))
                        ],
                      ),
                      // Expanded(
                      //     child: Align(
                      //         alignment: Alignment.topRight,
                      //         child: Padding(
                      //           padding:
                      //               EdgeInsets.fromLTRB(0, 3, 3, 0),
                      //           child: Icon(Icons.sync),
                      //         ))),
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
                                  "${widget.challengeLevelDetails[0].levelName}",
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
                                  "${widget.challengeLevelDetails[1].levelName}",
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
                                  "${widget.challengeLevelDetails[2].levelName}",
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
                                  "${widget.challengeLevelDetails[3].levelName}",
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
                              padding: EdgeInsets.all(13.0),
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

  Future<void> _handleRefresh() async {
    // Perform the data refresh here, update the lists and object
    // You can make network requests or update the data as needed

    // For example:
    // await fetchData();
    // setState(() {
    //   // Update widget's data
    // });

    // Call the callback function to notify the parent widget
    // widget.onRefresh();
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
