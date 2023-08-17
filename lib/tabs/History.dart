import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(children: []),
        )),
      ),
    );
  }
}
