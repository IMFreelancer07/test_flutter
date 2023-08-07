import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green.shade300,
        appBar: AppBar(
          backgroundColor: Colors.green.shade600,
          centerTitle: true,
          title: const Text("Learn Flutter"),
        ),
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.grey[700],
            child: Center(
              child: Text("Container"),
            ),
          ),
        ),
      ),
    );
  }
}
