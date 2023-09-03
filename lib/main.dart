import 'package:flutter/material.dart';
import 'package:test_flutter/home_screen.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';
import 'package:test_flutter/multirole_App/splash_screen.dart';
import 'package:test_flutter/navigations/nav_screen_two.dart';
import 'package:test_flutter/navigations/nav_third_screen.dart';
import 'package:test_flutter/utils/routes.dart';
import 'package:test_flutter/utils/routes_name.dart';

import 'navigations/nav_home.dart';

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
    return Center(child: Text("Work in progress...!"));
  }
}

// Center(child: Text("Work in progress...!"))
