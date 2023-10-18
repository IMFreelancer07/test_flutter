import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_round_button.dart';

class socialMedia_loginScreen extends StatefulWidget {
  const socialMedia_loginScreen({super.key});

  @override
  State<socialMedia_loginScreen> createState() => _socialMedia_loginScreenState();
}

class _socialMedia_loginScreenState extends State<socialMedia_loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialMedia_RoundButton(
              title: "Login",
              onPress: (){},
          )
        ],
      ),
    );
  }
}
