import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/dashboard.dart';
import 'package:food_app/Tabbar_screens/orders.dart';
import 'package:food_app/Tabbar_screens/profile.dart';
import 'package:food_app/Tabbar_screens/search_screen.dart';
import 'package:food_app/categories/categories.dart';


class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    // home_screen1(),
    // SignIn(),
    // aboutus(),
    dashboard_screen(),
    categories(),
    orders(),
    Profile(),


  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        backgroundColor:  Color.fromRGBO(230, 231, 232,10  ) ,
        selectedItemColor: Color.fromRGBO(252, 186, 24, 1) ,
        unselectedItemColor: Colors.black.withOpacity(.60),
        selectedFontSize: 10,
        unselectedFontSize: 8,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(  'Home' ),

          ),
          // BottomNavigationBarItem(
          //     icon: new Icon(Icons.home),
          //     title: new Text("DemoHome")
          // ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.search),
            title: Text(  'Search' ) ,      ),
          BottomNavigationBarItem(

              icon: Icon(Icons. dashboard),
              title: Text(  'Orders' )
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons. person),
              title: Text(  'Profile' )         ),
        ],
      ),
    );
  }
}


