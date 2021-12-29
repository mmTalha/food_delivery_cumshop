import 'package:flutter/material.dart';
import 'package:food_app/signin_register_screens/create_account_screen.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:food_app/signin_register_screens/otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';




class phone_number_screen extends StatelessWidget {
  const phone_number_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,


      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(child: Text( 'Get started with Foodly', style: TextStyle(color: Colors.black, fontSize: 24),)),
            Center(child: Text( 'Enter your phone number to use foodly ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
            Center(child: Text( 'and enjoy your food. ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),)),
            SizedBox(height: 30,),
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

                  keyboardType: TextInputType.phone,



                  decoration: InputDecoration(
                      suffixStyle: TextStyle(color: Colors.grey) ,
                      suffixIcon: Icon(Icons.check,color: Color.fromRGBO(252, 186, 24, 1),),

                      prefixStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter your phone number',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(15),
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
            SizedBox(height: 15,),
            Center(
              child: Container(
                  height: 50,
                  width: 290,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  otp_screen()),

                        );
                      }



                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}
