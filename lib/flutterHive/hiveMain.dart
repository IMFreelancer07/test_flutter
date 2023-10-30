import 'package:flutter/material.dart';
import 'package:test_flutter/flutterHive/hiveHome.dart';

class hiveMain extends StatefulWidget {
  const hiveMain({super.key});

  @override
  State<hiveMain> createState() => _hiveMainState();
}

class _hiveMainState extends State<hiveMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hiveHome(),
    );
  }
}
