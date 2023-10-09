
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UtilsFirebase{

  void toastMessageFirebase (String message){
    Toast.show(
      message,
      backgroundColor: Colors.red,
      textStyle: TextStyle(color: Colors.white, fontSize: 15),
      duration: 1,
    );
  }
}