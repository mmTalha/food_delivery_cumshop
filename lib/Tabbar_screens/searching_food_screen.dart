import 'package:flutter/material.dart';



class searching_food_screen extends StatelessWidget {
  const searching_food_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Container(
             padding: EdgeInsets.only(left: 15, right: 15, top: 30),

             child: Column(
           children: [
             Center(
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white.withAlpha(10),
                   borderRadius: BorderRadius.all(
                     Radius.circular(10),
                   ),
                 ),
                 width: 300,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 0),
                   child: TextFormField(
                     decoration: InputDecoration(
                         prefixIcon: Icon(Icons.search),
                         alignLabelWithHint: true,
                         hintStyle: TextStyle(
                           fontFamily: 'Roboto',
                         ),
                         prefixStyle: TextStyle(color: Colors.grey),
                         hintText: 'Search',
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                               color: Colors.grey,
                             )),
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(
                               color: Colors.grey,
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
             ),
           ],
         )),
       ),
    );
  }
}
