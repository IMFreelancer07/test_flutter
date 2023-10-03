import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/firebase_services/splash_services.dart';

class SplashScreenFirebase extends StatefulWidget {
  const SplashScreenFirebase({super.key});

  @override
  State<SplashScreenFirebase> createState() => _SplashScreenFirebaseState();
}

class _SplashScreenFirebaseState extends State<SplashScreenFirebase> {

  SplashServicesFirebase splashServices = SplashServicesFirebase();

  @override
  void initState() {

    super.initState();

    splashServices.isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Firebase Splash Screen", style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
