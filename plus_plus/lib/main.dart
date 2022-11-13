import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plus_plus/pages/count.dart';
import 'package:plus_plus/pages/homepage.dart';
import 'package:plus_plus/pages/introscreens.dart';

void main() {
  runApp(
    const PlusPlus(),
  );
}

class PlusPlus extends StatelessWidget {
  const PlusPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IntroScreens(),
        'home': (context) => const HomePage(),
        'count': (context) => const Count(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}