import 'package:flutter/material.dart';

import 'mvvm/utils/routes/routes.dart';
import 'mvvm/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!
