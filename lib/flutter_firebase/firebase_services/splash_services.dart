
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_screen_firebase.dart';

class SplashServicesFirebase{

  void isLoggedIn(BuildContext context){

    Timer(Duration(seconds: 3),
            ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenFirebase()))
    );
  }
}