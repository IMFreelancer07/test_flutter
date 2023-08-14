import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const String id = "Second_Screen";

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Text("Wellcome to Second Screen"),
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png"),
                    ),
                    title: Text("Syed"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
