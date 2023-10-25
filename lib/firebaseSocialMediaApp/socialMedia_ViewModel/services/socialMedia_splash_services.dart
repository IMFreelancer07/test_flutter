import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';

class socialMedia_SplashServices{

  void isLoggedIn(BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user != null){
      socialMedia_sessionManager().userId = user.uid.toString();

      Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context, socialMedia_RouteName.dashboard_view));
    } else {
      Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context, socialMedia_RouteName.loginView));
    }

  }
}