import 'dart:async';

import 'package:flutter/material.dart';

/**
 * The setState cause whole screen to reload,
 * that could be hazardous for large apps like facebook, insta.
 * Hence, there must be mechanism to handle state management.
 * If we talk about state management, Provider comes to resue!
 **/

class WhyProviderState extends StatefulWidget {
  const WhyProviderState({super.key});

  @override
  State<WhyProviderState> createState() => _WhyProviderStateState();
}

class _WhyProviderStateState extends State<WhyProviderState> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhyProviderState?"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(count.toString(), style: TextStyle(fontSize: 60),)),
        ],
      ),
    );
  }
}
