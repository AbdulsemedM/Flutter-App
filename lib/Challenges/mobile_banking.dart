import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';

class Mb_challenge extends StatefulWidget {
  @override
  _Mb_challengeState createState() => _Mb_challengeState();
}

class _Mb_challengeState extends State<Mb_challenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(25.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Profile2()),
        //         );
        //       },
        //       child: Image.network(
        //         "https://media.licdn.com/dms/image/C4E03AQH5LjXhQmWWrg/profile-displayphoto-shrink_100_100/0/1657298878780?e=1678924800&v=beta&t=PbUKUn0qwRpF43rYt0bISoE6PYYusRI3BrvkMU3SP0Y",
        //         height: 50.0,
        //         width: 50.0,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Mobile Banking Challenge"),
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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.4,
                      child: Text(
                        "Lorem ipsum dolor sit amet. Quo doloribus voluptatum et optio tempore cum dolor voluptatem cum consequatur debitis! Et numquam tempore At ratione veniam et aspernatur quisquam vel adipisci consequatur sit nobis blanditiis et aspernatur dolorem qui voluptatum explicabo! Eos nostrum sint et dolores deleniti et vero omnis et impedit molestiae non odio facilis.",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "M.B Transactons",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "M.B Coins",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors_selector.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("33",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            )),
                        SizedBox(height: 5),
                        Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors_selector.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("11",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ))
                      ]),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      ShowSimpleDialog(context);
                    },
                    child: Container(
                      height: 60,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors_selector.primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Convert to golden coins",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors_selector.tertiaryColor),
                        ),
                      ),
                    ),
                  )
                ]),
              ))),
    );
  }

  void ShowSimpleDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    " You have 11 M.B coins ",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "equal to 2.6 golden coins",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors_selector.primaryColor),
                      child: Text(
                        "Convert",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(height: 15),
                ],
              ),
            ));
      });
}
