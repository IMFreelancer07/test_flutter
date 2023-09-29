

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:test_flutter/mvvm/repository/auth_repository.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){

    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    setLoading(true);
    _myRepo.loginApi(data)
        .then((value){
          setLoading(false);
          Navigator.pushNamed(context, RoutesName.home);
          if(kDebugMode){
            Utils.toastMessage(value.toString());
          }

    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode) {
        Utils.flushBarErrorMessages(error.toString(), context);

      }
    });
  }
}