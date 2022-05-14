import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/create_account_screen.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:food_app/signin_register_screens/forgot_password_screen.dart';
import 'package:provider/provider.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override

  @override

  Widget build(BuildContext context) {

    bool _isObscure = true;

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final provider = Provider.of<api_calls>(context, listen: true);
    void dispose() {
      email.dispose();
      password.dispose();
      // TODO: implement dispose
      super.dispose();
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign In'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),

          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Comchop',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your Phone number or Email',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: " For sign in, Or ",
                      style: TextStyle(
                          color: Color.fromRGBO(134, 134, 134, 1),
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: " Create new account. ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => create_acount_screen()),
                          // );
                        },
                    ),
                  ])),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(15),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 334,
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            suffixStyle: TextStyle(color: Colors.grey),
                            // suffixIcon: Icon(
                            //   Icons.check,
                            //   color: Color.fromRGBO(252, 186, 24, 1),
                            // ),
                            prefixStyle: TextStyle(color: Colors.grey),
                            hintText: 'Email Address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(15),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 334,
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                            prefixStyle: TextStyle(color: Colors.grey),
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(242, 242, 242, 1),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black.withAlpha(15),
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      forgot_password_screen()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromRGBO(134, 134, 134, 1),
                                fontSize: 16),
                          ))),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer<api_calls>(builder: (context, provider, child) {
                    return Center(
                      child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          height: provider.isvalue ? 40 : 45,
                          width: provider.isvalue ? 80 : 160,
                          child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color.fromRGBO(252, 186, 24, 1),
                              child: provider.isvalue
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Signin',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                              onPressed: () {
                                setState(() {
                                  provider.isvalue = true;
                                });
                                provider.login(
                                    email.text, password.text, context);


                              })),
                    );
                  }),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Text(
                    ' or',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  )),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(57, 89, 152, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            'Connects with Facebook',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          leading: Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(66, 133, 244, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        child: ListTile(
                          title: Text(
                            'Connects with Goggle',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          leading: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
