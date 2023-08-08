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
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text("Container 1"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.indigo,
                child: const Center(
                  child: Text("Container 2"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
