import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/SignUpApituts.dart';
import 'package:test_flutter/apis_tuts/api_home_screen.dart';
import 'package:test_flutter/apis_tuts/api_userdata_screen.dart';
import 'package:test_flutter/apis_tuts/uploadfile_ApiTuts.dart';

import '../mvvm/res/components/round_button.dart';
import 'DropDownListApi.dart';

class FlutterAPIsHome extends StatefulWidget {
  const FlutterAPIsHome({super.key});

  @override
  State<FlutterAPIsHome> createState() => _FlutterAPIsHomeState();
}

class _FlutterAPIsHomeState extends State<FlutterAPIsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(title: "RestAPI Get", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiHomeScreen()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "RestAPI SignUp", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp_ApiTuts()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "RestAPI Get UserData", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>userDataApi()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "RestAPI to Dropdown list", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DropDownApiScreen()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "RestAPI Upload file (POST)", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>uploadFile_PostApi()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "RestAPI upload", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>uploadFile_PostApi()));
                }),
                SizedBox(height: 50,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
