import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class RedeemOptions {
  final String image;
  final String title;
  final String capacity;

  RedeemOptions({
    required this.image,
    required this.title,
    required this.capacity,
  });
}

class _RedeemState extends State<Redeem> {
  final List<RedeemOptions> Data = [
    RedeemOptions(
        image: "assets/images/dstv.png",
        title: "DStv",
        capacity: "Meda package"),
    RedeemOptions(
        image: "assets/images/etb.png",
        title: "To account",
        capacity: "156 ETB"),
    RedeemOptions(
        image: "assets/images/topup.png",
        title: "Mobile Top-up",
        capacity: "156 ETB"),
    // RedeemOptions(
    //     image: "", title: "To wallet", capacity: "433ETB"),
    RedeemOptions(
        image: "assets/images/canal.png",
        title: "Canal Plus",
        capacity: "Gojo package"),
    RedeemOptions(
        image: "assets/images/donate.jpg",
        title: "Donate",
        capacity: "156 ETB"),
    RedeemOptions(
        image: "assets/images/dstv.png",
        title: "DStv",
        capacity: "Meda package"),
    RedeemOptions(
        image: "assets/images/etb.png",
        title: "To account",
        capacity: "156 ETB"),
    RedeemOptions(
        image: "assets/images/topup.png",
        title: "Mobile Top-up",
        capacity: "156 ETB"),
    // RedeemOptions(
    //     image: "", title: "To wallet", capacity: "433ETB"),
    RedeemOptions(
        image: "assets/images/canal.png",
        title: "Canal Plus",
        capacity: "Gojo package"),
    RedeemOptions(
        image: "assets/images/donate.jpg",
        title: "Donate",
        capacity: "156 ETB"),
    // RedeemOptions(
    //     image: Image.asset(""), title: "Git card", capacity: "673ETB"),
    // RedeemOptions(
    //     image: Image.asset(""), title: "Point Transfer", capacity: "349ETB"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.tertiaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height * 1.01,
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
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                    child: Text(
                  "Redeem your points",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700, fontSize: 20),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "You can choose one of the options to redeem your points.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Currently you have 1024 points",
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: GridView.builder(
                    itemCount: Data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 4),
                    itemBuilder: (BuildContext context, int index) {
                      // return Container(
                      //   width:
                      //       30, // Adjust the width of the container as needed
                      //   height:
                      //       50, // Adjust the height of the container as needed
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(color: Colors.grey, width: 2),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Icon(
                      //         Icons.abc,
                      //         size: 20, // Adjust the icon size as needed
                      //         color: Colors_selector
                      //             .secondaryColor, // Adjust the icon color as needed
                      //       ),
                      //       // SizedBox(height: 10),
                      //       Text(
                      //         "name",
                      //         style: TextStyle(
                      //             fontSize: 10, fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // );
                      return Container(
                        height: 100,
                        width: 110,
                        child: Card(
                          shadowColor: Colors.cyan,
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Image.asset(
                                    Data[index].image,
                                    height: 40,
                                    width: 70,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  Data[index].title,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                ),
                              ),
                              // Text(
                              //   Data[index].capacity,
                              //   style: GoogleFonts.roboto(
                              //     color: Colors.grey,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Text("Convert Points",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors_selector.primaryColor)),
                          Text("10 points = 1 ETB",
                              style: GoogleFonts.roboto(
                                  color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors_selector.pair2,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(223, 182, 77, 1),
                                ),
                              ),
                              Text(
                                "Points",
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    // color: Color.fromRGBO(223, 182, 77, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "344|",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          // color: Color.fromRGBO(223, 182, 77, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Balance 1024",
                                  style: GoogleFonts.roboto(color: Colors.grey),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_downward),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors_selector.pair2,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child:
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "ETB",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      // color: Color.fromRGBO(223, 182, 77, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "3",
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          // color: Color.fromRGBO(223, 182, 77, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Balance 10 ETB",
                                  style: GoogleFonts.roboto(color: Colors.grey),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Only 344 point will be converted",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: GestureDetector(
                      // onTap: () {
                      //   login();
                      // },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors_selector
                              .primmary1, // You can use your color here
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Convert points to ETB",
                            style: GoogleFonts.roboto(
                              color:
                                  Colors.white, // You can use your color here
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
