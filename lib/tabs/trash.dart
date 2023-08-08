// Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: [
                                    //     Container(
                                    //       width: 150,
                                    //       height: 60,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors_selector
                                    //             .primaryColor,
                                    //         borderRadius:
                                    //             BorderRadius.circular(20),
                                    //       ),
                                    //       child: Center(
                                    //         child: Text(
                                    //           "$var1 points",
                                    //           style: GoogleFonts
                                    //               .playfairDisplay(
                                    //             fontSize: 16,
                                    //             decoration:
                                    //                 TextDecoration.none,
                                    //             fontWeight: FontWeight.bold,
                                    //             color: Colors.black,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     const SizedBox(width: 50),
                                    //     Container(
                                    //       width: 150,
                                    //       height: 60,
                                    //       decoration: BoxDecoration(
                                    //         color: Colors_selector
                                    //             .primaryColor,
                                    //         borderRadius:
                                    //             BorderRadius.circular(20),
                                    //       ),
                                    //       child: Center(
                                    //         child: Text(
                                    //           "37 ETB",
                                    //           style: GoogleFonts
                                    //               .playfairDisplay(
                                    //             fontSize: 16,
                                    //             decoration:
                                    //                 TextDecoration.none,
                                    //             fontWeight: FontWeight.bold,
                                    //             color: Colors.black,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Container(
                                    //   decoration: const BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     color: Colors
                                    //         .white24, // Adjust the circle background color as needed
                                    //   ),
                                    //   padding: const EdgeInsets.all(8),
                                    //   child: const Icon(
                                    //     Icons.arrow_forward,
                                    //     size: 40,
                                    //     color: Colors.black,
                                    //   ),
                                    // )
                                    
                                    // Flexible(
                //   child: ListView.builder(
                //       itemCount: messages.length,
                //       itemBuilder: (context, index) {
                //         return Dismissible(
                //           secondaryBackground: Container(
                //             margin: EdgeInsets.only(bottom: 10),
                //             color: Colors.red,
                //             child: Icon(
                //               Icons.delete,
                //               color: Colors_selector.tertiaryColor,
                //             ),
                //             alignment: Alignment.centerRight,
                //           ),
                //           background: Container(
                //             margin: EdgeInsets.only(bottom: 10),
                //             color: Colors.green,
                //             child: Icon(
                //               Icons.visibility,
                //               color: Colors_selector.tertiaryColor,
                //             ),
                //             alignment: Alignment.centerLeft,
                //           ),
                //           onDismissed: (DismissDirection direction) {},
                //           confirmDismiss: (DismissDirection direction) async {
                //             if (direction == DismissDirection.startToEnd) {
                //               showModalBottomSheet(
                //                   backgroundColor: Colors.transparent,
                //                   barrierColor: Colors.transparent,
                //                   context: context,
                //                   builder: (_) {
                //                     return Container(
                //                         decoration: BoxDecoration(
                //                             color:
                //                                 Colors.amber.withOpacity(0.8),
                //                             borderRadius: BorderRadius.only(
                //                                 topLeft: Radius.circular(20),
                //                                 topRight: Radius.circular(20))),
                //                         height: 400,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(14.0),
                //                           child: Text(
                //                             "New feature is unlocked".tr,
                //                             style: TextStyle(fontSize: 20),
                //                           ),
                //                         ));
                //                   });
                //               return false;
                //             } else {
                //               return Future.delayed(
                //                   Duration(seconds: 1),
                //                   () =>
                //                       direction == DismissDirection.endToStart);
                //             }
                //           },
                //           key: ObjectKey(index),
                //           child: Container(
                //             margin: EdgeInsets.only(
                //                 left: 20, right: 20, bottom: 20),
                //             child: Message(
                //                 color: Colors.blueGrey, text: messages[index]),
                //           ),
                //         );
                //       }),
                // ),
                // class Message extends StatelessWidget {
//   final Color color;
//   final String text;
//   const Message({Key? key, required this.color, required this.text})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       height: MediaQuery.of(context).size.height / 14,
//       decoration: BoxDecoration(
//         color: Colors_selector.grey,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//           child: Text(text, style: TextStyle(fontSize: 20, color: color))),
//     );
//   }
// }