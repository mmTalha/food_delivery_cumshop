import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/search_screen.dart';
import 'package:food_app/Tabbar_screens/searching_food_screen.dart';
import 'package:food_app/models/categories_model.dart';
import 'package:food_app/services/getcategories_api.dart';
import 'package:food_app/widgets/dashboard_widget.dart';

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = 'https://dnpprojects.com/demo/comshop/public/storage/category/';

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      searching_food_screen()),
                            );
                          },
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
                          child: dashboardwidget().cicularbar());
                    if (snap.hasData)
                      return
                        GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 180,
                                childAspectRatio: 5 / 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 30),
                            itemCount: 8,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => search_screen()),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(url+"${snap.data!.categories![index].image}"),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.10),
                                          BlendMode.darken),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                        '${snap.data!.categories![index].name}',
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      )),
                                ),
                              );
                            });

                    if (snap.hasError) print(snap.error.toString());
                    return Align(
                        alignment: Alignment.center,
                        child: dashboardwidget().cicularbar());
                  },


                ),
                // GridView.builder(
                //     scrollDirection: Axis.vertical,
                //     physics: NeverScrollableScrollPhysics(),
                //     gridDelegate:
                //         const SliverGridDelegateWithMaxCrossAxisExtent(
                //             maxCrossAxisExtent: 180,
                //             childAspectRatio: 5 / 4,
                //             crossAxisSpacing: 10,
                //             mainAxisSpacing: 30),
                //     itemCount: 8,
                //     shrinkWrap: true,
                //     itemBuilder: (BuildContext ctx, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => search_screen()),
                //           );
                //         },
                //         child: Container(
                //           height: 120,
                //           width: 120,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage('images/category1.png'),
                //               fit: BoxFit.cover,
                //               colorFilter: ColorFilter.mode(
                //                   Colors.black.withOpacity(0.10),
                //                   BlendMode.darken),
                //             ),
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Text(
                //             ' Fast food',
                //             style: TextStyle(color: Colors.white, fontSize: 16),
                //           )),
                //         ),
                //       );
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
