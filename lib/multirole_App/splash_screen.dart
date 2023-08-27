import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/multirole_App/login_screen.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';
import 'package:test_flutter/multirole_App/student_screen.dart';
import 'package:test_flutter/multirole_App/teacher_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();

    isLoggedIn();
  }

  void isLoggedIn() async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    bool? is_logged_in = sprefs.getBool("isLoggedIn") ?? false;
    String? role = sprefs.getString("role") ?? "";

    if (is_logged_in) {
      Timer(Duration(seconds: 5), () {
        if (role == "student") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Student_Screen()));
        } else if (role == "teacher") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Teacher_Screen()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MR_Home()));
        }
      });
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login_Screen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            "https://static.vecteezy.com/system/resources/previews/024/724/494/original/a-male-lion-is-roaring-isolated-on-a-transparent-background-powerful-strong-lion-roar-generative-ai-png.png"),
      ),
    );
  }
}
