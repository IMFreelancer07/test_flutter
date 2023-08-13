import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Learning Widgets")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blueGrey,
                backgroundImage: NetworkImage("https://www.iconarchive.com/download/i145613/aniket-suvarna/box-logo/bxl-flutter.1024.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
