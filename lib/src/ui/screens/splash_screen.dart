import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/routes/route_path.dart';
import 'package:hizboufront/src/ui/screens/onboarding.dart';
import 'package:hizboufront/utils/screensize.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
       /* Navigator.pushNamed(context, onboarding); */
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingPage()),
      );
    });
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
