import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_Button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const String id = "Main_Screen";

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Loading Flutter..."),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(child: Text("Work in progress...!")),
        ),
      ),
    );
  }

}

// Center(child: Text("Work in progress...!"))
