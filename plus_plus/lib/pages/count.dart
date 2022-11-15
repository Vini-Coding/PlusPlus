import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:plus_plus/main.dart';

class Count extends StatefulWidget {
  static const routeName = '/count';
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 0;
  late int limit;
  late File? image;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == limit;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Arguments;
    limit = int.parse("${arguments.txtInput}");
    image = arguments.image;
    //debugPrint(image?.path);
    //final file = File(image!.path);
    
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            "Plus+",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image == null
                ? const AssetImage('assets/images/background.png')
                : Image.file(image!).image,
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  isFull ? 'The place is full!' : 'Welcome!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: isFull ? Colors.red : Colors.white),
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    child: const Text(
                      "Exit",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white,
                      primary: Colors.black,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    child: const Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.5) : Colors.white,
                      primary: Colors.black,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
