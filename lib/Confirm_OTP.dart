import 'package:flutter/material.dart';
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
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    // Initialize focus nodes
    focusNodes = List.generate(4, (_) => FocusNode());

    // Add listeners to each controller
    for (int i = 0; i < otpControllers.length - 1; i++) {
      otpControllers[i].addListener(() {
        if (otpControllers[i].text.length == 1) {
          // Move to the next field
          FocusScope.of(context).requestFocus(focusNodes[i + 1]);
        }
      });
    }
  }

  @override
  void dispose() {
    // Dispose of focus nodes
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors_selector.tertiaryColor,
                      Colors_selector.tertiaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    AppBar(
                      backgroundColor: Colors_selector.tertiaryColor,
                      elevation: 0,
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors_selector.tertiaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                            ),
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
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                      child: Text(
                        'OTP Verification'.tr,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Text(
                        "Enter the verification code we just sent to your mobile phone".tr,
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
                              buildOTPTextField(
                                  otpControllers[0], focusNodes[0]),
                              buildOTPTextField(
                                  otpControllers[1], focusNodes[1]),
                              buildOTPTextField(
                                  otpControllers[2], focusNodes[2]),
                              buildOTPTextField(
                                  otpControllers[3], focusNodes[3]),
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
                                    builder: (context) => SetPassword(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 50,
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
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOTPTextField(
      TextEditingController controller, FocusNode focusNode) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
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
}
