import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plus_plus/pages/homepage.dart';
import 'package:plus_plus/widgets/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreens extends StatelessWidget {
  static const routeName = '/intro';
  const IntroScreens({Key? key}) : super(key: key);

  _storeIntroScreens() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Intro', isViewed);
  }

  void goToHome(BuildContext context) async {
    await _storeIntroScreens();
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          introPage(
            title: 'Start your journey with Plus+',
            body:
                'Plus+ is a manual counting app made to ease the capacity management of establishments.',
            imagePath: 'assets/vectors/one.png',
          ),
          introPage(
            title: 'Increment or Decrement',
            body:
                'Press the "Enter" button whenever a customer walks in and press the "Exit" button whenever the costumer walks out.',
            imagePath: 'assets/vectors/two.png',
          ),
          introPage(
            title: 'Customize!',
            body:
                'You also can choose a background image and set a desired limit in the counting.',
            imagePath: 'assets/vectors/three.png',
          ),
        ],
        onDone: () => goToHome(context),
        onSkip: () => goToHome(context),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 255, 95, 83)),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 255, 95, 83)),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          color: Colors.black26,
          activeColor: const Color.fromARGB(255, 255, 95, 83),
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        isTopSafeArea: true,
        isBottomSafeArea: true,
      ),
    );
  }
}
