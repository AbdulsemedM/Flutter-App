import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loyalty_app/colors.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List messages = [
    "New message1".tr,
    'New message2'.tr,
    'New message3'.tr,
    'New message4'.tr
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.2,
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
              child: Column(children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Messages".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22)),
                ),

                Flexible(
                  child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          secondaryBackground: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors_selector.tertiaryColor,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          background: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            color: Colors.green,
                            child: Icon(
                              Icons.visibility,
                              color: Colors_selector.tertiaryColor,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          onDismissed: (DismissDirection direction) {},
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.amber.withOpacity(0.8),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        height: 400,
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Text(
                                            "New feature is unlocked".tr,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ));
                                  });
                              return false;
                            } else {
                              return Future.delayed(
                                  Duration(seconds: 1),
                                  () =>
                                      direction == DismissDirection.endToStart);
                            }
                          },
                          key: ObjectKey(index),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Message(
                                color: Colors.blueGrey, text: messages[index]),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors_selector.secondaryColor),
                    child: SwitchListTile(
                        contentPadding: const EdgeInsets.fromLTRB(10, 5, 7, 4),
                        title: Text(
                          "Disable Notifications",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        value: false,
                        onChanged: (val) {}),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
                //   child: Card(
                //     child: ListTile(
                //         onTap: (() {}),
                //         title: Text("New Message"),
                //         leading: Icon(Icons.notifications_active_outlined)),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
                //   child: Card(
                //     child: ListTile(
                //         onTap: (() {}),
                //         title: Text("New Message"),
                //         leading: Icon(Icons.notifications_active_outlined)),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
                //   child: Card(
                //     child: ListTile(
                //         onTap: (() {}),
                //         title: Text("New Message"),
                //         leading: Icon(Icons.notifications_active_outlined)),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 6),
                //   child: Card(
                //     child: ListTile(
                //         onTap: (() {}),
                //         title: Text("New Message"),
                //         leading: Icon(Icons.notifications_active_outlined)),
                //   ),
                // ),
              ]),
            )));
  }
}

class Message extends StatelessWidget {
  final Color color;
  final String text;
  const Message({Key? key, required this.color, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: Colors_selector.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(text, style: TextStyle(fontSize: 20, color: color))),
    );
  }
}
