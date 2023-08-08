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
          title: const Text(
            "Learn Flutter",
            style: TextStyle(
                fontSize: 30, fontFamily: 'Borel', fontWeight: FontWeight.w500),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("I am Row"),
                  Icon(Icons.access_alarm),
                  Icon(Icons.add_circle),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text("Container 1"),
                ),
              ),
              const SizedBox(
                height: 10,
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
