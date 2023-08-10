import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Center(
                child: Text(
                  "$x",
                  style: TextStyle(fontSize: 50),
                )
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            x++;
            setState(() {

            });
          },
          child: Icon(Icons.add_circle),
        ),
      ),
    );
  }
}

