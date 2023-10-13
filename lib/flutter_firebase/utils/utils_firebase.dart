
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UtilsFirebase{

  void toastMessageFirebase (String message, bool success){
    Toast.show(
      message,
      backgroundColor: success? Colors.green : Colors.red,
      textStyle: const TextStyle(color: Colors.white, fontSize: 15),
      duration: 1,
    );
  }
}