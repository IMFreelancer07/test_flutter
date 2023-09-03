import 'package:flutter/material.dart';

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({super.key});

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiTutorials"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
        ],
      ),
    );
  }
}
