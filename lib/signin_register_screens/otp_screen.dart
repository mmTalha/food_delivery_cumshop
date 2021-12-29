import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'create_account_screen.dart';


class otp_screen extends StatelessWidget {
  const otp_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),

          elevation: 0.0,


        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Center(child: Text( 'Verify phone number', style: TextStyle(color: Colors.black, fontSize: 24),)),
            Center(child: Text( 'Enter the 4-Digit code sent  ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
            Center(child: Text( 'to you at +1501333982 ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: PinCodeTextField(
                // controller:otpfield123  ,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,

                pinTheme: PinTheme(
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  selectedColor: Colors.white,
                  disabledColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.grey,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,

                // onCompleted: (v) {
                //   print("Completed");
                //   value=v;
                // },
                // onChanged: (value) {
                //   print(value);
                //   setState(() {
                //     currenttext = value;
                //   });
                // },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
                appContext: context,
                onChanged: (String value) {},
              ),
            ),
            Center(
              child: Container(
                  height: 40,
                  width: 160,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromRGBO(252, 186, 24, 1),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push (
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  find_resturent()),

                        );
                      }



                  )
              ),
            ),
            SizedBox(height: 10,),
            RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Didn’t receive code? ",


                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  TextSpan(
                    text: "Resend Again.",
                    style: TextStyle(
                      color: Color.fromRGBO(252, 186, 24, 1),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login_screen()),
                        );
                      },
                  ),
                ])),
            SizedBox(height: 10,),
            Center(child: Text( 'By Signing up you agree to our ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
            Center(child: Text( 'Terms Conditions & Privacy Policy.', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
          ],
        )
    );
  }
}
