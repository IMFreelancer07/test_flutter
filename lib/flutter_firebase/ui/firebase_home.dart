import 'package:flutter/material.dart';

class FirebaseHome extends StatefulWidget {
  const FirebaseHome({super.key});

  @override
  State<FirebaseHome> createState() => _FirebaseHomeState();
}

class _FirebaseHomeState extends State<FirebaseHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Home"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Wellcome to Firebase", style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
