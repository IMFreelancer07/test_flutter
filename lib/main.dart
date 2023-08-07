import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
        title: const Text("LearnFlutter"),
      ),
      body: const Center(
        child: Image(
          image: AssetImage("assets/test.jpg"),
        ),
      ),
    ),
  ));
}
