// import 'package:cooplay/Confirm_OTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/Confirm_OTP.dart';
import 'package:loyalty_app/colors.dart';

// ignore: camel_case_types
class Forgot_pw extends StatefulWidget {
  const Forgot_pw({Key? key}) : super(key: key);

  @override
  _Forgot_pwState createState() => _Forgot_pwState();
}

// ignore: camel_case_types
class _Forgot_pwState extends State<Forgot_pw> {
  // bool _passwordVisible = false;
  // bool _passwordVisible1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppBar(
            backgroundColor: Colors_selector.pair1,
            elevation: 0, // Set elevation to 0 to remove shadow

            // title: Text("title"),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors_selector.pair1,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)
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
                0, 10, 20, 10), // Add padding values as needed
            child: Text(
              'Forgot Password?',
              style: GoogleFonts.playfairDisplay(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                20, 10, 20, 20), // Add padding values as needed
            child: Text(
              "Don't worry! It occurs. Please enter the phone number linked with your account",
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
                  border: Border.all(color: Colors_selector.tertiaryColor),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // controller: pnumber,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors_selector.primmary1),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors_selector.tertiaryColor,
          //         border: Border.all(color: Colors_selector.tertiaryColor),
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: TextField(
          //         obscureText: !_passwordVisible,
          //         decoration: InputDecoration(
          //           enabledBorder: UnderlineInputBorder(
          //             borderSide:
          //                 BorderSide(color: Colors_selector.secondaryColor),
          //           ),
          //           focusedBorder: UnderlineInputBorder(
          //             borderSide:
          //                 BorderSide(color: Colors_selector.secondaryColor),
          //           ),
          //           border: InputBorder.none,
          //           labelText: "New Password".tr,
          //           suffixIcon: IconButton(
          //             icon: Icon(
          //               // Based on passwordVisible state choose the icon
          //               _passwordVisible
          //                   ? Icons.visibility
          //                   : Icons.visibility_off,
          //               color: Theme.of(context).primaryColorDark,
          //             ),
          //             onPressed: () {
          //               // Update the state i.e. toogle the state of passwordVisible variable
          //               setState(() {
          //                 _passwordVisible = !_passwordVisible;
          //               });
          //             },
          //           ),
          //         ),
          //         // keyboardType: TextInputType.number,
          //         // inputFormatters: <TextInputFormatter>[
          //         //   FilteringTextInputFormatter.digitsOnly
          //         // ],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 25),
          //     child: Container(
          //       decoration: BoxDecoration(
          //           color: Colors_selector.tertiaryColor,
          //           border: Border.all(color: Colors_selector.tertiaryColor),
          //           borderRadius: BorderRadius.circular(20)),
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 10),
          //         child: TextField(
          //           obscureText: !_passwordVisible1,
          //           decoration: InputDecoration(
          //             enabledBorder: UnderlineInputBorder(
          //               borderSide:
          //                   BorderSide(color: Colors_selector.secondaryColor),
          //             ),
          //             focusedBorder: UnderlineInputBorder(
          //               borderSide:
          //                   BorderSide(color: Colors_selector.secondaryColor),
          //             ),
          //             border: InputBorder.none,
          //             labelText: "Confirm Password".tr,
          //             suffixIcon: IconButton(
          //               icon: Icon(
          //                 // Based on passwordVisible state choose the icon
          //                 _passwordVisible1
          //                     ? Icons.visibility
          //                     : Icons.visibility_off,
          //                 color: Theme.of(context).primaryColorDark,
          //               ),
          //               onPressed: () {
          //                 // Update the state i.e. toogle the state of passwordVisible variable
          //                 setState(() {
          //                   _passwordVisible1 = !_passwordVisible1;
          //                 });
          //               },
          //             ),
          //             // keyboardType: TextInputType.number,
          //             // inputFormatters: <TextInputFormatter>[
          //             //   FilteringTextInputFormatter.digitsOnly
          //             // ],
          //           ),
          //         ),
          //       ),
          //     )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Confirm_OTP()),
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
                      "Send OTP".tr,
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
    )));
  }
}
