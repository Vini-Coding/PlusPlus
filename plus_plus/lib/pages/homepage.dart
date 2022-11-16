import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:plus_plus/main.dart';
import 'package:plus_plus/widgets/rectangularButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  @override
  void initState() {
    super.initState();
    loadField();
  }

  Future<void> loadField() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String? pathString = prefs.getString("image");
      if (pathString != null) {
        _image = File(pathString);
      }
      limitController.text = prefs.getString("limit") ?? "";
    });
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("image", imageTemporary.path);

    setState(() {
      _image = imageTemporary;
      showSnackBar(context, "Background image updated succesfully");
    });
  }

  final formKey = GlobalKey<FormState>();
  final limitController = TextEditingController();

  String? validateLimit(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Set the capacity limit!";
    }
    return null;
  }

  Future<void> nextPage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('limit', limitController.text);
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        '/count',
        arguments:
            Arguments(txtInput: int.parse(limitController.text), image: _image),
      );
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
      padding: const EdgeInsets.all(20),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 204, 14, 0),
                Colors.red,
                Color.fromARGB(255, 255, 95, 83),
                Color.fromARGB(255, 255, 160, 153),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Plus+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Set the capacity limit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: TextFormField(
                            validator: validateLimit,
                            controller: limitController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 226, 226, 226),
                              hintText: "Enter a number...",
                            ),
                            onFieldSubmitted: (String message) {
                              message = "Limit updated succesfully";
                              showSnackBar(context, message);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Change the Background image",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        rectangularButton(
                          title: 'Pick image from gallery',
                          icon: Icons.image,
                          onClick: getImage,
                          image: _image,
                        ),
                        const SizedBox(
                          height: 110,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: 300,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57),
                                  blurRadius: 4),
                            ],
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 197, 13, 0),
                                Color.fromARGB(255, 255, 20, 4),
                                Color.fromARGB(255, 255, 95, 83),
                                Color.fromARGB(255, 255, 160, 153),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              nextPage(context);
                            },
                            child: const Text(
                              'Start Count',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}