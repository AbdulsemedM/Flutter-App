import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:loyalty_app/LocalString.dart';
import 'package:loyalty_app/colors.dart';
import 'package:loyalty_app/login_page.dart';
import 'package:get/get.dart';
import 'package:loyalty_app/utils/simple_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await SimplePreferences.init();

  String lang = SimplePreferences.getLanguage() ?? '';

  runApp(MyApp(lang: lang));
}

class MyApp extends StatelessWidget {
  final String lang;

  const MyApp({Key? key, required this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      translations: LocaleString(),
      locale: lang == "en_US"
          ? const Locale('en', 'US')
          : lang == "am_ET"
              ? const Locale('am', 'ET')
              : lang == "or_ET"
                  ? const Locale('or', 'ET')
                  : const Locale("en", "US"),
      title: 'CooPlay',
      home: AnimatedSplashScreen(
        duration: 1000,
        splash: Icons.games_outlined,
        nextScreen: const Login_page(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors_selector.primmary1,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
