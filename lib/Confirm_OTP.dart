// import 'package:cooplay/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/SetPassword.dart';
import 'package:loyalty_app/colors.dart';
import 'package:get/get.dart';

class Confirm_OTP extends StatefulWidget {
  @override
  _Confirm_OTPState createState() => _Confirm_OTPState();
}

class _Confirm_OTPState extends State<Confirm_OTP> {
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  OTPVerificationScreen() {
    // Add listeners to each controller
    for (int i = 0; i < otpControllers.length - 1; i++) {
      otpControllers[i].addListener(() {
        if (otpControllers[i].text.length == 1) {
          otpControllers[i + 1].text = otpControllers[i].text;
          FocusScope.of(context)
              .requestFocus(otpControllers[i + 1] as FocusNode?);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
            child: Column(
              children: [
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
                            color: Colors.black.withOpacity(0.2), blurRadius: 5)
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
                    'OTP Verification',
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
                    "Enter the verification code we just sent to your mobile phone",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildOTPTextField(otpControllers[0]),
                          buildOTPTextField(otpControllers[1]),
                          buildOTPTextField(otpControllers[2]),
                          buildOTPTextField(otpControllers[3]),
                        ],
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetPassword()),
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
                                  "Verify OTP".tr,
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
                    ],
                  ),
                ),
              ],
            ),
                  ),
                )),
      ),
    );
  }
}

Widget buildOTPTextField(TextEditingController controller) {
  return SizedBox(
    width: 60,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: TextStyle(fontSize: 20),
    ),
  );
}
