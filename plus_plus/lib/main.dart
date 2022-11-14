import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plus_plus/pages/count.dart';
import 'package:plus_plus/pages/homepage.dart';
import 'package:plus_plus/pages/introscreens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      initialRoute: '/',
      routes: {
        IntroScreens.routeName: (context) => const IntroScreens(),
        HomePage.routeName: (context) => const HomePage(),
        Count.routeName: (context) => const Count(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
