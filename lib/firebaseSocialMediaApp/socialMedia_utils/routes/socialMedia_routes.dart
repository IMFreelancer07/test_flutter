import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/dashboard/socialMedia_dashboard_screen.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/forgot_password/socialMedia_forgot_password.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/login/socialMedia_login_screen.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/signup/socialMedia_sign_up_screen.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/splash/socialMedia_splash_screen.dart';


class socialMedia_Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case socialMedia_RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const socialMedia_SplashScreen());

      case socialMedia_RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const socialMedia_loginScreen());

      case socialMedia_RouteName.singUp_View:
        return MaterialPageRoute(builder: (_) => const socialMedia_Signup_View());

      case socialMedia_RouteName.dashboard_view:
        return MaterialPageRoute(builder: (_) => const socialMedia_DashboardScreen());

      case socialMedia_RouteName.forgotPassword_View:
        return MaterialPageRoute(builder: (_) => const socialMedia_forgotPasswordScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}