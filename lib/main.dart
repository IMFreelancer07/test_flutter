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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text("Container's Text"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.indigo,
                  child: const Center(
                    child: Text("Container's Text"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
