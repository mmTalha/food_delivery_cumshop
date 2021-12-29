import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/models/menu_models.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/details_screen/details_screen_product.dart';
import 'package:food_app/details_screen/product.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/see_all_screens/see_all_resturent_screen.dart';
import 'package:food_app/see_all_screens/see_featured_partners.dart';
import 'package:provider/provider.dart';

class dashboard_screen extends StatelessWidget {
  final lat;
  final lon;

  dashboard_screen({Key? key, this.lat, this.lon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final badge = Provider.of<cartprovider>(context);
    final menu = Provider.of<api_calls>(context);

    final List<String> images = [
      'images/sliderone.png',
      'images/slidertwo.png',
      'images/sliderthree.png',
      'images/sliderfour.png',
      'images/sliderone.png',
      'images/slidertwo.png',
      'images/sliderthree.png',
      'images/sliderfour.png',
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Text(
              'Delivery to',
              style: TextStyle(
                  color: Color.fromRGBO(252, 186, 24, 1), fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Text('San Francisco',
                style: TextStyle(color: Colors.black, fontSize: 22)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => checkout_order_screens()),
                    );
                  },
                  child: Badge(
                      badgeColor: Color.fromRGBO(252, 186, 24, 1),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text('${badge.cartvalue}'),
                      child: Image.asset('images/carticon.png'))),
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          height: 185,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              elevation: 2.5,
                              child: Image.asset(
                                i,
                                fit: BoxFit.cover,
                                height: 185,
                              ),
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Restaurants',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  see_featured_partner_screen()),
                        );
                      },
                      child: Text(
                        ' See all',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 254,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.all(5),
                    width: 200,
                    height: 254,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => product(
                                    name: 'burger',
                                  )),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(images[index]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Daylight Coffee',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Colarodo, San Francisco',
                            style: TextStyle(
                                color: Color.fromRGBO(134, 134, 134, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 20,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(252, 186, 24, 1),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                      child: Text(
                                    '4.5',
                                    style: TextStyle(color: Colors.white),
                                  ))),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '25min',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                      134,
                                      134,
                                      134,
                                      1,
                                    ),
                                    fontSize: 10),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Free delivery'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 170,
                width: 335,
                child: Image.asset('images/Banner.png'),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Picks ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      ' See all',
                      style: TextStyle(
                        color: Color.fromRGBO(252, 186, 24, 1),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                ' Restaurants by team',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.all(5),
                    width: 200,
                    height: 254,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(images[index]),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' Daylight Coffee',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Colarodo, San Francisco',
                          style: TextStyle(
                              color: Color.fromRGBO(134, 134, 134, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                                height: 20,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(252, 186, 24, 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.white),
                                ))),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '25min',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '.',
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                    134,
                                    134,
                                    134,
                                    1,
                                  ),
                                  fontSize: 10),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Free delivery'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Restaurants',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => see_all_resturent_screen()),
                        );
                      },
                      child: Text(
                        ' See all',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: menu.menu(),
                  builder: (context, AsyncSnapshot snapshot) => snapshot.hasData
                      ? Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data['data']!.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5),
                                width: 335,
                                height: 282,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                alignment: Alignment.center,
                                      child: Image.network(
                                        'https://dnpprojects.com/demo/comshop/public/storage/restaurant/logo/${snapshot.data['data'][index]['logo_img']}',
                                        height: 200,
                                        width: 300,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${snapshot.data['data'][index]['name']}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$\$',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '.',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Chinese',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '.',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'American',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '.',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Deshi food',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '4.3 ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 11,
                                          color:
                                              Color.fromRGBO(252, 186, 24, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '200+ Ratings',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.access_alarm_rounded,
                                          size: 11,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '25 Min',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.person,
                                          size: 11,
                                          color:
                                              Color.fromRGBO(134, 134, 134, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Free',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  134, 134, 134, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
