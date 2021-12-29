import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/order_complete_screen.dart';

import 'checkout_order_screen.dart';

class add_your_payment_screen extends StatelessWidget {
  const add_your_payment_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: Icon(
      //
      //     Icons.arrow_back,color: Colors.black,),
      // ),
      body:Container(
        // padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment. start,
            children: [
              Center(child: Text( 'Add your payment methods ' ,style: TextStyle(color: Colors.black,fontSize: 20),)),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  'This card will only be charged\n when you place an order.',
                  style:
                  TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16, ),
                ),
              ),
              SizedBox(height: 60,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38.withAlpha(10),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          prefixStyle: TextStyle(color: Colors.grey),
                          hintText: '4343 4343 4343 4343',
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
              SizedBox(height:30,),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black38.withAlpha(10),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'mm/mm/yy',
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
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(

                      decoration: BoxDecoration(
                        color: Colors.black38.withAlpha(10),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'CVC  ',
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
                  ],
                ),
              ),
              SizedBox(height: 60,),
              // Center(
              //   child: Container(
              //
              //       height: 50,
              //       width: 290,
              //       child: MaterialButton(
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           color: Color.fromRGBO(252, 186, 24, 1),
              //           child: Text(
              //             'Add Card',
              //             style: TextStyle(
              //               fontFamily: 'Roboto',
              //               color: Colors.white,
              //             ),
              //           ),
              //           onPressed: () {
              //             Navigator.push (
              //               context,
              //               MaterialPageRoute(
              //                   builder: (BuildContext context) =>
              //                       order_complete_screen()),
              //
              //             );
              //           }
              //
              //
              //
              //       )
              //   ),
              // ),
            ],
          ),
        ),
      ) ,
    );
  }
}
