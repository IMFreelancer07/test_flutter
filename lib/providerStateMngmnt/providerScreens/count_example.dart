import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    super.initState();

    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });

  }

  @override
  Widget build(BuildContext context) {

    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Test Provider");
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Provider State"),
        centerTitle: true,
      ),
      body: Consumer<CountProvider>(builder: (context, value, child){

        print("Test Provider only this builds");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Text(value.count.toString(), style: TextStyle(fontSize: 50),))
          ],
        );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
