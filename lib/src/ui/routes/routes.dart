import 'package:flutter/material.dart';
import 'package:hizboufront/src/ui/screens/404/404.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/login/loginregister.dart';
import 'package:hizboufront/src/ui/screens/onboarding.dart';
import 'package:hizboufront/src/ui/screens/register/register.dart';
import 'package:hizboufront/src/ui/screens/splash_screen.dart';
import 'route_path.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.name;
    switch (arguments) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
       case loginregister:
        return MaterialPageRoute(builder: (_) => LoginRegister());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case register:
        return MaterialPageRoute(builder: (_) => Register());
      /*
      case qcg:
        return MaterialPageRoute(builder: (_) => QCGScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case singUp:
        return MaterialPageRoute(builder: (_) => SingUp());
      */

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen()); 
    }
  }
}
