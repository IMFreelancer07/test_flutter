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
            actions: [
              Center(
                  child: badges.Badge(
                    badgeContent: Text("5"),
                    child: Icon(Icons.shopping_cart),
                  )
              ),
              SizedBox(width: 15,),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: badges.Badge(
                  badgeContent: Text("1"),
                  child: Icon(Icons.settings),
                  badgeStyle: badges.BadgeStyle(badgeColor: Colors.black26),
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
