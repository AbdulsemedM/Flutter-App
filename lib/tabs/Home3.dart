import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors_selector.tertiaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
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
                              padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
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
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(" = 10,000 ETB",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20, color: Colors.grey)),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 96.0, 0, 0),
                                  child: Row(
                                    children: [
                                      Icon(
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
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
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
                              border: Border.all(color: Colors.grey),
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
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.done,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width *
                          0.04, // Width of the line
                      decoration: BoxDecoration(
                        color: Colors.red, // Color of the line
                        borderRadius:
                            BorderRadius.circular(2), // Adjust as needed
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
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.done,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width *
                          0.04, // Width of the line
                      decoration: BoxDecoration(
                        color: Colors.red, // Color of the line
                        borderRadius:
                            BorderRadius.circular(2), // Adjust as needed
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
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.done,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width *
                          0.04, // Width of the line
                      decoration: BoxDecoration(
                        color: Colors.red, // Color of the line
                        borderRadius:
                            BorderRadius.circular(2), // Adjust as needed
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
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(2.0, 0, 0, 0),
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.done,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
