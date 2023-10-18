import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';

import '../../socialMedia_res/socialMedia_fonts.dart';



class socialMedia_SplashScreen extends StatefulWidget {
  const socialMedia_SplashScreen({Key? key}) : super(key: key);

  @override
  State<socialMedia_SplashScreen> createState() => _socialMedia_SplashScreenState();
}

class _socialMedia_SplashScreenState extends State<socialMedia_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png')),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Syedtechsolutions' , style: TextStyle(color: AppColors.whiteColor, fontFamily: AppFonts.sfProDisplayBold , fontSize: 40, fontWeight: FontWeight.w700),)),
              )
            ],
          )
      ),
    );
  }
}