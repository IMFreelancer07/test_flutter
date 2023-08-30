import 'package:flutter/material.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';
import 'package:test_flutter/multirole_App/splash_screen.dart';
import 'package:test_flutter/nav_screen_two.dart';

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
            title: Text("Navigation"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenTwoNav(
                                  name: 'Syed Dev',
                                  number: 07,
                                )));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Center(
                      child: Text("ScreenTwo"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
