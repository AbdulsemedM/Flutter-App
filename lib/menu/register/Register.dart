import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/menu/register/Register1.dart';
// import 'package:social_share_plugin/social_share_plugin.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController gname = TextEditingController();
  TextEditingController mname = TextEditingController();
  Color circularColor = Colors_selector.pair1;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(25.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Profile2()),
        //         );
        //       },
        //       child: Image.network(
        //         "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_100_100/0/1657298878780?e=1678924800&v=beta&t=PbUKUn0qwRpF43rYt0bISoE6PYYusRI3BrvkMU3SP0Y",
        //         height: 50.0,
        //         width: 50.0,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Register".tr),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.monetization_on_sharp,
                color: Colors.yellowAccent),
            tooltip: 'Conis',
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("data")),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
          width: MediaQuery.of(context).size.height * 1,
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to your bank!",
                      style: TextStyle(
                          color: Colors_selector.secondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Getting started",
                        style: TextStyle(
                            color: Colors_selector.secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: fname,
                        decoration: InputDecoration(
                          label: Text("First name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name format";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: lname,
                        decoration: InputDecoration(
                          label: Text("Father's name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name format";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: gname,
                        decoration: InputDecoration(
                          label: Text("Grandfather's name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name format";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: mname,
                        decoration: InputDecoration(
                          label: Text("Mother's name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name format";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
                          child: FloatingActionButton(
                            onPressed: () {
                              nextPage();
                              // if (formKey.currentState!.validate()) {
                              //   final snackbar =
                              //       SnackBar(content: Text("submitting form"));
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(content: Text("your text")));
                              // },
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => register1()));
                            },
                            child: Icon(Icons.navigate_next_rounded),
                            backgroundColor: Colors_selector.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: circularColor,
                  ),
                ],
              ),
            ],
          ),
          // child: Column(children: [Text("data")]),
        ),
      )),
    );
  }

  nextPage() async {
    if (fname.text.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(fname.text)) {
      const message = 'First name is invalid';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (lname.text.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(lname.text)) {
      const message = "Father's name is invalid";
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (gname.text.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(gname.text)) {
      const message = "Grandfather's name is invalid";
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (mname.text.isEmpty ||
        !RegExp(r'^[a-z A-Z]+$').hasMatch(mname.text)) {
      const message = "Mother's name is invalid";
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else {
      setState(() {
        circularColor = Colors_selector.secondaryColor;
      });

      // var duration = const Duration(milliseconds: 3000);
      // sleep(duration);
      // Future.delayed(duration);
      const message = "Just a moment";
      Future.delayed(const Duration(milliseconds: 300), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
      Timer(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const register1()));
      });
      setState(() {
        circularColor = Colors_selector.pair1;
      });
    }
  }
}
