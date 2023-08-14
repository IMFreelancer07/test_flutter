import 'package:flutter/material.dart';
import 'dart:math';

import 'package:test_flutter/home_screen.dart';
import 'package:test_flutter/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = "Main_Screen";
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test_flutter",
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id : (context) => HomeScreen(),
        SecondScreen.id : (context) => SecondScreen(),
        MyApp.id : (context) => MyApp()
      },
      // home: HomeScreen(),
    );
  }
}

// Center(child: Text("Work in progress...!"))
