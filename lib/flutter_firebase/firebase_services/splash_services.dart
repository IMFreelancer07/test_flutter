
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/Firestore/firestore_list_screen.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_screen_firebase.dart';

import '../ui/postsFirebase/postsScreenFirebase.dart';

class SplashServicesFirebase{

  void isLoggedIn(BuildContext context){

    FirebaseAuth _auth = FirebaseAuth.instance;

    final user = _auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 3),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => fireStoreScreen()))
      );
    } else {
      Timer(Duration(seconds: 3),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreenFirebase()))
      );
    }


  }
}