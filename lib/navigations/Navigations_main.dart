import 'package:flutter/material.dart';
import 'package:test_flutter/utils/routes.dart';
import 'package:test_flutter/utils/routes_name.dart';

class Navigations_main extends StatefulWidget {
  static const String id = "Main_Screen";

  const Navigations_main({super.key});

  @override
  State<Navigations_main> createState() => _Navigations_mainState();
}

class _Navigations_mainState extends State<Navigations_main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterNavs",
      initialRoute: RouteName.navHomeScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

// Center(child: Text("Work in progress...!"))