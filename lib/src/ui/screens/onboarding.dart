import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/models/page_model.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/login/loginregister.dart';
import 'package:hizboufront/src/ui/screens/splash_screen.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //_checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seen = prefs.getBool('seenOnboarding');

    if (seen == null || !seen) {
      // If onboarding hasn't been seen, show the onboarding page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    } else {
      // If onboarding has been seen, navigate to Home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  Future<void> _onboardingComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  final List<PageModel> pages = [
    PageModel(
      backgroundImage: 'images/onb1.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet consectetur. Ut pulvinar pellentesque amet platea facilisis elei',
    ),
    PageModel(
      backgroundImage: 'images/onb2.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet consectetur. Ut pulvinar pellentesque amet platea facilisis elei',
    ),
    PageModel(
      backgroundImage: 'images/onb3.png',
      title: 'Lorem ipsum',
      description:
          'Lorem ipsum dolor sit amet consectetur. Ut pulvinar pellentesque amet platea facilisis elei',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isTablet = width > 600;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: height - height / 3 + 100,
            child: Image.asset(
              pages[currentIndex].backgroundImage,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
          Positioned.fill(
            top: height * 0.70,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32.0 : 12.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: pages[currentIndex].buildTitleText(
                      color: Colors.black,
                      size: isTablet ? 48 : 32,
                      weight: FontWeight.normal,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: pages[currentIndex].buildDescriptionText(
                      color: Colors.black,
                      size: isTablet ? 24 : 16,
                      weight: FontWeight.normal,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  if (currentIndex != pages.length - 1)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              for (int i = 0; i < pages.length; i++)
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                  ),
                                  width: i == currentIndex ? 24.0 : 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    color: i == currentIndex
                                        ? AppColors.green1
                                        : AppColors.green1,
                                    borderRadius: i == currentIndex
                                        ? BorderRadius.circular(40.0)
                                        : BorderRadius.circular(10.0),
                                  ),
                                ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (currentIndex < pages.length - 1) {
                                  currentIndex++;
                                }
                              });
                            },
                            child: Image.asset('images/next.png', width: 40),
                          ),
                        ],
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () {
                        _onboardingComplete(); // Mark onboarding as complete
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.green1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 12.0,
                        ),
                        child: Center(
                          child: TitleText(
                            data: 'Terminer',
                            color: Colors.white,
                            size: 15,
                            weight: FontWeight.w400,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
