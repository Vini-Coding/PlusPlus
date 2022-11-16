import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel IntroPage({
  required String title, 
  required String body, 
  required String imagePath,
}) {
  return PageViewModel(
    titleWidget: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Text(title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          )),
    ),
    body: body,
    image: Image.asset(
      imagePath,
      height: 400,
      width: 400,
    ),
    decoration: const PageDecoration(
      imagePadding: EdgeInsets.only(top: 80),
    ),
    reverse: false,
  );
}
