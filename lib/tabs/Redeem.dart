import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:http/http.dart' as http;

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class RedeemOptions {
  final String image;
  final String title;
  final String capacity;
  final bool isEnabled;

  RedeemOptions({
    required this.image,
    required this.title,
    required this.capacity,
    required this.isEnabled,
  });
}

class _RedeemState extends State<Redeem> {
  List<RedeemOptions> redeemOptions = [];

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  bool loading = true;
  String convert = "";
  bool converts = false;

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
              loading
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors_selector.primaryColor,
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: GridView.builder(
                          itemCount: redeemOptions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 4),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 100,
                              width: 110,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (redeemOptions[index].isEnabled) {
                                      convert = redeemOptions[index].title;
                                      converts = true;
                                    } else {
                                      var message =
                                          'Sorry ${redeemOptions[index].title} is not active for now';
                                      Fluttertoast.showToast(
                                          msg: message, fontSize: 18);
                                      setState(() {
                                        converts = false;
                                        convert = "";
                                      });
                                    }
                                  });
                                },
                                child: Card(
                                  color: redeemOptions[index].isEnabled
                                      ? Colors.white
                                      : Colors.grey[200],
                                  shadowColor: Colors.cyan,
                                  child: Column(
                                    children: [
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Image.network(
                                            redeemOptions[index].image,
                                            height: 40,
                                            width: 70,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          redeemOptions[index].title,
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
                          color: converts
                              ? Colors_selector.primmary1
                              : Colors_selector
                                  .pair2, // You can use your color here
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Convert points to $convert",
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

  void fetchPackages() async {
    try {
      final response = await http.get(
        Uri.http('10.1.177.123:9000', '/api/packages/getPackages'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var packages = jsonDecode(response.body);
      List<RedeemOptions> newRedeemOptions = [];

      for (var package in packages) {
        // print(transaction.date);
        var packageData = RedeemOptions(
            image: package['logo'],
            title: package['packageName'],
            capacity: package['packageId'].toString(),
            isEnabled: package['isEnabeled']);
        newRedeemOptions.add(packageData);
      }
      redeemOptions.addAll(newRedeemOptions);
      print(redeemOptions[0].isEnabled);
      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
