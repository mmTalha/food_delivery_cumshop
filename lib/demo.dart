import 'package:flutter/material.dart';
import 'package:food_app/provider/signnapi.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';

class dem extends StatefulWidget {
  const dem({Key? key}) : super(key: key);

  @override
  State<dem> createState() => _demState();
}

class _demState extends State<dem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          await GoogleSignInApi.logout();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => login_screen()));
        },
        child: Container(
          color: Colors.amber,
          height: 300,
          width: 200,
        ),
      ),
    );
  }
}
