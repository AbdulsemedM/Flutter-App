// ignore: file_names
import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Signup() async {
    String pn = pnumber.text;
    print(fname.text.isEmpty);

    if (password.text != cpassword.text || password.text == "") {
      const message = 'Invalid password';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (pnumber.text.length != 10 ||
        pn[0] + pn[1] != "09" ||
        pnumber.text == "") {
      const message = 'Invalid phone number format';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (fname.text.isEmpty) {
      const message = 'First name is mandatory';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else {
      setState(() {
        circularColor = Colors_selector.secondaryColor;
      });
      final body = jsonEncode({
        "username": pnumber.text,
        "password": password.text,
        "fullName": fname.text + " " + lname.text,
        "roles": [
          {"roleName": "cooplayer"}
        ]
      });
      var response = await http.post(
          Uri.http("localhost:6000", "/api/users/createUser"),
          headers: {"Content-Type": "application/json"},
          body: body);
      print(response.body);
      if (response.statusCode == 200) {
        const message = 'Account Created Successfuly!';
        Future.delayed(const Duration(milliseconds: 100), () {
          Fluttertoast.showToast(msg: message, fontSize: 18);
        });

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_page()));
        setState(() {
          circularColor = Colors_selector.pair1;
        });
      } else {
        setState(() {
          circularColor = Colors_selector.pair1;
        });
        const message = 'Account Creation Faild!';
        Fluttertoast.showToast(msg: message, fontSize: 18);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text("Signup".tr),
          backgroundColor: Colors_selector.primaryColor,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors_selector.pair1, Colors_selector.pair2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Column(children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors_selector.tertiaryColor,
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: fname,
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
                              labelText: "First Name*".tr),
                          // onChanged: (fname) => Fname = fname,
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
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: lname,
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
                              labelText: "Last Name".tr),
                          // onChanged: (lname) => Lname = lname,
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
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: pnumber,
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
                              labelText: "Phone Number*".tr),
                          // validator: (pnumber) {
                          //   if (pnumber == null || pnumber.trim().isEmpty) {
                          //     return 'This field is required';
                          //   }
                          //   if (pnumber.trim().length < 10) {
                          //     return 'Phone number must be 10 characters in length';
                          //   }
                          //   // Return null if the entered username is valid
                          //   return null;
                          // },
                          // onChanged: (pnumber) => Pnumber = pnumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
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
                              borderSide:
                                  BorderSide(color: Colors_selector.primmary1),
                            ),
                            border: InputBorder.none,
                            labelText: "Password*".tr,
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
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: cpassword,
                          // validator: ((String? value) {
                          //   if (value!.isEmpty) return ("Empty");
                          //   if (value != password) return ("doesn't match");
                          //   return null;
                          // }),
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(
                            //       color: Colors_selector.secondaryColor),
                            // ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors_selector.primmary1),
                            ),
                            border: InputBorder.none,
                            labelText: "Confirm Password*".tr,
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors_selector.tertiaryColor,
                          border:
                              Border.all(color: Colors_selector.tertiaryColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: rcode,
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
                              labelText: "Referal Code".tr),
                          // onChanged: (rcode) => Rcode = rcode,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CircularProgressIndicator(
                    color: circularColor,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        Signup();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors_selector.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
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
                ])),
          ),
        ));
  }
}
