import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Utils {


  static void fieldFocusShift (
      BuildContext context,
      FocusNode current,
      FocusNode nextNode){

    current.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String message) {
    Toast.show(message,
        backgroundColor: Colors.black,
        textStyle: TextStyle(color: Colors.white));
  }

  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        padding: EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(10),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        forwardAnimationCurve: Curves.decelerate,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }

  static snakBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(message)),
    );
  }
}
