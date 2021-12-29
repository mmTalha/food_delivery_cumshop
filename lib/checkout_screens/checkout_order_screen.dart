import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/checkout_screens/add_your_payment%20_screen.dart';
import 'package:food_app/checkout_screens/stepper.dart';

class checkout_order_screens extends StatelessWidget {
  const checkout_order_screens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:

            Text('Cart',
                style: TextStyle(color: Colors.black, fontSize: 22)),


        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Row(
              //             children: [
              //               Container(
              //                 width: 24,
              //                 height: 24,
              //                 decoration: BoxDecoration(
              //                     color: Color.fromRGBO(252, 186, 24, 1),
              //                     borderRadius: BorderRadius.circular(5)),
              //                 child: Center(child: Text('1')),
              //               ),
              //               SizedBox(
              //                 width: 5,
              //               ),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Cookie Sandwich',
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 16),
              //                   ),
              //                   Text(
              //                     'Shortbread, chocolate turtle \n cookies, and red velvet.',
              //                     style: TextStyle(
              //                         color: Colors.black, fontSize: 16),
              //                   ),
              //                 ],
              //               )
              //             ],
              //           ),
              //           Text(
              //             'USD7.4',
              //             style: TextStyle(
              //                 color: Color.fromRGBO(252, 186, 24, 1),
              //                 fontSize: 16),
              //           ),
              //         ],
              //       ),
              //       // ListTile(
              //       //
              //       //
              //       //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0,bottom: 0.0),
              //       //   title:  Column(
              //       //     crossAxisAlignment: CrossAxisAlignment.start,
              //       //     mainAxisAlignment: MainAxisAlignment.start,
              //       //     children: [
              //       //       Text(
              //       //         'Cookie Sandwich',
              //       //         style: TextStyle(color: Colors.black, fontSize: 16),
              //       //       ),
              //       //       SizedBox(height: 10,),
              //       //       Text(
              //       //         'Shortbread, chocolate turtle \n cookies, and red velvet.',
              //       //         style: TextStyle(
              //       //             color: Colors.black, fontSize: 16),
              //       //       ),
              //       //     ],
              //       //   ),
              //       //
              //       //   leading: Container(
              //       //     width: 24,
              //       //     height: 24,
              //       //     decoration: BoxDecoration(
              //       //         color: Color.fromRGBO(252, 186, 24, 1),
              //       //         borderRadius: BorderRadius.circular(5)),
              //       //     child: Center(child: Text('1')),
              //       //   ),
              //       //   trailing:Text(
              //       //     'USD7.4',
              //       //     style: TextStyle(
              //       //         color: Color.fromRGBO(252, 186, 24, 1),
              //       //         fontSize: 16),
              //       //   ) ,
              //       // ),
              //
              //     ],
              //   ),
              // ),
              for (int i = 1; i <= 4; i++)   Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 width: 24,
                                 height: 24,
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(5)),
                                 child: Center(
                                     child: Text(
                                       i.toString(),
                                       style: TextStyle(
                                           color: Color.fromRGBO(252, 186, 24, 1),
                                           fontSize: 16),
                                     )),
                               ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cookie Sandwich',
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 18),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Shortbread, chocolate turtle \n cookies, and red velvet.',
                                    style:
                                    TextStyle(color: Color.fromRGBO(1, 15, 7, 1), fontSize: 16, ),
                                  ),


                                ],
                              )
                             ],
                           ),
                            Divider(
                              color: Colors.yellow,
                              thickness: 1.0,
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      'USD7.4',
                      style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1), fontSize: 16),
                    ),
                  ],
                ),
              ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Subtotal'),
                 Text('\$29.4\$0'),



               ],
             ),

             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Subtotal '),

                 Text('\$29.4\$0'),



               ],
             ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total (incl. VAT) '),

                  Text('\$29.4'),



                ],
              ),
              Center(
                child: Container(
                    height: 50,
                    width: 290,
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromRGBO(252, 186, 24, 1),
                        child: Text(
                          'Continue (\$11.98)',
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
                                StepperDemo(),
                                //     add_your_payment_screen()
                            ),

                          );
                        }



                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
