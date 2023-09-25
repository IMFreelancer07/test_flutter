import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.home);
                },
                child: Text("Click to go home"),
            ),
          )
        ],
      ),
    );
  }
}
