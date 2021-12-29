import 'package:flutter/material.dart';
import 'package:food_app/signin_register_screens/otp_screen.dart';

class profile_details_screen extends StatelessWidget {
  const profile_details_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,

        title: Text('Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height ,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,

          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                labelText: 'Phone number',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 300,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.end  ,
            mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Center(
               child: Container(
                   height: 50,
                   width: 290,
                   child: MaterialButton(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),
                       color: Color.fromRGBO(252, 186, 24, 1),
                       child: Text(
                         'Change settings',
                         style: TextStyle(
                           fontFamily: 'Roboto',
                           color: Colors.white,
                         ),
                       ),
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (BuildContext context) => otp_screen()),
                         );
                       })),
             ),
           ],
         )
          ],
        ),
      ),
    );
  }
}
