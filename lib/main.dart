// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:loyalty_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyalty_app/LocalString.dart';
// import 'package:loyalty_app/anime.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  getBoolValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? boolValue = prefs.getBool('isAmharic') ?? false;
    if (boolValue == true) {
      return "amharic";
    }
    bool? boolValue1 = prefs.getBool('isOromiffa') ?? false;
    if (boolValue1 == true) {
      return "oromiffa";
    }
    bool? boolValue2 = prefs.getBool('isEnglish') ?? false;
    if (boolValue2 == true) {
      return "english";
    }
    return 'english';
  }

  // ignore: prefer_typing_uninitialized_variables
  var lang;

  void initState() {
    lang = getBoolValue();
  }

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      translations: LocaleString(),
      // (foo==1)? something1():(foo==2)? something2(): something3();
      locale: (lang == "amharic")
          ? const Locale('am', 'ET')
          : (lang == "oromiffa")
              ? const Locale('or', 'ET')
              : const Locale('en', 'US'),

      // if (isAmharic){
      //   locale: Locale('am','ET'),
      // }else if(isOromiffa){
      //   locale: Locale('or','ET'),
      // }else{
      //   locale: Locale('en', 'US'),
      // }
      // locale: Locale('en', 'US'),
      // darkTheme: MyTheme().darkTheme,
      title: 'CooPlay',
      home: AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.games_outlined,
          nextScreen: const Login_page(),
          splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors_selector.primmary1),
      debugShowCheckedModeBanner: false,

      // home: HomePage(),
    );
  }
}
