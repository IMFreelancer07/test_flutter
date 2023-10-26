import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';

import '../services/socialMedia_sessionManager.dart';

class socialMedia_forgotPasswordController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) async {

    setLoading(true);

    try{
      auth.sendPasswordResetEmail(
          email: email,
      ).then((value){

        setLoading(false);
        Navigator.pushNamed(context, socialMedia_RouteName.loginView);
        socialMedia_utils.toastMessage_socialMedia("Check you email for password recovery.", true);
      }).onError((error, stackTrace){
        socialMedia_utils.toastMessage_socialMedia(error.toString(), false);
        setLoading(false);
      });
    } catch (e){
      setLoading(false);
      socialMedia_utils.toastMessage_socialMedia(e.toString(), false);
    }
  }
}