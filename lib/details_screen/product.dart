import 'package:flutter/material.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:provider/provider.dart';

class product extends StatefulWidget {
  product({Key? key, this.name, this.id}) : super(key: key);
  final name;
  final id;

  @override
  _productState createState() => _productState();
}

class _productState extends State<product> with TickerProviderStateMixin {
  var menus_id;
  var menus_ini;

  @override
  Widget build(BuildContext context) {
    final detailsmenu = Provider.of<api_calls>(context);
     var imgurl = 'https://dnpprojects.com/demo/comshop/public/storage/restaurant/menu/';
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/details_product.png',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: detailsmenu.details_product(widget.id),
            builder: (c, AsyncSnapshot s) {
              //
              menus_ini = s.data['categories'][0]['menu'];
              //print(menus_ini[0]['price']);
              if (s.hasData) {
                List<Tab> tabs = <Tab>[];
                for (int i = 0; i < s.data['categories']!.length; i++) {
                  print(s.data['categories'][i]['name']);
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
                      body:
                      GridView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:menus_id==null?menus_ini.length:menus_id.length,

                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 180,
                              childAspectRatio:5/4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 15, top: 10, bottom: 10),
                                height: 130,
                                width: 145,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        imgurl+(menus_id==null ? menus_ini[i]
                                        ['image'] : menus_id[i]
                                        ['image'])),

                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Xtream Duo Box ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 70,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(22),
                                        ),
                                        child: Center(child: Text('${menus_id == null ? menus_ini[i]['price'].toString() : menus_id[i]['price'].toString() }' )
                                        ),
                                      ),
                                    ),
                                  ],
                                ));

                          })
                      // ListView.builder(
                      //     itemCount: s.data['getRest']['menuswith_cat'].length,
                      //     itemBuilder: (ctx, i) {
                      //       menu_id = s.data['getRest']['menuswith_cat'][i]
                      //           ['category_id'];
                      //       return Container(
                      //         child: cate_id == menu_id
                      //             ? Text(s.data['getRest']['menuswith_cat'][i]
                      //                 ['title'])
                      //             : Container(),
                      //       );
                      //     })
                  ),
                );
              }
              if (s.hasError) print(s.error.toString());
              return Center(
                  child: Text(s.hasError ? s.error.toString() : "Loading..."));
            },

            // FutureBuilder(
            //     future: detailsmenu.details_product(widget.id),
            //     builder: (context, AsyncSnapshot snapshot){
            //       snapshot.hasData
            //
            //           ?   DefaultTabController(
            //         length: snapshot.data['categories'].length,
            //         child: new Scaffold(
            //           appBar: new PreferredSize(
            //             preferredSize: Size.fromHeight(
            //                 MediaQuery.of(context).size.height),
            //             child: new Container(
            //                 height: 50.0,
            //                 child: new TabBar(
            //                     indicatorColor: Colors.orange,
            //                     onTap: (int) {
            //                       int++;
            //                       print(int);
            //                     },
            //                     labelColor: Colors.black,
            //                     isScrollable: true,
            //                     tabs:[
            //                       snapshot.data['name']['categories']
            //                     ] )
            //
            //
            //             ),
            //           ),
            //           body: TabBarView(
            //
            //             children: [
            //               Icon(Icons.directions_car),
            //               Icon(Icons.directions_car),
            //             ],
            //           ),
            //         ),
            //       )
            //           : Container();})),
          )),
        ],
      ),
    );
  }
}
