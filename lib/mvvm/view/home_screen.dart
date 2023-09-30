import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/mvvm/res/components/round_button.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:test_flutter/mvvm/viewModal/services/splash_services.dart';
import 'package:test_flutter/mvvm/viewModal/user_view_modal.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final userPref = Provider.of<UserViewModal>(context);

    final height = MediaQuery
        .of(context)
        .size
        .height * 1;

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Wellcome Home", style: Theme.of(context).textTheme.headlineLarge,),
          ),

          SizedBox(height: height * 0.08,),
          RoundButton(
              title: "Logout",
              onPress: (){
                userPref.removeUser().then((value) async{
                  await Future.delayed(Duration(seconds: 3));
                  Navigator.pushNamed(context, RoutesName.login);
                  Utils.toastMessage("Logged out.");
                }).onError((error, stackTrace){

                  Utils.flushBarErrorMessages("Error Logging Out. Try again!", context);
                    if(kDebugMode){
                      print("Error Occured"+error.toString());
                    }
                });
              }
          )
        ],
      ),
    );
  }
}
