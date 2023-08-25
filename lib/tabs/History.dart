import 'package:awesome_calendar/awesome_calendar.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_app/colors.dart';

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
  final String date;
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
  // double _currentPage = 0;
  @override
  void initState() {
    super.initState();
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
          return DateFormat('MMMM d, y').format(dateRange[0]);
        } else {
          // ignore: prefer_interpolation_to_compose_strings
          return DateFormat('MMMM d, y').format(dateRange[0]) +
              " - " +
              DateFormat('MMMM d, y').format(dateRange[dateRange.length - 1]);
        }
      } else {
        return "Select date";

        // print("The list is null.");
      }
    }

    // Color iconColor = Colors.white;

    final List<TransactionData> transactions = [
      TransactionData(
        icon: Icon(
          Icons.redeem,
          color: Colors.green,
        ),
        source: "Collected from Michu",
        date: "August 17, 2023",
        amount: "+20",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.swap_horiz_sharp,
          color: Colors.amber,
        ),
        source: "Converted to ETB",
        date: "August 10, 2023",
        amount: "-500",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.redeem,
          color: Colors.green,
        ),
        source: "Collected from E-Birr",
        date: "August 1, 2023",
        amount: "+1000",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.swap_horiz_sharp,
          color: Colors.amber,
        ),
        source: "Converted to DSTV package",
        date: "July 30, 2023",
        amount: "-250",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.swap_horiz_sharp,
          color: Colors.amber,
        ),
        source: "Converted to mobile Top-up",
        date: "July 25, 2023",
        amount: "-50",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.redeem,
          color: Colors.green,
        ),
        source: "Collected from My-Equb",
        date: "July 1, 2023",
        amount: "+2000",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.swap_horiz_sharp,
          color: Colors.amber,
        ),
        source: "Transfered to Wallet",
        date: "May 1, 2023",
        amount: "-600",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.swap_horiz_sharp,
          color: Colors.amber,
        ),
        source: "Converted to canal plus package",
        date: "August 17, 2022",
        amount: "-400",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.redeem,
          color: Colors.green,
        ),
        source: "Collected from Deboo",
        date: "October 8, 2022",
        amount: "+600",
        status: "Success",
      ),
      TransactionData(
        icon: Icon(
          Icons.redeem,
          color: Colors.green,
        ),
        source: "Collected from mobile banking",
        date: "January 3, 2022",
        amount: "+200",
        status: "Success",
      ),
      // Add more transactions here
    ];

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
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.90,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
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
                                  child: transactions[index].icon,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                transactions[index].source,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                transactions[index].date,
                                style:
                                    GoogleFonts.roboto(color: Colors.grey[400]),
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
                                    Text(transactions[index].amount),
                                    Text(
                                      " Pts",
                                      style: GoogleFonts.roboto(
                                          color: Colors.grey[400],
                                          fontSize: 10),
                                    )
                                  ],
                                ),
                                Text(
                                  transactions[index].status,
                                  style:
                                      GoogleFonts.roboto(color: Colors.green),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                );
              },
              controller: _pageController,
              itemCount: transactions.length,
            ),
          )
        ]),
      )),
    );
  }
}
