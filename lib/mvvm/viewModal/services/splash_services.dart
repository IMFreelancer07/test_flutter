
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:test_flutter/mvvm/modal/user_modal.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';

class SplashServices {

  Future<UserModal> getUserData() => UserViewModal().getUser();
  Future<bool> removeUserData() => UserViewModal().removeUser();


  void getAuthentication (BuildContext context) async {
    getUserData().then((value) async{

      if (value.token.toString() == null || value.token.toString() == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print("Error Occured");
      }
    });
  }

  //not implemented, however working fine.
  void removeUser (BuildContext context) async {
    removeUserData().then((value) async{

      if (value){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
        Utils.toastMessage("Logged out.");
      } else {
        Utils.flushBarErrorMessages("Error Logging Out. Try again!", context);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print("Error Occured");
      }
    });
  }

}