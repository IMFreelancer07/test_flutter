import 'package:flutter/material.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';
import 'package:test_flutter/multirole_App/splash_screen.dart';

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
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Multi_Role_App"),
          ),
          body: Splash_Screen(),
        ),
      ),
    );
  }

}

// Center(child: Text("Work in progress...!"))
