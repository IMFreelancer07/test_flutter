import 'package:flutter/material.dart';

class socialMedia_DashboardScreen extends StatefulWidget {
  const socialMedia_DashboardScreen({super.key});

  @override
  State<socialMedia_DashboardScreen> createState() => _socialMedia_DashboardScreenState();
}

class _socialMedia_DashboardScreenState extends State<socialMedia_DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wellcome to Dashboard"),
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
