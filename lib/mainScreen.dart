import 'package:flutter/material.dart';
import 'package:test_flutter/apis_tuts/FlutterAPIs.dart';
import 'package:test_flutter/apis_tuts/api_home_screen.dart';
import 'package:test_flutter/covid_tracker_app/view/splash_screen_covid_app.dart';
import 'package:test_flutter/flutter_firebase/ui/splash_screen.dart';
import 'package:test_flutter/home_screen.dart';
import 'package:test_flutter/mvvm/res/components/round_button.dart';
import 'package:test_flutter/mvvm/view/splash_view.dart';
import 'package:test_flutter/whatsapp_home.dart';

class mainScreenFlutter extends StatefulWidget {
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButton(title: "Firebase Practice", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenFirebase()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "Covid Tracker App", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreenCovidApp()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "WhatsApp UI", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WhatsAppHome()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "Flutter Navigation Drawer", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationDrawerHome()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "Flutter RestAPIs", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FlutterAPIsHome()));
                }),
                SizedBox(height: 50,),
                RoundButton(title: "Firebase Practice", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashViewMVVM()));
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
