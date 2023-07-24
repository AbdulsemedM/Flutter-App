import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';

class Unchallenge extends StatefulWidget {
  @override
  _UnchallengeState createState() => _UnchallengeState();
}

class _UnchallengeState extends State<Unchallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Quize Challenge"),
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
    );
  }
}
