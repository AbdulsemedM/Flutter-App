// ignore: file_names

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:loyalty_app/tabs/Home2.dart';

import '../colors.dart';

enum SocialMedia { facebook, twitter, insatgram, telegram, linkedin, whatsapp }

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Michu extends StatefulWidget {
  const Michu({super.key});

  @override
  State<Michu> createState() => _MichuState();
}

class _MichuState extends State<Michu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const var1 = 20;
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
    // bool isIconVisible = true;
    void _startAutoSlide() {
      Future.delayed(const Duration(seconds: 3), () {
        if (currentIndex < texts.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
        _controller.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
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
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final width = constraints.maxWidth;
      return Scaffold(
        backgroundColor: Colors_selector.primaryColor,
        body: SingleChildScrollView(
            child: SafeArea(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors_selector.pair1,
                              Colors_selector.pair2
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors_selector.primmary1,
                                      Colors_selector.secondaryColor
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Image.asset(
                                              'assets/images/michu.png',
                                              height: 50,
                                              width: 90,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                'assets/images/WhiteLogo.png',
                                                height: 50,
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      "points balance: $var1",
                                      style: GoogleFonts.playfairDisplay(
                                          fontSize: 24,
                                          decoration: TextDecoration.none,
                                          color: var1 > 500 && var1 < 799
                                              ? Colors.lightGreenAccent.shade400
                                              : var1 > 800 && var1 < 2999
                                                  ? Colors.brown.shade700
                                                  : var1 > 3000 && var1 < 15999
                                                      ? Colors.indigo.shade50
                                                      : var1 > 16000 &&
                                                              var1 < 24999
                                                          ? Colors.deepOrange
                                                              .shade900
                                                          : var1 > 25000
                                                              ? Colors.indigo
                                                              : Colors_selector
                                                                  .tertiaryColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.black
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: const Offset(0,
                                                    -4), // Shadow position on the top
                                                blurRadius:
                                                    8, // Shadow blur radius
                                                spreadRadius:
                                                    0, // Shadow spread radius
                                              ),
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: const Offset(0,
                                                    4), // Shadow position on the bottom
                                                blurRadius:
                                                    8, // Shadow blur radius
                                                spreadRadius:
                                                    0, // Shadow spread radius
                                              ),
                                            ]
                                            // borderRadius: BorderRadius.circular(10),
                                            ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Coop",
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                      fontSize: 25,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors_selector
                                                          .primaryColor),
                                            ),
                                            Text("loyal",
                                                style:
                                                    GoogleFonts.playfairDisplay(
                                                        fontSize: 25,
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: Colors_selector
                                                            .secondaryColor))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
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
                                                                      .error, // Replace this with your desired icon
                                              size: 30,
                                              color: var1 > 500 && var1 < 799
                                                  ? Colors
                                                      .lightGreenAccent.shade400
                                                  : var1 > 800 && var1 < 2999
                                                      ? Colors.brown.shade700
                                                      : var1 > 3000 &&
                                                              var1 < 15999
                                                          ? Colors
                                                              .indigo.shade50
                                                          : var1 > 16000 &&
                                                                  var1 < 24999
                                                              ? Colors
                                                                  .deepOrange
                                                                  .shade900
                                                              : var1 > 25000
                                                                  ? Colors
                                                                      .indigo
                                                                  : Colors_selector
                                                                      .tertiaryColor, // Adjust the icon size as needed
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
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                fontSize: 20,
                                                decoration: TextDecoration.none,
                                                color: var1 > 500 && var1 < 799
                                                    ? Colors.lightGreenAccent
                                                        .shade400
                                                    : var1 > 800 && var1 < 2999
                                                        ? Colors.brown.shade700
                                                        : var1 > 3000 &&
                                                                var1 < 15999
                                                            ? Colors
                                                                .indigo.shade50
                                                            : var1 > 16000 &&
                                                                    var1 < 24999
                                                                ? Colors
                                                                    .deepOrange
                                                                    .shade900
                                                                : var1 > 25000
                                                                    ? Colors
                                                                        .indigo
                                                                    : Colors_selector
                                                                        .tertiaryColor,
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                    var1 < 25000
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4, 0, 4, 4),
                                            child: Text(
                                              var1 > 500 && var1 < 799
                                                  ? "Only ${800 - var1} points to become a Bronz member"
                                                  : var1 > 800 && var1 < 2999
                                                      ? "Only ${3000 - var1} points to become a Silver member"
                                                      : var1 > 3000 &&
                                                              var1 < 15999
                                                          ? "Only ${16000 - var1} points to become a Golden member"
                                                          : var1 > 16000 &&
                                                                  var1 < 24999
                                                              ? "Only ${25000 - var1} points to become a Premium member"
                                                              : var1 > 25000
                                                                  ? "Only ${800 - var1} points to become a Premium member"
                                                                  : "Only ${500 - var1} points to become a Basic member",
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontSize: 14,
                                                      color: var1 > 500 &&
                                                              var1 < 799
                                                          ? Colors
                                                              .lightGreenAccent
                                                              .shade400
                                                          : var1 > 800 &&
                                                                  var1 < 2999
                                                              ? Colors.brown
                                                                  .shade700
                                                              : var1 > 3000 &&
                                                                      var1 <
                                                                          15999
                                                                  ? Colors
                                                                      .indigo
                                                                      .shade50
                                                                  : var1 > 16000 &&
                                                                          var1 <
                                                                              24999
                                                                      ? Colors
                                                                          .deepOrange
                                                                          .shade900
                                                                      : var1 >
                                                                              25000
                                                                          ? Colors
                                                                              .indigo
                                                                          : Colors_selector
                                                                              .tertiaryColor),
                                            ),
                                          )
                                        : Container(),
                                    //   ),
                                    // )
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
                        Image.asset(
                          "assets/images/michu.png",
                          height: height * 0.12,
                          width: width * 0.7,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: height * 0.26, // Adjust the height as needed
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Text(
                                              texts[index],
                                              style:
                                                  GoogleFonts.playfairDisplay(
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
                    )))),
        bottomNavigationBar: buildSocialButtons(),
      );
    });
  }

  Widget buildSocialButtons() => Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buildSocialButton(
              icon: FontAwesomeIcons.facebookSquare,
              color: Colors.blueAccent,
              onClicked: () => share(SocialMedia.facebook)),
          buildSocialButton(
              icon: FontAwesomeIcons.twitter,
              color: Colors.blue,
              onClicked: () => share(SocialMedia.twitter)),
          buildSocialButton(
              icon: FontAwesomeIcons.linkedin,
              color: Colors.blue,
              onClicked: () => share(SocialMedia.linkedin)),
          buildSocialButton(
              icon: FontAwesomeIcons.telegram,
              color: Colors.blue,
              onClicked: () => share(SocialMedia.telegram)),
          buildSocialButton(
              icon: FontAwesomeIcons.whatsapp,
              color: Colors.greenAccent,
              onClicked: () => share(SocialMedia.whatsapp))
        ]),
      );
  Future share(SocialMedia socialPlatform) async {
    const text = "I'm earning awards and packages by palying CooPlay";

    final urlShare = Uri.encodeComponent("https://coopbankoromia.com.et/");
    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://www.twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.linkedin:
          'https://www.linkedin.com/shareArticle?mini=true&url=$urlShare',
      SocialMedia.whatsapp: 'https://api.whatsapp.com/send?text=$text$urlShare',
      SocialMedia.telegram: 'https://t.me/share/url?url=$urlShare&text=$text'
    };
    final url = urls[socialPlatform]!;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Widget buildSocialButton(
          {required IconData icon,
          Color? color,
          required VoidCallback onClicked}) =>
      InkWell(
        child: Container(
            width: 62,
            height: 64,
            child: Center(
              child: FaIcon(
                icon,
                color: color,
                size: 40,
              ),
            )),
        onTap: onClicked,
      );
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
