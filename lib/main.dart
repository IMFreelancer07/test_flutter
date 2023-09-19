import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/multiP_provider.dart';
import 'package:test_flutter/providerStateMngmnt/providerScreens/count_example.dart';
import 'package:test_flutter/providerStateMngmnt/providerScreens/multiProviderScreen.dart';

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => multiP_Provider(),),
      ],
      child: const MaterialApp(
        home: multiProviderScreen(),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!
