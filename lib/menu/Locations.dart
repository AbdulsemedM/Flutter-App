// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loyalty_app/Profile2.dart';
import 'package:get/get.dart';
import 'package:loyalty_app/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:social_share_plugin/social_share_plugin.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  late String lat;
  late String long;
  var isDisable = true;
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors_selector.primaryColor,
        title: Text("Locations".tr),
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
          width: MediaQuery.of(context).size.height * 1,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
//               ElevatedButton(
//             onPressed: () {_getCurrentLocation().then((value) {
//                       lat = '${value.latitude}';
//                       long = '${value.longitude}';
//                     });
//                     _liveLocation();},
//             style: ElevatedButton.styleFrom(

//                 backgroundColor: Colors.purple,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                 textStyle:
//                     const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             child: const Text('Button'),
// ),
              ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors_selector.secondaryColor)),
                onPressed: () {
                  _getCurrentLocation().then((value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';
                  });
                  _liveLocation();
                  setState(() {
                    setButton();
                    color = Colors_selector.secondaryColor;
                  });
                },
                child: Text(
                  "Find now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(color)),
                  onPressed: () {
                    if (isDisable) {
                      null;
                    } else {
                      clickButton();
                    }
                  },
                  // isDisable? () {

                  // },
                  child: Text("Open location in Map",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))
            ],
          ),
          // child: Column(children: [Text("data")]),
        ),
      )),
    );
  }

  void setButton() {
    if (isDisable) {
      isDisable = false;
    } else {
      isDisable = true;
    }
  }

  void clickButton() {
    _openMap(lat, long);
  }

  Future<void> _openMap(String lat, String long) async {
    String googleurl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleurl)
        ? await launch(googleurl)
        : throw "can not launch $googleurl";
  }

  void _liveLocation() {
    LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 100);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {});
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied!');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are denied forever, we can not locate you.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
