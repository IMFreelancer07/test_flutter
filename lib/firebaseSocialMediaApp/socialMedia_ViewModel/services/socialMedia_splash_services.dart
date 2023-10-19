import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';

class socialMedia_SplashServices{

  void isLoggedIn(BuildContext context){
    Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context, socialMedia_RouteName.loginView));
  }
}