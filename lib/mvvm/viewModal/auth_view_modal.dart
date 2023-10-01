

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mvvm/modal/user_modal.dart';
import 'package:test_flutter/mvvm/repository/auth_repository.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _loadingSignUp = false;
  bool get loadingSignUp => _loadingSignUp;

  setLoading(bool value){

    _loading = value;
    notifyListeners();
  }

  setLoadingSignUp(bool value){

    _loadingSignUp = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);
    _myRepo.loginApi(data)
        .then((value){
          setLoading(false);
          final userPref = Provider.of<UserViewModal>(context, listen: false);
          userPref.saveUser(
            UserModal(
              token: value['token'].toString(),
            )
          );
          Navigator.pushNamed(context, RoutesName.home);
          Utils.toastMessage("Logged In Successfully");
          if(kDebugMode){
            print(value.toString());
          }

    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode) {
        Utils.flushBarErrorMessages(error.toString(), context);

      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async{

    setLoadingSignUp(true);
    _myRepo.registerApi(data)
        .then((value){
      setLoadingSignUp(false);
      Navigator.pushNamed(context, RoutesName.login);
      if(kDebugMode){
        Utils.toastMessage(value.toString());
        Utils.flushBarErrorMessages("SignedUp Successfully. Please Login.", context);
      }

    }).onError((error, stackTrace) {
      setLoadingSignUp(false);
      if(kDebugMode) {
        Utils.flushBarErrorMessages(error.toString(), context);

      }
    });
  }
}