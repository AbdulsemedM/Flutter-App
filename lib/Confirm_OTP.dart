// import 'package:cooplay/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:get/get.dart';

class Confirm_OTP extends StatefulWidget {
  @override
  _Confirm_OTPState createState() => _Confirm_OTPState();
}

class _Confirm_OTPState extends State<Confirm_OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
          title: Text("Confirm OTP".tr),
          backgroundColor: Colors_selector.primaryColor),
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
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 100, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors_selector.secondaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors_selector.secondaryColor),
                                ),
                                border: InputBorder.none,
                                labelText: "Confirm OTP".tr),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Login_page(),
                          ),
                        );
                      },
                      child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors_selector.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "Confirm".tr,
                            style: TextStyle(
                                color: Colors_selector.tertiaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  child: Text(
                    "If you didn't get the message tap the resend button bellow."
                        .tr,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 180, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors_selector.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        "Resend".tr,
                        style: TextStyle(
                            color: Colors_selector.tertiaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
