import 'package:flutter/material.dart';
import 'package:test_flutter/navigations/nav_home.dart';
import 'package:test_flutter/navigations/nav_screen_two.dart';
import 'package:test_flutter/navigations/nav_third_screen.dart';
import 'package:test_flutter/utils/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.navHomeScreen:
        return MaterialPageRoute(builder: (context) => NavHomeScreen());

      case RouteName.screenTwoNav:
        return MaterialPageRoute(builder: (context) => ScreenTwoNav( data : settings.arguments as Map));

      case RouteName.screenThreeNav:
        return MaterialPageRoute(builder: (context) => ScreenThreeNav());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
              body:
              Center(child: Text("No page route defined!")),
          );
        });
    }
  }
}