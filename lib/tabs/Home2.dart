import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/tabs/Michu.dart';

import '../colors.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    List<IconItem> iconItems = [
      IconItem(
        icon: FontAwesomeIcons.handshake,
        title: "Michu",
        onPressed: () {
          // Handle the tap event for Title 1
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Michu(),
            ),
          );
        },
        disabled: false,
      ),
      IconItem(
        icon: Icons.ad_units_outlined,
        title: "E-birr",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.account_balance_wallet_outlined,
        title: "Mob. Banking",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.account_tree_sharp,
        title: "Coop-Omni",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.analytics,
        title: "ATM Card",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.card_giftcard_sharp,
        title: "My-EQub",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.bubble_chart_sharp,
        title: "Coopass",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.bakery_dining_outlined,
        title: "Int. Banking",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      IconItem(
        icon: Icons.badge_outlined,
        title: "Coopass",
        onPressed: () {
          // Handle the tap event for Title 1
          print("Title 1 tapped!");
        },
        disabled: true,
      ),
      // Add more IconItems with different icons and titles
    ];

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons
                          .assured_workload_outlined, // Replace this with your desired icon
                      size: 30,
                      color: Colors.grey, // Adjust the icon size as needed
                    ),
                    const SizedBox(
                        width:
                            10), // Add some space between the icon and the text
                    Text(
                      "Earn",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 35,
                        color: Colors_selector.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  height: 2,
                  thickness: 4,
                  color: Colors_selector
                      .primaryColor, // Adjust the color as needed
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: iconItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: iconItems[index].onPressed,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: iconItems[index].disabled
                                    ? Colors_selector.grey
                                    : Colors_selector
                                        .primmary1, // Set the color of the border here
                                width: 2, // Set the width of the border here
                              ),
                              shape: BoxShape.circle,
                              // color: Colors_selector
                              //     .primaryColor, // Adjust the circle color as needed
                            ),
                            child: Center(
                              child: Icon(
                                iconItems[index].icon,
                                size: 40,
                                color: Colors_selector
                                    .grey, // Adjust the icon size and color as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          iconItems[index].title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            color: Colors_selector
                                .grey, // Adjust the text color as needed
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class IconItem {
  final IconData icon;
  final String title;
  final VoidCallback onPressed; // Add a callback function
  late bool disabled;
  IconItem(
      {required this.icon,
      required this.title,
      required this.onPressed,
      required this.disabled});
}
