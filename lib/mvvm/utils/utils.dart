
import 'package:smartfluttertoast/smartfluttertoast.dart';

class Utils {

  static toastMessage(String message){

    Smartfluttertoast().showToast(message);
    // Fluttertoast.showToast(msg: message);
  }
}