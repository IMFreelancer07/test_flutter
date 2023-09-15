import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/DropDownListApi.dart';
import 'package:test_flutter/covid_tracker_app/view/splash_screen_covid_app.dart';

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
    return const MaterialApp(
      home: Center(child: Text("Work in progress...!")),
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!
