// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:loyalty_app/colors.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Widget _menuSelector(@required String image, @required String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors_selector.grey, width: 2)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Other Products"),
        centerTitle: true,
        elevation: 0,
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Trending",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 750,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.71,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, item) {
                          return Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.35),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Text("New Product",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                "Descrition of the product is here",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
