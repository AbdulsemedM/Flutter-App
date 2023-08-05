import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loyalty_app/tabs/Home2.dart';

import '../colors.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Michu extends StatefulWidget {
  const Michu({super.key});

  @override
  State<Michu> createState() => _MichuState();
}

class _MichuState extends State<Michu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const var1 = 9950;
    const member1 = "Premium";
    const member2 = "Gold";
    const member3 = "Silver";
    const member4 = "Bronze";
    const member5 = "Basic";

    final List<String> texts = [
      "Michu is a digital lending platform for MSMEs that uses credit scores to assess risk and growth potential.",
      "Michu will enable Coopbank to address many of the actual challenges of lending to MSMEs in Ethiopia.",
      "Coopbank's adoption of Michu has improved its ease of doing business by streamlining lending processes and removing geographical barriers.",
      "Borrowers can initiate loan applications from anywhere, at any time, without the need for physical movement.",
      "By uploading the necessary documents online, the Michu platform can rapidly communicate loan decisions.",
    ];

    int currentIndex = 0;
    final PageController _controller = PageController();
    // late AnimationController _animationController;
    bool isIconVisible = true;
    void _startAutoSlide() {
      Future.delayed(Duration(seconds: 3), () {
        if (currentIndex < texts.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
        _controller.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoSlide();
      });
    }

    @override
    void initState() {
      super.initState();
      // _animationController = AnimationController(
      //   vsync: this,
      //   duration: Duration(milliseconds: 500),
      // )..addStatusListener((status) {
      //     if (status == AnimationStatus.completed) {
      //       _animationController.reverse();
      //     } else if (status == AnimationStatus.dismissed) {
      //       _animationController.forward();
      //     }
      //   });

      // _animationController.forward();
      _startAutoSlide();
      _controller.addListener(() {
        setState(() {
          currentIndex = _controller.page!.round();
        });
      });
    }

    // @override
    // void dispose() {
    //   _animationController.dispose();
    //   super.dispose();
    // }

    // String selectedOption = 'Option 1';
    // final animationValue = _animationController.value;
    // isIconVisible =
    //     animationValue >= 0.5; // Toggle visibility based on animation value

    return SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.red.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors_selector.secondaryColor,
                                  Colors_selector.secondaryColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 60.0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors_selector
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "$var1 points",
                                                  style: GoogleFonts
                                                      .playfairDisplay(
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            Container(
                                              width: 150,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors_selector
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "37 ETB",
                                                  style: GoogleFonts
                                                      .playfairDisplay(
                                                    fontSize: 16,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white24, // Adjust the circle background color as needed
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            size: 40,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(children: [
                                          Icon(
                                            var1 > 500 && var1 < 799
                                                ? Icons.star_border
                                                : var1 > 800 && var1 < 2999
                                                    ? Icons.emoji_events
                                                    : var1 > 3000 &&
                                                            var1 < 15999
                                                        ? Icons.star_half
                                                        : var1 > 16000 &&
                                                                var1 < 24999
                                                            ? Icons.stars
                                                            : var1 > 25000
                                                                ? Icons.star
                                                                : Icons
                                                                    .abc, // Replace this with your desired icon
                                            size: 30,
                                            color: Colors.blueGrey
                                                .shade50, // Adjust the icon size as needed
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            var1 > 500 && var1 < 799
                                                ? "$member5 Member"
                                                : var1 > 800 && var1 < 2999
                                                    ? "$member4 Member"
                                                    : var1 > 3000 &&
                                                            var1 < 15999
                                                        ? "$member3 Member"
                                                        : var1 > 16000 &&
                                                                var1 < 24999
                                                            ? "$member2 Member"
                                                            : var1 > 25000
                                                                ? "$member1 Member"
                                                                : "",
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 30,
                                                decoration: TextDecoration.none,
                                                color: Colors_selector
                                                    .tertiaryColor),
                                          ),
                                        ])),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // const SingleChildScrollView(
                          //     child: DropdownButtonExample())
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 200, // Adjust the height as needed
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PageView.builder(
                                controller: _controller,
                                itemCount: texts.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          texts[index],
                                          style: GoogleFonts.playfairDisplay(
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                onPageChanged: (index) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          DotsIndicator(
                            dotsCount: texts.length,
                            position: currentIndex.toInt(),
                            decorator: DotsDecorator(
                              activeColor: Colors_selector
                                  .primaryColor, // Adjust the active dot color as needed
                              color: Colors
                                  .grey, // Adjust the inactive dot color as needed
                              activeSize: const Size(20,
                                  10), // Adjust the size of active dot as needed
                              size: const Size(10,
                                  10), // Adjust the size of inactive dot as needed
                              spacing: const EdgeInsets.all(
                                  4), // Adjust the spacing between dots as needed
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ))));
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class IconItems {
  final IconData icon;

  IconItems({
    required this.icon,
  });
}
