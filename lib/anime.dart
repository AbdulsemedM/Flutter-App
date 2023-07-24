import 'package:flutter/material.dart';
import 'package:loyalty_app/colors.dart';

class anime extends StatefulWidget {
  const anime({Key? key}) : super(key: key);

  @override
  State<anime> createState() => _animeState();
}

class _animeState extends State<anime> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..forward();

    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors_selector.primaryColor,
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                  color: Colors_selector.secondaryColor,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),
          Transform.rotate(
            angle: _rotationAnimation.value + 0.2,
            child: Container(
              width: 175,
              height: 175,
              decoration: BoxDecoration(
                  color: Colors_selector.tertiaryColor,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),
          Transform.rotate(
            angle: _rotationAnimation.value + 0.4,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  color: Colors_selector.pair2,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          ),
          Transform.rotate(
            angle: _rotationAnimation.value + 0.6,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black12.withOpacity(0.8),
                  //       offset: Offset(-0.6, -0.6)),
                  //   BoxShadow(
                  //       color: Colors.black.withOpacity(0.8),
                  //       offset: Offset(0.6, 0.6)),
                  // ],
                  color: Colors_selector.primaryColor,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value)),
            ),
          )
        ],
      )),
    );
  }
}
