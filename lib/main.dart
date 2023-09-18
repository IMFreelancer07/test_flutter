import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providerStateMngmnt/providerScreens/count_example.dart';

import 'providerStateMngmnt/Provider/count_provider.dart';

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

    return ChangeNotifierProvider(
        create: (_) => CountProvider(),
      child: const MaterialApp(
        home: CountExample(),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!
