import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class details_screen_products extends StatefulWidget {
  final id;
  final image;
  const details_screen_products({Key? key, this.id, this.image})
      : super(key: key);

  @override
  _details_screen_productsState createState() =>
      _details_screen_productsState();
}

class _details_screen_productsState extends State<details_screen_products> {
  List variant = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<cartprovider>(context);
    final varient = Provider.of<api_calls>(context);

    var id;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: varient.deatils_varient(widget.id),
        builder: (c, AsyncSnapshot snap) {
          //print(menus_ini[0]['price']);
          if (snap.hasData) {
            return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snap.data['productDetail'][1]['variant'].length,
                  itemBuilder: (ctx, i) {
                    id = i;
                    var a = snap.data['productDetail'][1]['variant'][i]['name'];

                    return Column(
                      children: [
                        // RadioListTile(
                        //   groupValue: _isRadioSelected,
                        //   value: 2,
                        //   activeColor: Colors.black,
                        //   onChanged: (valuea) {
                        //     setState(() {
                        //       id = valuea;
                        //       print(id);
                        //       print(snap.data['productDetail'][0]
                        //           ['variant'][i]['name']);
                        //     });
                        //   },
                        //   title: Text(
                        //     '${snap.data['productDetail'][0]['variant'][i]['name']}',
                        //   ),
                        // ),

                        CheckboxListTile(
                          value: selectedIndexes.contains(i),
                          onChanged: (a) {
                            if (selectedIndexes.contains(i)) {
                              selectedIndexes.remove(i); // unselect
                            } else {
                              print([i]);
                              print(snap.data['productDetail'][1]['variant'][i]
                                  ['name']);
                              selectedIndexes.add(i); // select
                              print(selectedIndexes);
                            }
                            setState(() {});
                          },
                          checkColor: Colors.greenAccent,
                          activeColor: Colors.black,
                          title: Text(a.toString()),
                        ),
                        // Checkbox(
                        //   value: _isChecked,
                        //   onChanged: (val) {
                        //     setState(() {
                        //       _isChecked = val!;
                        //       if (val == true) {
                        //         _currText = a;
                        //         print([i]);
                        //         print(snap.data['productDetail']
                        //             [0]['variant'][i]['name']);
                        //       }
                        //     });
                        //   },
                        // ),

                        // Radio(
                        //   activeColor: Colors.red,
                        //   value: [i],
                        //   groupValue: _value,
                        //   onChanged: ( va) {
                        //     setState(() {
                        //       print([i]);
                        //       print(snap.data['productDetail'][0]
                        //           ['variant'][i]['name']);
                        //       _value = va;
                        //     });
                        //   },
                        // ),
                      ],
                    );
                  }),
            );
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
