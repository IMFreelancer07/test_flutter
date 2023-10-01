
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/mvvm/modal/user_modal.dart';

class UserViewModal with ChangeNotifier {

  Future<bool> saveUser(UserModal user) async{

    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("token", user.token.toString());

    return true;
  }

  Future<UserModal> getUser() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    return UserModal(
      token: token.toString()
    );
  }

  Future<bool> removeUser() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    return sp.clear();

  }
}