import 'package:flutter/material.dart';
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
      title: "learn_flutter",
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: WhatsAppHome(),
    );
  }
}

// Center(child: Text("Work in progress...!"))
