import 'package:flutter/material.dart';
import 'apis_tuts/uploadfile_ApiTuts.dart';

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
      home: uploadFile_PostApi(),
    );
  }
}

// Center(child: Text("Work in progress...!"))
// ApiTuts-GetApi!
