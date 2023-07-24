// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Help"),
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
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(children: [
              Text(
                  "Lorem ipsum dolor sit amet. Sit maiores voluptatem in eveniet eaque ut molestias voluptatem nam architecto quia. Sed consectetur consequatur et accusamus labore et quae quam quo eaque mollitia et internos aspernatur! Non repellat dolorem vel animi voluptatibus ut dolorem eligendi ut commodi laboriosam eum animi Quis.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              SizedBox(height: 15),
              Text("Premium",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
              Text(
                  "Ea dolore dolores id delectus saepe non culpa deserunt et quod autem id labore obcaecati! Quo quia maxime ea porro beatae non doloremque necessitatibus.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              SizedBox(height: 15),
              Text("Priemo",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
              Text(
                  "Et corporis laudantium ut voluptatibus fuga eos voluptate consequatur. Aut velit fugit aut adipisci tempore qui quaerat cupiditate eos necessitatibus dolorem.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
            ]),
          ),
        ),
      )),
    );
  }
}
