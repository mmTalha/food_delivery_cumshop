import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/onboarding_screens/onboarding.dart';
import 'package:food_app/onboarding_screens/onborading_screen.dart';





class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'images/splash.png',splashIconSize: 200,
      nextScreen: Onbording(),
      splashTransition: SplashTransition. sizeTransition,

      backgroundColor: Color.fromRGBO( 24, 193, 128,1),


    );
  }
  }




