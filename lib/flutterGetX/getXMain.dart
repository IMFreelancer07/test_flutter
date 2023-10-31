import 'package:flutter/material.dart';
import 'package:test_flutter/flutterGetX/getXHome.dart';

class getXMain extends StatefulWidget {
  const getXMain({super.key});

  @override
  State<getXMain> createState() => _getXMainState();
}

class _getXMainState extends State<getXMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  getXHome(),
    );
  }
}
