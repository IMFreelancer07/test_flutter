
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/view/home_screen.dart';
import 'package:test_flutter/mvvm/view/login_view.dart';
import 'package:test_flutter/mvvm/view/signUp_View.dart';
import 'package:test_flutter/mvvm/view/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RoutesName.sign_up:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined."),
            ),
          );
        });
    }
  }
}