import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/api_home_screen.dart';
import 'package:test_flutter/apis_tuts/api_userdata_screen.dart';

import 'apis_tuts/api_userdata_complex.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: complexUserDataApi(),
    );
  }
}

// Center(child: Text("Work in progress...!"))
