import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/FlutterAPIs.dart';
import 'package:test_flutter/covid_tracker_app/view/splash_screen_covid_app.dart';
import 'package:test_flutter/firebaseSocialMediaApp/mainSocialMedia.dart';
import 'package:test_flutter/flutterHive/hiveMain.dart';
import 'package:test_flutter/flutter_firebase/ui/splash_screen.dart';
import 'package:test_flutter/home_screen.dart';
import 'package:test_flutter/multirole_App/splash_screen.dart';
import 'package:test_flutter/mvvm/MVVM_main.dart';
import 'package:test_flutter/mvvm/res/components/round_button.dart';
import 'package:test_flutter/navigations/Navigations_main.dart';
import 'package:test_flutter/whatsapp_home.dart';

class mainScreenFlutter extends StatefulWidget {
  static const String id = "Main_Screen";
  const mainScreenFlutter({super.key});

  @override
  State<mainScreenFlutter> createState() => _mainScreenFlutterState();
}

class _mainScreenFlutterState extends State<mainScreenFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundButton(title: "Firebase Practice", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenFirebase()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Covid Tracker App", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenCovidApp()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "WhatsApp UI", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WhatsAppHome()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Flutter Navigation Drawer", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationDrawerHome()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Flutter RestAPIs", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FlutterAPIsHome()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Flutter MultiroleApp", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash_Screen()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Flutter MVVM", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MVVM_main()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Social Media App", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainSocialMedia()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Hive Database", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>hiveMain()));
                  }),
                  SizedBox(height: 30,),
                  RoundButton(title: "Flutter GetX", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>hiveMain()));
                  }),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
