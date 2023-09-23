import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  /**
   * https://reqres.in/api/login
   * {
      "email": "eve.holt@reqres.in",
      "password": "cityslicka"
      }
   * **/

  void login(String email, String password) async {

    setLoading(true);
    try {

      final response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {
            "email" : email,
            "password" : password,
          }
      );

      if(response.statusCode == 200){
        print("LoggedIn Successfully");
        setLoading(false);
      } else {
        print("Failed to logIn");
        setLoading(false);
      }
    }catch(e){
      setLoading(false);

      print(e.toString());
    }
  }
}