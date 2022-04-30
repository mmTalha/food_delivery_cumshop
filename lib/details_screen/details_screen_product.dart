import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:provider/provider.dart';

class details_screen_products extends StatefulWidget {
  final id;
  final image;
  final resturentid;
    details_screen_products({Key? key, this.id, this.image, this.resturentid})
      : super(key: key);

  @override
  _details_screen_productsState createState() =>
      _details_screen_productsState();
}

class _details_screen_productsState extends State<details_screen_products> {
  var productid;
  var resturentid;
  var variantid;
  var price;
  var quantity;
   int _n = 1;
  int selectedIndex = -1;
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
  @override
  void initState() {
     print(resturentid);
    super.initState();
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override

  Widget build(BuildContext context) {
    final provider = Provider.of<cartprovider>(context);
    final varient = Provider.of<api_calls>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: varient.deatils_varient(widget.id),
        builder: (c, AsyncSnapshot snap) {
          //print(menus_ini[0]['price']);
          if (snap.hasData) {
            int _value = 1;
            var data = snap.data['productDetail'][0]['variant'];

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.image,
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
                          snap.data['productDetail'][0]['title'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(snap.data['productDetail'][0]['description']),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              'Price :' +
                                  '\$' +
                                  snap.data['productDetail'][0]['price']
                                      .toString(),
                              style: TextStyle(
                                  color: Color.fromRGBO(134, 134, 134, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'preparation time' +
                                  ':' +
                                  snap.data['productDetail'][0]['price']
                                      .toString() +
                                  'min',
                              style: TextStyle(
                                  letterSpacing: 1.1,
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
                              'Variation',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                snap.data['productDetail'][0]['variant'].length,
                            itemBuilder: (ctx, i) {
                              var variantname = snap.data['productDetail'][0]
                                  ['variant'][i]['name'];

                              return Column(
                                children: [

                                  ListTile(
                                      selected:
                                          selectedIndex == i ? true : false,
                                      title: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: selectedIndex == i
                                                        ? Color.fromRGBO(
                                                            252, 186, 24, 1)
                                                        : Colors.white),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2,
                                                        color: selectedIndex ==
                                                                i
                                                            ? Color.fromRGBO(
                                                                252, 186, 24, 1)
                                                            : Colors.white),
                                                    color: selectedIndex == i
                                                        ? Color.fromRGBO(
                                                            252, 186, 24, 1)
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                height: 15,
                                                width: 15,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '$variantname',
                                            style: TextStyle(
                                                color: selectedIndex == i
                                                    ? Color.fromRGBO(
                                                        252, 186, 24, 1)
                                                    : Colors.black),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = i;
                                          productid = snap.data['productDetail'][0]['variant'][i]['product_id'];
                                          variantid = snap.data['productDetail'][0]['variant'][i]['id'];
                                          price = snap.data['productDetail'][0]['price'];
                                          quantity = _n;

                                        });
                                        print(
                                            '${snap.data['productDetail'][0]['variant'][i]['id']}');
                                      }),
                                  Divider()
                                ],
                              );
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 5,
                        ),
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
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.5,
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(10),
                                    primary: Color.fromRGBO(248, 248, 248, 1),
                                    // <-- Button color
                                    onPrimary: Color.fromRGBO(
                                        151, 151, 151, 1), // <-- Splash color
                                  ),
                                ),
                                new Text('$_n',
                                    style: new TextStyle(fontSize: 25)),
                                ElevatedButton(
                                  onPressed: () {
                                    minus();
                                  },
                                  child:
                                      Icon(_n==1?null:Icons.remove, color: Colors.black),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.5,
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(10),
                                    primary: Color.fromRGBO(248, 248, 248, 1),
                                    // <-- Button color
                                    onPrimary: Color.fromRGBO(
                                        151, 151, 151, 1), // <-- Splash color
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
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: 290,
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
                            animationDuration: Duration(seconds: 1),
                            onPressed: () {
                             print(price);
                              provider.cartbadge();
                              varient.add_to_cart(23, 1, 5, 1023, 3);
                              // varient.add_to_cart(productid,resturentid,variantid,price,_n);
                              // final snackBar = SnackBar(
                              //     elevation: 6.0,
                              //     backgroundColor:
                              //         Color.fromRGBO(252, 186, 24, 1),
                              //     behavior: SnackBarBehavior.floating,
                              //     content: Row(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Container(
                              //             height: 20,
                              //             width: 20,
                              //             decoration: BoxDecoration(
                              //                 border: Border.all(
                              //                     color: Colors.white),
                              //                 borderRadius: BorderRadius.all(
                              //                     Radius.circular(20))),
                              //             child: Center(child: Text('2'))),
                              //         GestureDetector(
                              //             onTap: () {
                              //               Navigator.push(
                              //                   context,
                              //                   MaterialPageRoute(
                              //                       builder: (BuildContext
                              //                               context) =>
                              //                           checkout_order_screens()));
                              //             },
                              //             child: Text('View cart')),
                              //         Text('RS:25676'),
                              //       ],
                              //     ));
                              // _scaffoldKey.currentState!.showSnackBar(snackBar);
                            })),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          }
          else if(!snap.hasData){
            return Center(child: Text('No data Found'));
          }
          if (snap.hasError) print(snap.error.toString());
          return Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('images/loader.gif'));
        },
      )),
    );
  }
}
