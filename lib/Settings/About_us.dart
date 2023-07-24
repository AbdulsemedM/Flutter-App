import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class About_us extends StatefulWidget {
  @override
  _About_usState createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors_selector.pair1, Colors_selector.pair2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(30),
            //     topRight: Radius.circular(30),
            //     bottomLeft: Radius.circular(30),
            //     bottomRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Cap.png"))),
              ),
              SizedBox(height: 20),
              Text(
                "Version 1.0.1",
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "Lorem ipsum dolor sit amet. Ea internos ipsam qui natus ipsam est deserunt distinctio a rerum blanditiis aut praesentium nobis qui atque modi qui reprehenderit galisum. Qui quia mollitia in ipsam rerum id fugit voluptas sed quos dolor. Nam Quis alias et doloribus sint et architecto consequuntur aut suscipit cupiditate.",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Text("Visit us", style: TextStyle(fontSize: 22)),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Text(
                    "https://coopbankoromia.com.et/",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  _launchURL() async {
    const String url = 'https://coopbankoromia.com.et/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
