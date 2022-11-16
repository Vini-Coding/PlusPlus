import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

Widget rectangularButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
  File? image,
}) {
  return Container(
    decoration: BoxDecoration(
      image: image != null
          ? DecorationImage(image: Image.file(image).image, fit: BoxFit.cover)
          : null,
    ),
    width: 400,
    height: 60,
    child: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: image != null ? MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 255, 95, 83).withOpacity(0.1),
            ) :  MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 95, 83),),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
