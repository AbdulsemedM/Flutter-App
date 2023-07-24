import 'package:flutter/material.dart';
import 'package:loyalty_app/Challenges/ATM.dart';
import 'package:loyalty_app/Challenges/Newproduct.dart';
import 'package:loyalty_app/Challenges/Procom.dart';
import 'package:loyalty_app/Challenges/Unchallenge.dart';
import 'package:loyalty_app/Challenges/Videos.dart';
import 'package:loyalty_app/Challenges/mobile_banking.dart';
import 'package:loyalty_app/Challenges/wallet.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:loyalty_app/colors.dart';

class Challenges extends StatefulWidget {
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        // leading: Padding(
        // //   padding: const EdgeInsets.all(8.0),
        // //   child: ClipRRect(
        // //     borderRadius: BorderRadius.circular(25.0),
        // //     child: GestureDetector(
        // //       onTap: () {
        // //         Navigator.push(
        // //           context,
        // //           MaterialPageRoute(builder: (context) => Profile2()),
        // //         );
        // //       },
        // //       child: Image.network(
        // //         "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_100_100/0/1657298878780?e=1678924800&v=beta&t=PbUKUn0qwRpF43rYt0bISoE6PYYusRI3BrvkMU3SP0Y",
        // //         height: 50.0,
        // //         width: 50.0,
        // //         fit: BoxFit.cover,
        // //       ),
        // //     ),
        // //   ),
        // // ),
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Challenges"),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.monetization_on_sharp,
                color: Colors.yellowAccent),
            tooltip: 'Conis',
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Center(child: Text("data"))),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
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
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ATM()),
                    );
                  },
                  title: Text("ATM Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp9LkszuZg-tPsqPGdeHzk82AmHF3oO1yUPw&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wallet()),
                    );
                  }),
                  title: Text("Wallet Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcszmqJisoi5hHFZcaPMkIelQyVFYpxKeo6fyv9Mqpo7DjTjkdpwBJJLcGsdknoapksiY&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Mb_challenge()),
                    );
                  }),
                  title: Text("Mobile Banking Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfnCV5gm9gWhGoE_rlygtFUH7NyNDEJKsqqs4jjMV-2vTgzdKhibuc9sELEwA8OcpZ9Mc&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Newproduct()),
                    );
                  }),
                  title: Text("New Product Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRobeiBJPK4sPlYtTa_v6HBQj-NPUkbc3IkN6lYMFDS1_vCeDjJceeGUQ5ufCZPdVm2jQU&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Procom()),
                    );
                  }),
                  title: Text("Profile Completion Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRVhN0VOM1Dk0nTS2t2Rwks5aawyTWxmRJT2LTJLL5bm2Ca5HmoK-BTVNJDkuDUJegPHM&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoAds()),
                    );
                  },
                  title: Text("Promotional Videos Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRswxVp7KYkKJN4DgEP0CE-bYeWM_4TY7COPA&usqp=CAU")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
              child: Card(
                color: Colors_selector.pair1,
                child: ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Unchallenge()),
                    );
                  }),
                  title: Text("Unexpected Challenges"),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2_IZTV2ALpWLDLdrxtSuv5yfYj_MzD-1KkXRV1POsKWgvWYO-KrOJrYy398vLFuEB5Ho&usqp=CAU")),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
            //   child: Card(
            //     child: ListTile(
            //       onTap: (() {}),
            //       title: Text("Promotional Videos Challenges"),
            //       leading: CircleAvatar(
            //           backgroundImage: NetworkImage(
            //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRswxVp7KYkKJN4DgEP0CE-bYeWM_4TY7COPA&usqp=CAU")),
            //     ),
            //   ),
            // )
          ]),
        ),
      )),
    );
  }
}
