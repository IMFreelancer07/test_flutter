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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.3),
                    filled: true,
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: "Email",
                  labelText: "Email Field",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color : Colors.grey, width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color : Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.3),
                    filled: true,
                    prefixIcon: Icon(Icons.plus_one_sharp),
                    hintText: "Phone",
                    labelText: "Phone Number",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color : Colors.grey, width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color : Colors.blueGrey, width: 2),
                      borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(child: Text("Work in progress...!"))
