import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/models/categories_model.dart';
import 'package:food_app/services/getcategories_api.dart';

class search_screen extends StatelessWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Hero(
            tag: "profile12",
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.black38.withAlpha(10),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.black.withAlpha(120),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search on comshop",
                              hintStyle: TextStyle(
                                color: Colors.black.withAlpha(120),
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: (String keyword) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Text(
                      'Top Categories',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FutureBuilder<Categories>(
                    future:get_categories().getcategories() ,
                    builder: (c,   snap){
                      if (!snap.hasData)
                        return Align(
                            alignment: Alignment.center,
                            child: Image.asset('images/loader.gif'));
                      if (snap.hasData)
                        return
                      GridView.builder(
                        scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 180,
                              childAspectRatio:3/4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 0),
                          itemCount:snap.data!.categories!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              height: 200,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('images/halal.png'),
                                  Text(
                                    '${snap.data!.categories![index].name}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
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
                                    ],
                                  )
                                ],
                              ),
                          );});

                      if (snap.hasError) print(snap.error.toString());
                      return Align(
                          alignment: Alignment.center,
                          child: Image.asset('images/loader.gif'));
                    },


                  )
                  // GridView.builder(
                  //   scrollDirection: Axis.vertical,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //         maxCrossAxisExtent: 180,
                  //         childAspectRatio:3/4,
                  //         crossAxisSpacing: 10,
                  //         mainAxisSpacing: 0),
                  //     itemCount:8,
                  //     shrinkWrap: true,
                  //     itemBuilder: (BuildContext ctx, index) {
                  //       return Container(
                  //         height: 200,
                  //         width: 150,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Image.asset('images/halal.png'),
                  //             Text(
                  //               'The Halal Guys',
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: 14,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Text(
                  //                   '\$\$',
                  //                   style: TextStyle(
                  //                       color: Color.fromRGBO(134, 134, 134, 1),
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                 Text(
                  //                   '.',
                  //                   style: TextStyle(
                  //                       color: Color.fromRGBO(134, 134, 134, 1),
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                 Text(
                  //                   'Chinese',
                  //                   style: TextStyle(
                  //                       color: Color.fromRGBO(134, 134, 134, 1),
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400),
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       );
                  //     })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
