import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Profile",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const Stack(
                //   alignment: Alignment.bottomRight,
                //   children: [
                //     CircleAvatar(
                //         radius: 50,
                //         backgroundImage: NetworkImage(
                //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK4c_lXzfD_8hMdLR8LSVOanf2bhADHCwV_mG_XvGHYuP_XLas6x_3ku8eiCz5r3PV7Xg&usqp=CAU")),
                //     CircleAvatar(
                //       radius: 15, // Adjust the size of the edit icon circle
                //       backgroundColor: Colors
                //           .blue, // Background color for the edit icon circle
                //       child: Icon(
                //         Icons.edit, // The edit icon
                //         color: Colors.white,
                //         size: 15, // Color of the edit icon
                //       ),
                //     ),
                //   ],
                // )
                SimpleUserCard(
                  userName: "Nom de l'utilisateur",
                  userProfilePic: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK4c_lXzfD_8hMdLR8LSVOanf2bhADHCwV_mG_XvGHYuP_XLas6x_3ku8eiCz5r3PV7Xg&usqp=CAU"),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
