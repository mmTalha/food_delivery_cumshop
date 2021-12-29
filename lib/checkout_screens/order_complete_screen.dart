import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/thankyou_screen.dart';

class order_complete_screen extends StatelessWidget {
  const order_complete_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios_rounded,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              elevation: 1.3,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 350,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add_location,
                                color: Color.fromRGBO(252, 186, 24, 1),
                              ),
                              Text(
                                'Delivery address',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.edit,
                            color: Color.fromRGBO(252, 186, 24, 1),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/map.png',
                      ),
                      Text(
                        'Shani General Store Ale Muhammad Road',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Karachi',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ),
              ),
            ),

            Card(
              elevation: 1,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 350,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [



                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Text(
                                  'Call me on this number',

                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                            ],
                          ),


                        ],
                      )),
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 350,
                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                      Text(
                        'Order Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    
                     Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                             Text(
                        'Your order number:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                       Text(
                        '#ootz-skdt',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 148, 255, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                         ],
                     ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                             Text(
                        'Your order from:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                       Text(
                        'KFC- North Karachi',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(231, 164, 0, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                         ],
                     ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                             Text(
                        'Delivery address:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                       Text(
                         
                        'Shani General Karachi',
                         
                          
                       
                       
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                                         ),
                         ],
                     ),
                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                             Text(
                        'Total (incl.GST)',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                       Text(
                         
                        'RS.300.00',
                         
                          
                       
                       
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                                         ),
                         ],
                     ),
                     
                    ],
                  )),
                ),
              ),
            ),

          ],
        ),
      ),
  //      floatingActionButton:   Container(
  //
  //          height: 50,
  //          width: 310,
  //          child: MaterialButton(
  //              shape: RoundedRectangleBorder(
  //                  borderRadius: BorderRadius.circular(10)),
  //              color: Color.fromRGBO(252, 186, 24, 1),
  //              child: Text(
  //                'Place Order',
  //                style: TextStyle(
  //                  fontFamily: 'Roboto',
  //                  color: Colors.white,
  //                ),
  //              ),
  //              onPressed: () {
  //                Navigator.push (
  //                  context,
  //                  MaterialPageRoute(
  //                      builder: (BuildContext context) =>
  //                          thankyou_screen()),
  //
  //                );
  //              }
  //
  //
  //
  //          )
  //      ),
  // floatingActionButtonLocation:
  //     FloatingActionButtonLocation.centerFloat,
  //
  //
    
);
  }
}
