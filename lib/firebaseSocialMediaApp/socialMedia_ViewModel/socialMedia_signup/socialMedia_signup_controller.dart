import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';

class socialMedia_singUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  bool _loading = false;
  bool get loading => _loading;

  setLoading (bool value){
    _loading = value;
    notifyListeners();
  }

  void signup(BuildContext context, String username, String email, String password) async {
    
    setLoading(true);

    try{
      auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        ref.child(value.user!.uid.toString()).set({
          'uid' : value.user!.uid.toString(),
          'email' : value.user!.email.toString(),
          'onlineStatus' : 'none',
          'phone' : '',
          'userName' : username,
          'profile' : ''
        }).then((value) {
          setLoading(false);
          socialMedia_utils.toastMessage_socialMedia("User Created Successfully", true);
          Navigator.pushNamed(context, socialMedia_RouteName.dashboard_view);
        }).onError((error, stackTrace) {
          setLoading(false);
          socialMedia_utils.toastMessage_socialMedia(error.toString(), false);
        });
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