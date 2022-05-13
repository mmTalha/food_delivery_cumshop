import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/Tabbar_screens/tabbar_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/provider/signinapi.dart';
import 'package:food_app/signin_register_screens/create_account_screen.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:food_app/signin_register_screens/forgot_password_screen.dart';
import 'package:food_app/signin_register_screens/phone_number_screen.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var nam;
  var ema;
  var siin;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;
    final provider = Provider.of<api_calls>(context);
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            find_resturent(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.bounceIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sign In',
            style: TextStyle(color: Colors.black),
          ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => create_acount_screen()),
                          );
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
                        controller: password,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
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
                  Center(
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        height: 40,
                        width: 160,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(252, 186, 24, 1),
                            child: Text(
                              'Signin',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              provider.login(
                                  email.text, password.text, context);
                              print(email.value);
                              print(password.text);
                              Navigator.push(
                                context,
                                _createRoute(),
                              );
                            })),
                  ),
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
                            'Connect with Facebook',
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
                  InkWell(
                    onTap: () {
                      signIn(context);
                    },
                    child: Center(
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
                              'Connect with Google',
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
                  ),
                ]),
          ),
        ));
  }

  Future signIn(BuildContext context) async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to Login")));
    } else {
      nam = user.displayName;
      ema = user.email;
      // print( user.displayName.toString());
      // print(user.email.toString());
      print(nam);
      print(ema);

      siin;
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => dem()));

      // // }
    }
    Future signs() async {
      final multipartRequest = new http.MultipartRequest("POST",
          Uri.parse("https://dnpprojects.com/demo/comshop/api/googleLogin"));

      multipartRequest.fields.addAll({
        "name": nam,
        "email": ema,
      });
      http.StreamedResponse response = await multipartRequest.send();

      var responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        setState(() {
          print(nam);
          print(ema);
          visible = false;
        });
      }
      if (responseString ==
          '{"success":false,"message":"Validation Error.","data":{"email":["The email has already been taken."]}}') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/crs.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email Address has Already Registered",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => login_screen()),
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'images/chk.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new Text(
                    "User Register Sucessfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => find_resturent()),
                    );
                  },
                ),
              ],
            );
          },
        );
      }

      print("response: " + responseString);
      print("response Status: ${response.statusCode}");
    }

    siin = signs();
  }
}
