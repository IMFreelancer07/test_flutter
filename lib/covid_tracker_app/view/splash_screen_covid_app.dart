import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:test_flutter/covid_tracker_app/view/world_stats.dart';


class SplashScreenCovidApp extends StatefulWidget {
  const SplashScreenCovidApp({Key? key}) : super(key: key);

  @override
  _SplashScreenCovidAppState createState() => _SplashScreenCovidAppState();
}

class _SplashScreenCovidAppState extends State<SplashScreenCovidApp> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
        () => Navigator.push(context, MaterialPageRoute(builder: (context)=> WorldStatsCovid()))
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage('images/virus.png'),),
                  ),
                ),
                builder: (BuildContext build, Widget? child){
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
            const Align(
              alignment: Alignment.center,
              child: Text("Covid-19\nTacker App", textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            )
          ],
        ),
      ),
    );
  }
}