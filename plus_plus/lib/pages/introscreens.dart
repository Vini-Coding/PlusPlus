import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreens extends StatelessWidget {
  static const routeName = '/';
  const IntroScreens({Key? key}) : super(key: key);

  _storeIntroScreens() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('Intro', isViewed);
  }

  void goToHome(BuildContext context) async {
    await _storeIntroScreens();
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("Start yout journey with Plus+",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            body:
                "Plus+ is a manual counting app made to ease the capacity management of establishments.",
            image: Image.asset(
              'assets/vectors/one.png',
              height: 400,
              width: 400,
            ),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.only(top: 80),
            ),
            reverse: false,
          ),
          PageViewModel(
            titleWidget: const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("Increment or Decrement",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            body:
                'Press the "Enter" button whenever a customer walks in and press the "Exit" button whenever the costumer walks out.',
            image: Image.asset(
              'assets/vectors/two.png',
              height: 400,
              width: 400,
            ),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.only(top: 80),
            ),
          ),
          PageViewModel(
            titleWidget: const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                "Customize!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body:
                "You also can choose a background image and set a desired limit in the counting.",
            image: Image.asset(
              'assets/vectors/three.png',
              height: 400,
              width: 400,
            ),
            decoration: const PageDecoration(
              imagePadding: EdgeInsets.only(top: 80),
            ),
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
