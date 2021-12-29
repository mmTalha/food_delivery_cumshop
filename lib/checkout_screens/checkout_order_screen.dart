import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/checkout_screens/add_your_payment%20_screen.dart';
import 'package:food_app/checkout_screens/stepper.dart';

class checkout_order_screens extends StatelessWidget {
  final imgs;
  const checkout_order_screens({Key? key, this.imgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
            Text('Cart', style: TextStyle(color: Colors.black, fontSize: 22)),
        centerTitle: true,

        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 1; i <= 4; i++)
                Container(
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
                                          color:
                                              Color.fromRGBO(252, 186, 24, 1),
                                          fontSize: 16),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cookie Sandwich',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Shortbread, chocolate turtle \n cookies, and red velvet.',
                                        style: TextStyle(
                                          color: Color.fromRGBO(1, 15, 7, 1),
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(onPressed:  (){}, icon:  Icon(Icons.remove)),
                                          Text( '1'),
                                          IconButton(onPressed:  (){}, icon:  Icon(Icons.add)),
                                          IconButton(onPressed:  (){}, icon:  Icon(Icons.delete,color: Colors.red
                                            ,)),
                                        ],
                                      )
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
                            color: Color.fromRGBO(252, 186, 24, 1),
                            fontSize: 16),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => StepperDemo(),
                              //     add_your_payment_screen()
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}