import 'package:flutter/material.dart';
import 'package:food_app/signin_register_screens/create_account_screen.dart';
import 'package:food_app/signin_register_screens/login_screen.dart';
import 'package:food_app/signin_register_screens/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  _change_passwordState createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  bool visible = false;
  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  controller: _oldpassword,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    }
                    // else if (value.length < 7) {
                    //   return "Must be more than 7 charater";
                    // }
                    return null;
                  },
                  //  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _newpassword,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    } else if (value.length < 7) {
                      return "Must be more than 7 charater";
                    }
                    return null;
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _confirmpassword,
                  validator: (var value) {
                    if (value!.isEmpty) {
                      return "please enter pasword";
                    } else if (value.length < 7) {
                      return "Must be more than 7 charater";
                    }
                    return null;
                  },
                  // obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'COnfirm password',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                if (_formkey.currentState!.validate()) {
                                  print("Sucessful");
                                } else {
                                  print("Unsucessful");
                                }
                                changePassword();
                              })),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changePassword() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final multipartRequest = new http.MultipartRequest("POST",
        Uri.parse("https://dnpprojects.com/demo/comshop/api/changePassword"));

    multipartRequest.fields.addAll({
      "old_password": _oldpassword.text,
      "password": _newpassword.text,
      "confirm_password": _confirmpassword.text,
    });
    multipartRequest.headers.addAll(userHeader);
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString == '{"status":true,"success":"Password updated."}') {
      _oldpassword.clear();
      _newpassword.clear();
      _confirmpassword.clear();

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: 80,
      //             width: 80,
      //             child: Image.asset(
      //               'images/crs.png',
      //               height: 80,
      //               width: 80,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             "Email Address has Already Registered",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 16),
      //           ),
      //         ],
      //       ),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (BuildContext context) =>
      //                       create_acount_screen()),
      //             );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } else {
      _oldpassword.clear();
      _newpassword.clear();
      _confirmpassword.clear();

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Column(
      //         children: [
      //           Container(
      //             height: 80,
      //             width: 80,
      //             child: Image.asset(
      //               'images/chk.png',
      //               height: 80,
      //               width: 80,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           new Text(
      //             "User Register Sucessfully",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 16),
      //           ),
      //         ],
      //       ),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (BuildContext context) => login_screen()),
      //             );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}
