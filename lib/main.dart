
import 'package:flutter/material.dart';
import 'package:food_app/onboarding_screens/onborading_screen.dart';
import 'package:food_app/onboarding_screens/splash_screen.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'onboarding_screens/onboarding.dart';

void main() {
  runApp(ChangeNotifierProvider<cartprovider>(
      create: (_) => cartprovider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:  'Roboto',
        primarySwatch: Colors.blue,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      home: IntroPage(),
    );
  }
}
