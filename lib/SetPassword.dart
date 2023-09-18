// import 'package:cooplay/Confirm_OTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';

// ignore: camel_case_types
class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

// ignore: camel_case_types
class _SetPasswordState extends State<SetPassword> {
  // bool _passwordVisible = false;
  // bool _passwordVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors_selector.primaryColor,
          body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Container(
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
            child: Column(children: [
              const SizedBox(height: 20),
              AppBar(
                backgroundColor: Colors_selector.tertiaryColor,
                elevation: 0, // Set elevation to 0 to remove shadow

                // title: Text("title"),
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors_selector.tertiaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 5)
                    ],
                  ),
                  child: Material(
                    color: Colors_selector.tertiaryColor,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
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
                    0, 10, 20, 10), // Add padding values as needed
                child: Text(
                  'Create new password?'.tr,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 10, 20, 20), // Add padding values as needed
                child: Text(
                  "Your new password should be both unique and easily memorable for future reference.",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors_selector.tertiaryColor,
                      border: Border.all(color: Colors_selector.primmary1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        // keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        // controller: pnumber,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors_selector.primmary1),
                          ),
                          border: InputBorder.none,
                          labelText: "New Password*".tr,
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
                      border: Border.all(color: Colors_selector.primmary1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        // keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        // controller: pnumber,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors_selector.primmary1),
                          ),
                          border: InputBorder.none,
                          labelText: "Confirm New Password*".tr,
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
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login_page()),
                    );
                  },
                  child: SizedBox(
                    height: 50, // Adjust the height as needed
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors_selector.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Reset Password".tr,
                          style: TextStyle(
                            color: Colors_selector.tertiaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        )),
      )),
    );
  }
}
