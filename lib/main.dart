import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/mainScreen.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

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
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: mainScreenFlutter(),
    );
  }
}

// Center(child: Text("Work in progress...!"))
