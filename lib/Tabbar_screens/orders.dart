import 'package:flutter/material.dart';

class orders extends StatelessWidget {
  const orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming orders',
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    ' Clear all',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/mac.png'),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text('McDonald', style: TextStyle(
                      color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Shortbread, chocolate turtle\n cookiesand red velvet. ',
                        style: TextStyle(
                          color: Color.fromRGBO(1, 15, 7, 1),

                          fontSize: 15),),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( '\$\$', style: TextStyle(
                              color: Color.fromRGBO(1, 15, 7, 1),

                              fontSize: 15),),
                          SizedBox(width: 5,),
                          Text( 'Chinese', style: TextStyle(
                              color: Color.fromRGBO(1, 15, 7, 1),

                              fontSize: 15),),
                          SizedBox(width: 95,),
                          Text( 'USD7.4', style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),

                fontSize: 15),),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
