import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/details_screen/details_screen_product.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:provider/provider.dart';

class product extends StatefulWidget {
  product({Key? key, this.name, this.id, this.img}) : super(key: key);
  final name;
  final id;
  final img;
  @override
  _productState createState() => _productState();
}

class _productState extends State<product> with TickerProviderStateMixin {
  var menus_id;
  var menus_ini;

  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<cartprovider>(context);
    final detailsmenu = Provider.of<api_calls>(context);
    var imgurl =
        'https://dnpprojects.com/demo/comshop/public/storage/restaurant/menu/';
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.img,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.red,
              shape: BoxShape.rectangle,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.arrow_back_ios)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => checkout_order_screens()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Badge(
                            badgeColor: Color.fromRGBO(252, 186, 24, 1),
                            animationType: BadgeAnimationType.slide,
                            badgeContent: Text('${badge.cartvalue}'),
                            child: Image.asset('images/carticon.png',
                                color: Colors.black)),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: detailsmenu.details_product(widget.id),
            builder: (c, AsyncSnapshot s) {
              //print(menus_ini[0]['price']);
              if (s.hasData) {
                menus_ini = s.data['categories'][0]['menu'];
                List<Tab> tabs = <Tab>[];
                for (int i = 0; i < s.data['categories']!.length; i++) {
                  // print(s.data['categories'][i]['name']);
                  tabs.add(Tab(
                    child: Text(
                      s.data['categories'][i]['name'],
                      style: TextStyle(color: Colors.black),
                    ),
                  ));
                }
                return DefaultTabController(
                  length: s.data['categories'].length,
                  child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child: Container(
                          height: 50,
                          child: TabBar(
                            onTap: (int) {
                              // print(s.data['categories'][int]['id']);
                              // print(s.data['getRest']['menuswith_cat'][int]
                              //     ['category_id']);
                              setState(() {
                                menus_id = s.data['categories'][int]['menu'];
                                //print(s.data);
                              });
                            },
                            labelColor: Colors.black,
                            isScrollable: true,
                            indicatorColor: Colors.orange,
                            tabs: tabs,
                          ),
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 20),
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menus_id == null
                                  ? menus_ini.length
                                  : menus_id.length,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 180,
                                      childAspectRatio: 5 / 4,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int i) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              details_screen_products(
                                                resturentid: menus_id == null
                                                    ? menus_ini[i]
                                                        ['restaurant_id']
                                                    : menus_id[i]
                                                        ['restaurant_id'],
                                                id: menus_id == null
                                                    ? menus_ini[i]['id']
                                                    : menus_id[i]['id'],
                                                image: imgurl +
                                                    (menus_id == null
                                                        ? menus_ini[i]['image']
                                                        : menus_id[i]['image']),
                                              )),
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      height: 130,
                                      width: 145,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(1),
                                              BlendMode.dstATop),
                                          image: NetworkImage(imgurl +
                                              (menus_id == null
                                                  ? menus_ini[i]['image']
                                                  : menus_id[i]['image'])),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${menus_id == null ? menus_ini[i]['title'] : menus_id[i]['title']}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 70,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                              child: Center(
                                                  child: Text("\$"
                                                      '${menus_id == null ? menus_ini[i]['price'].toString() : menus_id[i]['price'].toString()}')),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              }),
                        ),
                      )),
                );
              }
              if (s.hasError) print(s.error.toString());
              return Center(child: Image.asset('images/loader.gif'));
            },
          )),
        ],
      ),
    );
  }
}
