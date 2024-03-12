import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/FlutterAPIs.dart';
import 'package:test_flutter/covid_tracker_app/view/splash_screen_covid_app.dart';
import 'package:test_flutter/firebaseSocialMediaApp/mainSocialMedia.dart';
import 'package:test_flutter/flutterBlocStateMgmt/BlocMain.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/ui/counter_screen.dart';
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
                  const SizedBox(height: 30,),
                  RoundButton(title: "Covid Tracker App", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenCovidApp()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "WhatsApp UI", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WhatsAppHome()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Flutter Navigation Drawer", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationDrawerHome()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Flutter RestAPIs", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FlutterAPIsHome()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Flutter MultiroleApp", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash_Screen()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Flutter MVVM", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MVVM_main()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Social Media App", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainSocialMedia()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Hive Database", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>hiveMain()));
                  }),
                  const SizedBox(height: 30,),
                  RoundButton(title: "Bloc State Management", onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BlocMain()));
                  }),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
