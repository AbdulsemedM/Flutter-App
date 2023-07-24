import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/menu/Challenges.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class VideoAds extends StatefulWidget {
  @override
  _VideoAdsState createState() => _VideoAdsState();
}

class _VideoAdsState extends State<VideoAds> {
  late VideoPlayerController _controller;
  late Timer timers;
  int _start = 30;

  @override
  void initState() {
    const oneSecond = const Duration(seconds: 1);
    timers = Timer.periodic(oneSecond, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
    BackButtonInterceptor.add(myInterceptor);
    _controller = VideoPlayerController.network(
        "https://jsoncompare.org/LearningContainer/SampleFiles/Video/MP4/sample-mp4-file.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.value.isInitialized
              ? _controller.play()
              : _controller.pause();
        });
      });
    super.initState();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  late double ht, wdt = 0.0;

  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height / 1000;
    wdt = MediaQuery.of(context).size.width / 1000;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        // brightness: Brightness.dark,
      ),
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
              children: [
                Positioned(
                  top: ht * 300,
                  child: Container(
                    height: ht * 300,
                    width: wdt * 1000,
                    child: VideoPlayer(_controller),
                  ),
                ),
                Positioned(
                  top: ht * 520,
                  left: wdt * 720,
                  child: OutlinedButton(
                    onPressed: () {
                      if (_start == 0) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    Challenges(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                            transitionDuration: Duration(milliseconds: 2000),
                          ),
                        );
                      }
                    },
                    child: _start == 0
                        ? Row(
                            children: [
                              Text(
                                "Skip video",
                                style: TextStyle(
                                  color: Colors.grey[50],
                                ),
                              ),
                              Icon(
                                Icons.skip_next,
                                color: Colors.grey[50],
                              ),
                            ],
                          )
                        : Text(
                            "Skip Video in $_start",
                            style: TextStyle(
                              color: Colors.grey[50],
                            ),
                          ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(
                        width: 1,
                        color: Colors.grey.shade400,
                        ////////////////////////////////
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ht * 620,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ht * 60),
                    child: Text(
                      "Visit Our Website for additional information.",
                      softWrap: true,
                      style: TextStyle(
                        color: Colors_selector.grey,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: ht * 680,
                  right: wdt * 200,
                  left: wdt * 200,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _launch("https://coopbankoromia.com.et/");
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Challenges(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return child;
                          },
                          transitionDuration: Duration(milliseconds: 2000),
                        ),
                      );
                    },
                    child: Text(
                      "Visit now",
                      style: TextStyle(
                        color: Colors_selector.grey,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors_selector.primaryColor,
                      side: BorderSide(
                        width: 2,
                        color: Colors.blue.shade400,
                        /////////////////////////////////
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    _controller.dispose();
    timers.cancel();
    super.dispose();
  }
}
