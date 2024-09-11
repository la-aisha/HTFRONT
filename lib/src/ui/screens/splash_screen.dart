import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/routes/route_path.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/onboarding.dart';
import 'package:hizboufront/utils/screensize.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToNext() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool('seenOnboarding');
  String? token = prefs.getString('token_info');

  await Future.delayed(Duration(seconds: 2));

  if (seen == null || !seen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => OnboardingPage()),
    );
  // // } else if (token != null && token.isNotEmpty) {
  // //   Navigator.of(context).pushReplacement(
  // //     MaterialPageRoute(builder: (context) => Home()),
  // //   );
  } else {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}

  @override
  void initState() {
    super.initState();
    _navigateToNext() ;
  }

  @override
  Widget build(BuildContext context) {
    /* var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height; */
    final screenSize = ScreenSize(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.yellow,
          child: Center(
            child: Image.asset('images/logo1.png'),
          ),
        )
      ),
    );
  }
}
