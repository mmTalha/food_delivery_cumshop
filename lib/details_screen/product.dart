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
  var cate_id;
  var menu_id;

  @override
  Widget build(BuildContext context) {
    final detailsmenu = Provider.of<api_calls>(context);
    var imgurl =
        'https://dnpprojects.com/demo/comshop/public/storage/restaurant/menu/';
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
                                cate_id = s.data['categories'][int]['id'];
                                menu_id = s.data['getRest']['menuswith_cat']
                                    [int]['category_id'];
                                print(cate_id);
                                print(menu_id);
                              });
                            },
                            labelColor: Colors.black,
                            isScrollable: true,
                            indicatorColor: Colors.orange,
                            tabs: tabs,
                          ),
                        ),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                s.data['getRest']['menuswith_cat'].length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 180,
                                    childAspectRatio: 5 / 4,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (BuildContext context, int i) {
                              menu_id = s.data['getRest']['menuswith_cat'][1]
                                  ['category_id'];
                              print(imgurl +
                                  s.data['getRest']['menuswith_cat'][i]
                                      ['image']);
                              return cate_id == menu_id
                                  ? Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      height: 130,
                                      width: 145,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(imgurl +
                                                s.data['getRest']
                                                        ['menuswith_cat'][i]
                                                    ['image']),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(22),
                                              ),
                                              child: Center(
                                                  child: Text(s.data['getRest']
                                                          ['menuswith_cat'][i]
                                                          ['price']
                                                      .toString())),
                                            ),
                                          ),
                                        ],
                                      ))
                                  : Container(color: Colors.black);
                            }),
                      )
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
