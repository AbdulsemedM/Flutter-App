import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        child: SizedBox(
          height: double.infinity,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  _buildCoverImage(),
                  Positioned(top: 85, child: _buildProfileImage())
                ],
              ),
            ),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () async {
                    String url = "www.facebook.com";
                    if (await canLaunchUrl(url as Uri)) {
                      launch(url);
                    } else {
                      print("error");
                    }
                    ;
                  },
                  child: _buildSocialMediaIcon(FontAwesomeIcons.facebook)),
              SizedBox(width: 20),
              GestureDetector(
                  child: _buildSocialMediaIcon(FontAwesomeIcons.instagram)),
              SizedBox(width: 20),
              GestureDetector(
                  child: _buildSocialMediaIcon(FontAwesomeIcons.linkedin)),
              SizedBox(width: 20),
              GestureDetector(
                  child: _buildSocialMediaIcon(FontAwesomeIcons.twitter))
            ]),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffe98a2a),
              ),
              title: Text(
                "Total Golden Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors_selector.tertiaryColor),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total ATM Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total Wallet Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total MB Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors_selector.tertiaryColor),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total P Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors_selector.tertiaryColor),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total PC Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors_selector.tertiaryColor),
                    ))),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.coins,
                color: Color(0xffc5baaf),
              ),
              title: Text(
                "Total PV Coins".tr,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () => null,
              trailing: ClipOval(
                child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      "8",
                      style: TextStyle(color: Colors_selector.tertiaryColor),
                    ))),
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  Widget _buildSocialMediaIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(
            child: Icon(
          icon,
          size: 32,
        )),
      );

  Widget _buildCoverImage() => Container(
        color: Colors_selector.grey,
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjINkLqesfu7ktLHzS6WA4is3o90_SQcsW9Q&usqp=CAU",
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover),
      );

  Widget _buildProfileImage() => CircleAvatar(
        radius: 50,
        backgroundColor: Colors_selector.primaryColor,
        backgroundImage: NetworkImage(
            "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_100_100/0/1657298878780?e=1678924800&v=beta&t=PbUKUn0qwRpF43rYt0bISoE6PYYusRI3BrvkMU3SP0Y"),
      );
}
