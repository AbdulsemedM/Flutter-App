// ignore: file_names
import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:protest/Confirm_OTP.dart';
import 'package:loyalty_app/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loyalty_app/login_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController pnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  Color circularColor = Colors_selector.pair1;
  TextEditingController rcode = TextEditingController();
  bool _passwordVisible1 = false;
  bool _passwordVisible = false;
  bool loading = false;

  Signup() async {
    // String pn = pnumber.text;
    // print(pn);

    if (fname.text.isEmpty) {
      const message = 'First name is mandatory';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (pnumber.text.length != 10 || pnumber.text == "") {
      const message = 'Invalid phone number format';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (password.text != cpassword.text || password.text == "") {
      const message = 'Invalid password';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else {
      setState(() {
        loading = true;
      });
      final body = jsonEncode({
        "username": pnumber.text,
        "password": password.text,
        "fullName": "${fname.text} ${lname.text}",
        "roles": [
          {"roleName": "loyaltyAppUser"}
        ]
      });
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        // 'Content-Length': body.length.toString(),
        // Add any other headers if required
      };
      const apiUrl = 'http://63.34.29.151:9000/api/users/createUser';
      print(body);
      // setState(() {
      //   loading = false;
      // });
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          loading = false;
        });
        const message = 'Account Created Successfuly!';
        Future.delayed(const Duration(milliseconds: 100), () {
          Fluttertoast.showToast(msg: message, fontSize: 18);
        });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_page()));
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
        const message = 'Account Creation Faild!';
        Fluttertoast.showToast(msg: message, fontSize: 18);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors_selector.primaryColor,
        // appBar: AppBar(
        //   title: Text("Signup".tr),
        //   backgroundColor: Colors_selector.primaryColor,
        // ),

        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Container(
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
                    const SizedBox(height: 20),
                    AppBar(
                      backgroundColor: Colors_selector.pair1,
                      elevation: 0, // Set elevation to 0 to remove shadow

                      // title: Text("title"),
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors_selector.pair1,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5)
                          ],
                        ),
                        child: Material(
                          color: Colors_selector.pair2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(
                                  context); // Navigate back to the previous screen
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          20, 10, 20, 10), // Add padding values as needed
                      child: Text(
                        'Hello, Register to get started!',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: fname,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors_selector.primmary1),
                                ),
                                border: InputBorder.none,
                                labelText: "First Name*".tr,
                                labelStyle: GoogleFonts.playfairDisplay(
                                  fontSize: 16,
                                  color: Colors_selector.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: lname,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors_selector.primmary1),
                                ),
                                border: InputBorder.none,
                                labelText: "Last Name".tr,
                                labelStyle: GoogleFonts.playfairDisplay(
                                  fontSize: 16,
                                  color: Colors_selector.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
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
                                  fontSize: 16,
                                  color: Colors_selector.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: password,
                            obscureText: !_passwordVisible1,
                            decoration: InputDecoration(
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(
                              //       color: Colors_selector.secondaryColor),
                              // ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors_selector.primmary1),
                              ),
                              border: InputBorder.none,
                              labelText: "Password*".tr,
                              labelStyle: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                color: Colors_selector.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: IconButton(
                                // tooltip: "show password",
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                              ),
                            ),
                            // onChanged: (passwprd) => Password = passwprd,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors_selector.tertiaryColor,
                            border: Border.all(
                                color: Colors_selector.tertiaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: cpassword,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors_selector.primmary1),
                              ),
                              border: InputBorder.none,
                              labelText: "Confirm Password*".tr,
                              labelStyle: GoogleFonts.playfairDisplay(
                                fontSize: 16,
                                color: Colors_selector.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: IconButton(
                                // tooltip: "show password",
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            // onChanged: (cpassword) => Cpassword = cpassword,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Colors_selector.tertiaryColor,
                    //         border:
                    //             Border.all(color: Colors_selector.tertiaryColor),
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(left: 10),
                    //       child: TextFormField(
                    //         controller: rcode,
                    //         decoration: InputDecoration(
                    //             // enabledBorder: UnderlineInputBorder(
                    //             //   borderSide: BorderSide(
                    //             //       color: Colors_selector.secondaryColor),
                    //             // ),
                    //             focusedBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors_selector.primmary1),
                    //             ),
                    //             border: InputBorder.none,
                    //             labelText: "Referal Code".tr),
                    //         // onChanged: (rcode) => Rcode = rcode,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    loading
                        ? CircularProgressIndicator(
                            color: Colors_selector.secondaryColor,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 5),
                            child: GestureDetector(
                              onTap: () {
                                Signup();
                              },
                              child: SizedBox(
                                height: 50,
                                child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Colors_selector.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      "Signup".tr,
                                      style: TextStyle(
                                          color: Colors_selector.tertiaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ),
                          ),
                  ])),
            ),
          ),
        ));
  }
}
