import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_fonts.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_routes.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/splash/socialMedia_splash_screen.dart';

class mainSocialMedia extends StatefulWidget {
  const mainSocialMedia({super.key});

  @override
  State<mainSocialMedia> createState() => _mainSocialMediaState();
}

class _mainSocialMediaState extends State<mainSocialMedia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SocialMedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 22, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor)
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 40, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w500, height: 1.6),
          headline2: TextStyle(fontSize: 32, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w500, height: 1.6),
          headline3: TextStyle(fontSize: 28, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w500, height: 1.9),
          headline4: TextStyle(fontSize: 24, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w500, height: 1.6),
          headline5: TextStyle(fontSize: 20, fontFamily: AppFonts.sfProDisplayMedium, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w500, height: 1.6),
          headline6: TextStyle(fontSize: 17, fontFamily: AppFonts.sfProDisplayBold, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w700, height: 1.6),

          bodyText1: TextStyle(fontSize: 17, fontFamily: AppFonts.sfProDisplayBold, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w700, height: 1.6),
          bodyText2: TextStyle(fontSize: 14, fontFamily: AppFonts.sfProDisplayRegular, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w400, height: 1.6),

          caption: TextStyle(fontSize: 12, fontFamily: AppFonts.sfProDisplayBold, color: AppColors.primaryTextTextColor, fontWeight: FontWeight.w400, height: 2.26),
        ),
      ),
      home: const socialMedia_SplashScreen(),
      initialRoute: socialMedia_RouteName.loginView,
      onGenerateRoute: socialMedia_Routes.generateRoute,
    );
  }
}
