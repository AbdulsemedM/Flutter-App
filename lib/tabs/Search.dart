// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}
// 😊

class _SearchState extends State<Search> {
  // List messages = [
  //   "New message1".tr,
  //   'New message2'.tr,
  //   'New message3'.tr,
  //   'New message4'.tr
  // ];
  @override
  Widget build(BuildContext context) {
    const var2 = 8320;

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons
                            .card_giftcard, // Replace this with your desired icon
                        size: 30,
                        color: Colors.grey, // Adjust the icon size as needed
                      ),
                      const SizedBox(
                          width:
                              10), // Add some space between the icon and the text
                      Text(
                        "Reedem",
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
                  padding: const EdgeInsets.fromLTRB(40, 20, 20, 20),
                  child: Row(children: [
                    const Icon(
                      Icons.star_border_outlined,
                      size: 25,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Your coin balance is $var2",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 25,
                        color: Colors_selector.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Mobile Topup'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Transfer to wallet'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Danate'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Gift Card'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Point Transfer'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Cash Withdraw'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Adjust the radius as needed
                        ),
                        child: ListTile(
                          title: const Text('Ride'),
                          trailing: ElevatedButton(
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text('Reedem'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 
