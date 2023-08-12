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
              child: Container(
                height: 200,
                width: 250,
                padding: EdgeInsets.all(0),
                transform: Matrix4.rotationZ(.15),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: .5
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png"),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.deepPurpleAccent,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Center(child: Text("Flutter Image Button")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
