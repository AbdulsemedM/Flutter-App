import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_app/menu/register/Register2.dart';

import '../../colors.dart';

class register1 extends StatefulWidget {
  const register1({Key? key}) : super(key: key);

  @override
  State<register1> createState() => _register1State();
}

class _register1State extends State<register1> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  String dropdownvalue = 'male';
  late String birthDateInString;
  late DateTime birthDate;

  // List of items in our dropdown menu
  var items = [
    'male',
    'female',
  ];
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

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
                        "For a better service",
                        style: TextStyle(
                            color: Colors_selector.secondaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Phone number"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Invalid phone number";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Email"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'^[\w-w\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text(
                  "Birthdate",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
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
                                builder: (context) => register2()));
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
