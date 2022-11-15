import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plus_plus/pages/count.dart';
import 'package:plus_plus/pages/homepage.dart';
import 'package:plus_plus/pages/introscreens.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  isViewed = preferences.getInt('Intro');

  runApp(
    const PlusPlus(),
  );
}

class Arguments {
  final int? txtInput;
  final File? image;

  Arguments({this.txtInput, this.image});
}

class PlusPlus extends StatelessWidget {
  const PlusPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isViewed != 0 ? IntroScreens.routeName : HomePage.routeName,
      routes: {
        IntroScreens.routeName: (context) => const IntroScreens(),
        HomePage.routeName: (context) => const HomePage(),
        Count.routeName: (context) => const Count(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
