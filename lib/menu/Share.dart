// import 'dart:html';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:loyalty_app/colors.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia {
  facebook,
  twitter,
  insatgram,
  telegram,
  email,
  linkedin,
  whatsapp
}

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(25.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Profile2()),
        //         );
        //       },
        //       child: Image.network(
        //         "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_100_100/0/1657298878780?e=1678924800&v=beta&t=PbUKUn0qwRpF43rYt0bISoE6PYYusRI3BrvkMU3SP0Y",
        //         height: 50.0,
        //         width: 50.0,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Share"),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.monetization_on_sharp,
                color: Colors.yellowAccent),
            tooltip: 'Coins',
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Center(child: Text("data"))),
          )
        ],
      ),
      // bottomNavigationBar: ,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
          width: MediaQuery.of(context).size.height * 1,
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
            Container(
              color: Colors.white10,
              child: Image.asset("assets/images/Cooperative.png",
                  height: 195, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  "Lorem ipsum dolor sit amet. Sit maiores voluptatem in eveniet eaque ut molestias voluptatem nam architecto quia. Sed consectetur consequatur et accusamus labore et quae quam quo eaque mollitia et internos aspernatur! Non repellat dolorem vel animi voluptatibus ut dolorem eligendi ut commodi laboriosam eum animi Quis.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  "Lorem ipsum dolor sit amet. Sit maiores voluptatem in eveniet eaque ut molestias voluptatem nam architecto quia. Sed consectetur consequatur et accusamus labore et quae quam quo eaque mollitia et internos aspernatur! Non repellat dolorem vel animi voluptatibus ut dolorem eligendi ut commodi laboriosam eum animi Quis.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            ),
          ]),
          // child: Column(children: [Text("data")]),
        ),
      )),
      bottomNavigationBar: buildSocialButtons(),
    );
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
              icon: Icons.email_outlined,
              color: Colors.redAccent,
              onClicked: () => share(SocialMedia.email)),
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
    final subject = "Best banking game ever";
    final text = "I'm earning awards and packages by palying CooPlay";

    final urlShare = Uri.encodeComponent("https://coopbankoromia.com.et/");
    final urls = {
      SocialMedia.facebook:
          'https://www.facebook.com/sharer/sharer.php?u=$urlShare&t=$text',
      SocialMedia.twitter:
          'https://www.twitter.com/intent/tweet?url=$urlShare&text=$text',
      SocialMedia.email: 'mailto:?subject=$subject&body=$text\n\n$urlShare',
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
