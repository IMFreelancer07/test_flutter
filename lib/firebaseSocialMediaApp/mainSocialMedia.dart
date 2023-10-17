import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: const socialMedia_SplashScreen(),
      initialRoute: socialMedia_RouteName.splashScreen,
      onGenerateRoute: socialMedia_Routes.generateRoute,
    );
  }
}
