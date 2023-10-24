import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:toast/toast.dart';

class socialMedia_utils {

  static void fiedlFocus_socialMedia(BuildContext context, FocusNode currentNode, FocusNode nextNode){

    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage_socialMedia (String message, bool success){
    Toast.show(
      message,
      backgroundColor: success? AppColors.primaryColor : AppColors.alertColor,
      textStyle: const TextStyle(color: Colors.white, fontSize: 15),
      duration: 1,
    );
  }
}