import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:test_flutter/whatsapp_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = "Main_Screen";

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Readmoretxt"),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(child: Text("Work in progress...!"))
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
