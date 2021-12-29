import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:provider/provider.dart';

class details_screen_products extends StatefulWidget {
  const details_screen_products({Key? key}) : super(key: key);

  @override
  _details_screen_productsState createState() =>
      _details_screen_productsState();
}

class _details_screen_productsState extends State<details_screen_products> {

  int _value = 1;
  int _n = 0;

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<cartprovider>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/details_product.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cookie Sandwich',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        'Shortbread, chocolate turtle cookies, and red \n velvet. 8 ounces cream cheese, softened.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$\$',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Chinese',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'American',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Deshi food',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choice of top Cookie',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          width: 90,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(239, 153, 32, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'Required',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    for (int i = 1; i <= 8; i++)
                      Column(
                        children: [
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: 0.0, right: 0.0, bottom: 0.0),
                            title: Text(
                              'Chocolate $i',
                            ),
                            leading: Radio(
                              value: i,
                              groupValue: _value,
                              activeColor: Color.fromRGBO(252, 186, 24, 1),
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                });
                              },
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choice of Bottom Cookie',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          width: 90,
                          height: 32,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(239, 153, 32, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            'Required',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    for (int i = 1; i <= 8; i++)
                      Column(
                        children: [
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(
                                left: 0.0, right: 0.0, bottom: 0.0),
                            title: Text(
                              'Chocolate $i',
                            ),
                            leading: Radio(
                              value: i,
                              groupValue: _value,
                              activeColor: Color.fromRGBO(252, 186, 24, 1),
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value!;
                                });
                              },
                            ),
                          ),
                          Divider()
                        ],
                      ),


                    new TextField(

                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          suffixStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons. arrow_forward_ios_sharp,
                            color: Colors.grey,
                          ),
                          prefixStyle: TextStyle(color: Colors.grey),
                          hintText: 'Add Special Instructions',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                         ),
                    ),
                  SizedBox(height: 5,),
                    new Container(
                      child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(

                              onPressed: () {
                                add();
                              },
                              child: Icon(Icons.add, color: Colors.black),
                              style:
                              ElevatedButton.styleFrom(
                                elevation: 0.5,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                primary:Color.fromRGBO(248, 248, 248, 1), // <-- Button color
                                onPrimary:Color.fromRGBO(151, 151, 151, 1), // <-- Splash color
                              ),
                            ),
                            new Text('$_n',
                                style: new TextStyle(fontSize: 25)),
                            ElevatedButton(

                              onPressed: () {
                                minus();
                              },
                              child: Icon(Icons.remove, color: Colors.black),
                              style:
                              ElevatedButton.styleFrom(
                                elevation: 0.5,
                                shape: CircleBorder(

                                ),
                                padding: EdgeInsets.all(10),
                                primary:Color.fromRGBO(248, 248, 248, 1), // <-- Button color
                                onPrimary:Color.fromRGBO(151, 151, 151, 1), // <-- Splash color
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: AnimatedContainer(

                    duration:  Duration(seconds: 1),
                    height: 50,
                    width:  provider.isloading ?100:290,

                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromRGBO(252, 186, 24, 1),
                        child: Text(
                           'Add to Cart',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                       animationDuration:Duration(seconds: 1) ,
                        onPressed: () {
                          provider.cartbadge();
                        provider.isloading = true;
                          // final snackBar = SnackBar(
                          //     elevation: 6.0,
                          //   backgroundColor:Color.fromRGBO(252, 186, 24, 1) ,
                          //     behavior: SnackBarBehavior. floating,
                          //     content: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Container(
                          //           height:20,
                          //             width: 20,
                          //             decoration: BoxDecoration(
                          //                 border: Border.all(
                          //                  color: Colors.white
                          //                 ),
                          //                 borderRadius: BorderRadius.all(Radius.circular(20))
                          //             ),
                          //             child: Center(child: Text( '2'))
                          //         ),
                          //         Text('View cart'),
                          //         Text('RS:25676'),
                          //       ],
                          //
                          //     ));
                          //
                          // _scaffoldKey.currentState!.showSnackBar(snackBar);
                          // Navigator.push (
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (BuildContext context) =>
                          //           checkout_order_screens()),


                        }



                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
