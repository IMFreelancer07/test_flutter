import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/viewModal/services/splash_services.dart';

class SplashViewMVVM extends StatefulWidget {
  const SplashViewMVVM({super.key});

  @override
  State<SplashViewMVVM> createState() => _SplashViewMVVMState();
}

class _SplashViewMVVMState extends State<SplashViewMVVM> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    splashServices.getAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen", style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
