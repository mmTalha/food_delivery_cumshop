
import 'package:flutter/material.dart';
import 'package:food_app/onboarding_screens/onborading_screen.dart';
import 'package:food_app/onboarding_screens/splash_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'onboarding_screens/onboarding.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => cartprovider()),
        ChangeNotifierProvider(create: (_) => api_calls()),
      ],
      child:   MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  Color.fromRGBO(250,249,249, 1),
        fontFamily:  'SF-pro',
        // primaryColor:  Color.fromRGBO(245, 245, 245, 1),
        //
        backgroundColor: Color.fromRGBO(250,249,249, 1),
      ),
      home: IntroPage(),
    );
  }
}
