// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
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
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(223, 182, 77, 1),
                          Color.fromRGBO(223, 182, 77, 1)
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
                                    "1024 ",
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
                                  child: Text(" = 10 ETB",
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
                                    const Icon(
                                      Icons.swap_horiz_sharp,
                                      color: Color.fromRGBO(223, 182, 77, 1),
                                    ),
                                    Text(
                                      " Exchange",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          color: const Color.fromRGBO(
                                              223, 182, 77, 1)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30.0, 0, 0, 0),
                                      child: Text(
                                        " History >",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16, color: Colors.white),
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
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(223, 182, 77, 1),
                                        child: Image.asset(
                                            "assets/images/michu.png"),
                                      )))),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      "PLATINIUM",
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
                  padding: const EdgeInsets.all(23.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.green),
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
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                  child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.done,
                                        size: 12,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "100 Points",
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
                          color: Colors.green, // Color of the line
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
                                border: Border.all(color: Colors.green),
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
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                  child: CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.done,
                                        size: 12,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "500 Points",
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
                          color: Colors.green, // Color of the line
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
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
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
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                //   child: CircleAvatar(
                                //       radius: 10,
                                //       backgroundColor: Colors.green,
                                //       child: Icon(
                                //         Icons.done,
                                //         size: 12,
                                //         color: Colors.white,
                                //       )
                                //       ),
                                // )
                              ],
                            ),
                          ),
                          Text(
                            "1000 Points",
                            style: GoogleFonts.roboto(
                                fontSize: 12, color: Colors_selector.grey),
                          )
                        ],
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width *
                            0.04, // Width of the line
                        decoration:
                            BoxDecoration(color: Colors.grey // Adjust as needed
                                ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
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
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                // const Padding(
                                //   padding:
                                //       const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                //   child: CircleAvatar(
                                //       radius: 10,
                                //       backgroundColor: Colors.green,
                                //       child: Icon(
                                //         Icons.done,
                                //         size: 12,
                                //         color: Colors.white,
                                //       )),
                                // )
                              ],
                            ),
                          ),
                          Text(
                            "2500 Points",
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
                        child: Icon(
                          Icons.redeem,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "Refere your friends and earn ",
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text("300 Points ",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Text(
                            "Every time one of your friends uses your code when signing in he gets 300 points and you will get 300 points",
                            style: GoogleFonts.roboto(fontSize: 15)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.83,
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: CustomPaint(
                          painter: DashedBorderPainter(borderRadius: 1),
                          child: Container(
                            // This nested container will contain the content of your main container
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    "https://play.google.com/store/apps/details?\nid=om.example.michuapp&user_id=1",
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
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Clipboard.setData(const ClipboardData(
                                                text:
                                                    "https://play.google.com/store/apps/details?\nid=om.example.michuapp&user_id=1"));
                                            // Fluttertoast.showToast(
                                            //     msg: "Copied to clipboard",
                                            //     fontSize: 18);
                                          },
                                          child: Icon(Icons.copy),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //   ),
                // )
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
