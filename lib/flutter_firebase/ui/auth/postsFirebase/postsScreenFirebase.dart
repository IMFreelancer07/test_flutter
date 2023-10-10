import 'package:flutter/material.dart';

class PostScreenFirebase extends StatefulWidget {
  const PostScreenFirebase({super.key});

  @override
  State<PostScreenFirebase> createState() => _PostScreenFirebaseState();
}

class _PostScreenFirebaseState extends State<PostScreenFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
