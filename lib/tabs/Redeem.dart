import 'dart:convert';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty_app/utils/simple_preference.dart';

TextEditingController amount = TextEditingController();
double converted = 0;

class Redeem extends StatefulWidget {
  const Redeem({super.key});

  @override
  State<Redeem> createState() => _RedeemState();
}

class Settings {
  final double exchangeRate;
  final double withdrawalLimit;

  Settings({required this.exchangeRate, required this.withdrawalLimit});
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
  List<Settings> setting = [];
  bool enable = false;
  FocusNode amountFocus = FocusNode();
  List? data;
  TextEditingController pnumber = TextEditingController();

  @override
  void initState() {
    setState(() {
      amount.text = "";
      convert = "";
      converted = 0;
      enable = false;
    });
    super.initState();
    fetchPackages();
    fetchSettings();
    // KeyboardVisibilityNotification().addNewListener(
    //   onChange: (bool visible) {
    //     setState(() {
    //       enable = visible;
    //     });

    //     // Disable the text field when the keyboard is closed
    //     if (!visible) {
    //       amountFocus.unfocus();
    //     }
    //   },
    // );
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
                  loading
                      ? "Currently you have - points"
                      : "Currently you have ${data?[0]} points",
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
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 4),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 100,
                              width: 110,
                              color: convert == redeemOptions[index].title
                                  ? Colors_selector.primaryColor
                                  : Colors.white,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    enable = true;
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
                          Text(
                              "${setting.isNotEmpty ? setting[0].exchangeRate : 0} points = 1 ETB",
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
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors_selector.tertiaryColor,
                                          border: Border.all(
                                              color: Colors_selector.primmary1),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 20,
                                            width: 50,
                                            child: TextFormField(
                                              onTapOutside: (event) {
                                                amountFocus.unfocus();
                                              },
                                              enabled: enable,
                                              onChanged: (value) => converted =
                                                  double.parse(amount.text) /
                                                      setting[0].exchangeRate,
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                LengthLimitingTextInputFormatter(
                                                    5),
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              controller: amount,
                                              focusNode: amountFocus,
                                              // maxLength: 5,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors_selector
                                                          .primmary1),
                                                ),
                                                border: InputBorder.none,
                                                // labelText: "Phone Number*".tr,
                                                labelStyle:
                                                    GoogleFonts.playfairDisplay(
                                                  fontSize: 13,
                                                  color: Colors_selector.grey,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // onEditingComplete: () {
                                              //   // Perform your setState operation here
                                              //   amount.clear();
                                              // },
                                            )),
                                      ),
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
                                  "Balance ${loading ? "-" : data?[0]}",
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
                                      "${converted}",
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
                                  loading
                                      ? ""
                                      : "Balance ${double.parse(data?[0]) / setting[0].exchangeRate} ETB",
                                  style: GoogleFonts.roboto(color: Colors.grey),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Text(
                    converted != 0
                        ? "Only ${converted} points will be converted"
                        : "",
                    style: GoogleFonts.roboto(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        converted > 1 &&
                                (convert == "Safaricom" ||
                                    convert == "Ethiotelecom")
                            ? showChallengeDialog(context, converted, convert)
                            : null;
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: converted > 1
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

  void fetchSettings() async {
    try {
      final response = await http.get(
          Uri.http('10.1.177.123:9000', '/api/settings/getSettings'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      var settings = jsonDecode(response.body);
      for (var set in settings) {
        var sets = Settings(
            exchangeRate: set['exchangeRate'],
            withdrawalLimit: set['withdrawalLimit']);
        setting.add(sets);
      }
      print(settings);
    } catch (e) {
      print(e);
    }
  }

  void fetchPackages() async {
    try {
      data = await SimplePreferences().getData();
      print(data);

      final response = await http.get(
        Uri.http('10.1.177.123:9000', '/api/packages/getPackages'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var packages = jsonDecode(response.body);
      // print(packages);
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
      // print(data[0]);
      setState(() {
        loading = false;
        converted = 0;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void showChallengeDialog(
          BuildContext context, double value, String convert) =>
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors_selector.tertiaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        "You are about to buy a ${value.toInt()} birr $convert airtime."
                            .tr,
                        style: GoogleFonts.roboto(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ElevatedButton(
                      //     // ignore: duplicate_ignore
                      //     style: ElevatedButton.styleFrom(
                      //         primary: Colors_selector.primaryColor),
                      //     child: Text(
                      //       "Gifts".tr,
                      //       style: const TextStyle(
                      //           fontSize: 20, fontWeight: FontWeight.w600),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //       // Navigator.push(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => Challenges()));
                      //     }),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please enter the phone number to be recharged".tr,
                        style: GoogleFonts.roboto(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors_selector.tertiaryColor,
                              border:
                                  Border.all(color: Colors_selector.primmary1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: pnumber,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors_selector.primmary1),
                                  ),
                                  border: InputBorder.none,
                                  labelText: "Phone Number*".tr,
                                  labelStyle: GoogleFonts.playfairDisplay(
                                    fontSize: 13,
                                    color: Colors_selector.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors_selector.primaryColor),
                          child: Text(
                            "Redeem".tr,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Challenges()));
                          }),
                      const SizedBox(height: 15),
                    ],
                  ),
                ));
          });
}
