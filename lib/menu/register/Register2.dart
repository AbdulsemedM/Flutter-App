import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_app/menu/register/Register3.dart';

import '../../colors.dart';

class register2 extends StatefulWidget {
  const register2({Key? key}) : super(key: key);

  @override
  State<register2> createState() => _register2State();
}

class _register2State extends State<register2> {
  final formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Single';
  var items = [
    'Single',
    'Married',
    'Widowed',
    'Divorced',
  ];
  String dropdownvalue1 = 'Student';
  String dropdownvalue3 = '0 - 999';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Register".tr),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.monetization_on_sharp,
                color: Colors.yellowAccent),
            tooltip: 'Conis',
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("data")),
          )
        ],
      ),
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
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Welcome to your bank!",
                      style: TextStyle(
                          color: Colors_selector.secondaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Just a few steps",
                        style: TextStyle(
                            color: Colors_selector.secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "Marital status",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "If married",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Spouse's first name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Spouse's father name"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "Occupation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: DropdownButton<String>(
                        // Step 3.
                        value: dropdownvalue1,
                        // Step 4.
                        items: <String>[
                          'Student',
                          'Employee',
                          'Self Employed',
                          'Unemployed'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              // style: TextStyle(fontSize: 30),
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue1 = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Monthly salary",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: DropdownButton<String>(
                  // Step 3.
                  value: dropdownvalue3,
                  // Step 4.
                  items: <String>[
                    '0 - 999',
                    '1,000 - 5,999',
                    '6,000 - 9,999',
                    '10,000 - 19,999',
                    '20,000 - 34,999',
                    '35,000 - 74,999',
                    '75,000 - 99,999',
                    '100,000 and above'
                  ].map<DropdownMenuItem<String>>((String value2) {
                    return DropdownMenuItem<String>(
                      value: value2,
                      child: Text(
                        value2,
                        // style: TextStyle(fontSize: 30),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownvalue3 = newValue2!;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Next",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register3()));
                      },
                      child: Icon(Icons.navigate_next_rounded),
                      backgroundColor: Colors_selector.secondaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          // child: Column(children: [Text("data")]),
        ),
      )),
    );
  }
}
