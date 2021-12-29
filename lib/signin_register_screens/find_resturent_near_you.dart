import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/dashboard.dart';
import 'package:food_app/Tabbar_screens/tabbar_screen.dart';

class find_resturent extends StatelessWidget {
  const find_resturent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Find restaurants near you ',
            style: TextStyle(color: Colors.black, fontSize: 24),
          )),
          Center(
              child: Text(
            'Please enter your location or allow acess',
            style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
          )),
          Center(
              child: Text(
            ' to find restaurants near you.',
            style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
          )),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => tabbar()),
                );
              },
              child: Container(
                  height: 50,
                  width: 310,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(252, 186, 24, 1),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_location_outlined,
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      Text(
                        'User Current Location',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(15),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 310,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_location),
                  prefixStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter a New Address',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withAlpha(15),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black.withAlpha(15),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),
        ],
      ),
    );
  }
}
