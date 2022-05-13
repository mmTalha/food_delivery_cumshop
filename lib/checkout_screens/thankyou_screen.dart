import 'package:flutter/material.dart';

class thankyou_screen extends StatelessWidget {
  const thankyou_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Estimated delivery time',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          )),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Text(
            '30 - 40 mins',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          )),
          SizedBox(
            height: 5,
          ),
          Center(child: Image.asset('images/rider.png')),
          SizedBox(
            height: 18,
          ),
          Center(
            child: Text(
              'KFC North karachi will be delivering\nyour order...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          // Card(
          //   elevation: 1,
          //   child: Center(
          //     child:
          //     Container(
          //       padding: EdgeInsets.all(10),
          //       height: 200,
          //       width: 350,
          //       decoration: new BoxDecoration(
          //           color: Color.fromRGBO(247, 247, 247, 1),
          //           borderRadius: BorderRadius.circular(10)),
          //       child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Text(
          //                 ' Details',
          //                 style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.w700),
          //               ),
          //
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     '1 x  Rice & Spice',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                   Text(
          //                     'RS.270.00',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Color.fromRGBO(0, 148, 255, 1),
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     'Delivery fee',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                   Text(
          //                     'RS.30.00',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Color.fromRGBO(231, 164, 0, 1),
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     'Incl. Tax',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                   Text(
          //
          //                     'RS.31.06',
          //
          //
          //
          //
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     'Total (incl.GST)',
          //                     textAlign: TextAlign.start,
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                   Text(
          //
          //                     'RS.300.00',
          //
          //
          //
          //
          //                     style: TextStyle(
          //                         color: Colors.black,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w400),
          //                   ),
          //                 ],
          //               ),
          //
          //             ],
          //           )),
          //     ),
          //   ),
          // ),
          Card(
            elevation: 1,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 80,
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
                      'Paid with',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/cashondelivery.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Cash on delivery',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          'RS.300.00',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
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
    );
  }
}
