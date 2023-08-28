import 'dart:convert';

import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_app/colors.dart';
import 'package:http/http.dart' as http;

import '../utils/simple_preference.dart';

List<DateTime>? rangeSelect;

DateTime initialDate = DateTime.now();

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class TransactionData {
  final Icon icon;
  final String source;
  final DateTime date;
  final String amount;
  final String status;

  TransactionData({
    required this.icon,
    required this.source,
    required this.date,
    required this.amount,
    required this.status,
  });
}

class _HistoryState extends State<History> {
  // final PageController _controller = PageController();
  // var _currentIndex = 0;
  final PageController _pageController = PageController();
  bool loading = true;
  List<TransactionData> transactions = [];
  List<TransactionData> filteredTransactions = [];
  // double _currentPage = 0;
  @override
  void initState() {
    super.initState();
    fetchHistory();
    _pageController.addListener(() {
      // setState(() {
      //   // _currentPage = _pageController.page!;
      // });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> rangeSelectPicker() async {
      final List<DateTime>? picked = await showDialog<List<DateTime>>(
        context: context,
        builder: (BuildContext context) {
          return const AwesomeCalendarDialog(
            selectionMode: SelectionMode.range,
          );
        },
      );
      if (picked != null) {
        setState(() {
          rangeSelect = picked;
          if (rangeSelect != null) {
            rangeSelect?.sort((a, b) => a.compareTo(b));

            if (rangeSelect?.length == 1) {
              String originalDate = "$rangeSelect";
              String newDate = originalDate.substring(1, 11);
              DateTime parsedDate = DateTime.parse(newDate);
              // String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
              filteredTransactions = transactions
                  .where((transaction) => transaction.date == parsedDate)
                  .toList();
              print("hereee");
              print(parsedDate);
            } else if (rangeSelect?.length != 1) {
              String originalDate = "$rangeSelect";
              String newDate1 = originalDate.substring(1, 11);
              String newDate2 = originalDate.substring(
                  originalDate.length - 24, originalDate.length - 14);
              DateTime parsedDate = DateTime.parse(newDate1);
              DateTime parsedDate2 = DateTime.parse(newDate2);
              filteredTransactions = transactions
                  .where((transaction) =>
                      transaction.date
                          .isAfter(parsedDate.subtract(Duration(days: 1))) &&
                      transaction.date
                          .isBefore(parsedDate2.add(Duration(days: 1))))
                  .toList();
              print("here we go");
              print(newDate2);
            }
          }
        });
      }
    }

    String DisplayDate(List<DateTime>? dateRange) {
      print(rangeSelect);
      if (rangeSelect != null) {
        rangeSelect?.sort((a, b) => a.compareTo(b));

        if (dateRange == null) {
          return "Select date";
        } else if (dateRange.length == 1) {
          var show = DateFormat('MMMM d, y').format(dateRange[0]);
          return show;
        } else {
          // ignore: prefer_interpolation_to_compose_strings
          var show = DateFormat('MMMM d, y').format(dateRange[0]) +
              " - " +
              DateFormat('MMMM d, y').format(dateRange[dateRange.length - 1]);
          return show;
        }
      } else {
        return "Select date";

        // print("The list is null.");
      }
    }

    // List<TransactionData> filteredTransactions = transactions
    //     .where((transaction) => transaction.date == "$rangeSelect")
    //     .toList();
    // print(filteredTransactions.length);

    // Color iconColor = Colors.white;

    // final List<TransactionData> transactions = [
    // TransactionData(
    //   icon: Icon(
    //     Icons.redeem,
    //     color: Colors.green,
    //   ),
    //   source: "Collected from Michu",
    //   date: "August 17, 2023",
    //   amount: "+20",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.swap_horiz_sharp,
    //     color: Colors.amber,
    //   ),
    //   source: "Converted to ETB",
    //   date: "August 10, 2023",
    //   amount: "-500",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.redeem,
    //     color: Colors.green,
    //   ),
    //   source: "Collected from E-Birr",
    //   date: "August 1, 2023",
    //   amount: "+1000",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.swap_horiz_sharp,
    //     color: Colors.amber,
    //   ),
    //   source: "Converted to DSTV package",
    //   date: "July 30, 2023",
    //   amount: "-250",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.swap_horiz_sharp,
    //     color: Colors.amber,
    //   ),
    //   source: "Converted to mobile Top-up",
    //   date: "July 25, 2023",
    //   amount: "-50",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.redeem,
    //     color: Colors.green,
    //   ),
    //   source: "Collected from My-Equb",
    //   date: "July 1, 2023",
    //   amount: "+2000",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.swap_horiz_sharp,
    //     color: Colors.amber,
    //   ),
    //   source: "Transfered to Wallet",
    //   date: "May 1, 2023",
    //   amount: "-600",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.swap_horiz_sharp,
    //     color: Colors.amber,
    //   ),
    //   source: "Converted to canal plus package",
    //   date: "August 17, 2022",
    //   amount: "-400",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.redeem,
    //     color: Colors.green,
    //   ),
    //   source: "Collected from Deboo",
    //   date: "October 8, 2022",
    //   amount: "+600",
    //   status: "Success",
    // ),
    // TransactionData(
    //   icon: Icon(
    //     Icons.redeem,
    //     color: Colors.green,
    //   ),
    //   source: "Collected from mobile banking",
    //   date: "January 3, 2022",
    //   amount: "+200",
    //   status: "Success",
    // ),
    // Add more transactions here
    // ];

    return Scaffold(
      backgroundColor: Colors_selector.tertiaryColor,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.09,
              ),
              Text(
                "Transaction History",
                style: GoogleFonts.roboto(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        backgroundColor: Colors_selector.tertiaryColor,
        elevation: 0, // Set elevation to 0 to remove shadow

        // title: Text("title"),
        leading: Container(
          decoration: BoxDecoration(
            color: Colors_selector.pair1,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.black.withOpacity(0.2), blurRadius: 5)
            // ],
          ),
          child: Material(
            color: Colors_selector.tertiaryColor,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height * 1.01,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors_selector.tertiaryColor,
              Colors_selector.tertiaryColor
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: const BorderRadius.only(
                // topLeft: Radius.circular(30),
                // topRight: Radius.circular(30),
                )
            // bottomLeft: Radius.circular(30),
            // bottomRight: Radius.circular(30)),
            ),
        child: Column(children: [
          // Text(rangeSelect?.toString() ?? ''),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              child: GestureDetector(
                onTap: () => rangeSelectPicker(),
                child: Card(
                  color: Colors.grey[50],
                  child: ListTile(
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text(
                        DisplayDate(rangeSelect),
                      )),
                ),
              ),
            ),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors_selector.primmary1,
                ))
              : Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      DateTime transactionDate =
                          filteredTransactions[index].date;

                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(transactionDate);
                      return Card(
                        child: Container(
                          height: 60,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: filteredTransactions[index].icon,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      filteredTransactions[index].source,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      formattedDate,
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[400]),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(filteredTransactions[index]
                                              .amount),
                                          Text(
                                            " Pts",
                                            style: GoogleFonts.roboto(
                                                color: Colors.grey[400],
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                      Text(
                                        filteredTransactions[index].status,
                                        style: GoogleFonts.roboto(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                    controller: _pageController,
                    itemCount: filteredTransactions.length,
                  ),
                )
        ]),
      )),
    );
  }

  Future<void> fetchHistory() async {
    try {
      var user = await SimplePreferences().getUser();

      final response = await http.get(
        Uri.http(
            '10.1.177.123:9000', '/api/transactions/getByUsername/${user![0]}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);
      List<TransactionData> newTransactions = [];

      for (var transaction in data) {
        // print(transaction.date);
        var transactionData = TransactionData(
          icon: transaction['transactionType'] == "credit"
              ? const Icon(Icons.redeem, color: Colors.green)
              : const Icon(Icons.swap_horiz_sharp, color: Colors.amber),
          source: transaction['naration'],
          date: DateTime.parse(transaction['generatedDate']),
          amount: transaction['amount'],
          status: transaction['status'],
        );
        newTransactions.add(transactionData);
      }
      transactions.addAll(newTransactions);
      filteredTransactions.addAll(transactions);
      print(filteredTransactions.length);

      // print(transactions[0]);

      setState(() {
        loading = false;
      });
    } catch (e) {
      var message = e.toString();
      'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }
}
