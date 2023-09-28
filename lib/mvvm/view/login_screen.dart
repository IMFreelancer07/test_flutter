import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
            onTap: (){
              Utils.toastMessage("Clicked Login!");
              Utils.snakBar("SnackBarMsg", context);
              Utils.flushBarErrorMessages("FlushBarMsg", context);
            },
            child: Text("Click to go home"),
        ),
      ),
    );
  }
}
