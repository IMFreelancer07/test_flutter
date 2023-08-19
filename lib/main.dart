import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = "Main_Screen";

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Readmoretxt"),
            backgroundColor: Colors.blueGrey,
          ),
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'Stay',
                style: TextStyle(fontSize: 43.0),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                  color: Colors.red
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('CONSISTANT'),
                    RotateAnimatedText('FOCUSSED'),
                    RotateAnimatedText('COMITTED'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
