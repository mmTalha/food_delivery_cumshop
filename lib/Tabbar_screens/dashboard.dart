import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/checkout_order_screen.dart';
import 'package:food_app/checkout_screens/order_complete_screen.dart';
import 'package:food_app/details_screen/details_screen_product.dart';
import 'package:food_app/details_screen/product.dart';
import 'package:food_app/models/menu_models.dart';
import 'package:food_app/models/menu_models.dart';
import 'package:food_app/models/menu_models.dart';
import 'package:food_app/models/menu_models.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/see_all_screens/see_all_resturent_screen.dart';
import 'package:food_app/see_all_screens/see_featured_partners.dart';
import 'package:food_app/widgets/dashboard_widget.dart';
import 'package:food_app/widgets/inherited_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class dashboard_screen extends StatefulWidget {
  final lat;
  final lon;
late final address;
  dashboard_screen({Key? key, this.lat, this.lon, this.address}) : super(key: key);

  @override
  _dashboard_screenState createState() => _dashboard_screenState();
}

class _dashboard_screenState extends State<dashboard_screen> {

  Position? _currentPosition;
  String? _currentAddress;
  String Address = 'search';
  String locate = '';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong() async {
    Position position = await _getGeoLocationPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    // print(Address);
    setState(() {
      locate = '${place.subLocality}';
    });

    // print(locate);
  }

  @override
  void initState() {
    GetAddressFromLatLong();
    print(widget.lat);
    print('${widget.lon}new');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passed_data = InheritedDataProvider.of(context)!.data;
    final badge = Provider.of<cartprovider>(context);
    final menuprovider = Provider.of<api_calls>(context);
    menuprovider.locate = Address;
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
            Text('$passed_data',
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
          padding: EdgeInsets.only(left: 10,right: 10),
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
           SizedBox(height: 20,),

              FutureBuilder(
                future:  menuprovider.menuitems(  ),
                builder: (c, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData)
                    return Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          // Text('Sorry,We are not there yet',style: TextStyle(fontSize: 20,color: Colors.black,),),
                          // SizedBox(height: 10,),
                          //  Image.asset('images/sad_emojie.png',height: 70,width: 70,),
                          dashboardwidget().cicularbar()

                        ],));

                  if (snapshot.hasData) {
                    return  Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data['data'].length==null?null:snapshot.data['data'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return   Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => product(
                                          id: snapshot.data['data'][index]['id'],
                                          name: snapshot.data['data'][index]['name'],
                                          img: '${menuprovider.imageurl}${snapshot.data['data'][index]['logo_img']}',
                                        )),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 15,right: 15),
                                  width: 335,
                                  height: 270,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                        child: Image.network(
                                          '${menuprovider.imageurl}${snapshot.data['data'][index]['logo_img']}',
                                          height: 200,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${snapshot.data['data'][index]['name']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20),
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
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 11,
                                            color: Color.fromRGBO(
                                                252, 186, 24, 1),
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
                                                fontWeight:
                                                FontWeight.w400),
                                          ),

                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.person,
                                            size: 11,
                                            color: Color.fromRGBO(
                                                134, 134, 134, 1),
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
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );

                  }
                  if (snapshot.hasError) print(snapshot.error.toString());
                  return Align(
                      alignment: Alignment.center,
                      child: Image.asset('images/loader.gif'));
                },
              ),
              // FutureBuilder(
              //     future: menuprovider.menuitems(  ),
              //     builder: (context, AsyncSnapshot snapshot)=>
              //
              //     snapshot.hasData
              //         ?
              //     Center(
              //             child: ListView.builder(
              //                 shrinkWrap: true,
              //                 physics: NeverScrollableScrollPhysics(),
              //                 itemCount: snapshot.data['data'].length??0,
              //
              //                 itemBuilder: (BuildContext context, int index) {
              //                   var snap = snapshot.data['data'][index];
              //
              //
              //                   return   Center(
              //                     child: GestureDetector(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) => product(
              //                                     id: snap['id'],
              //                                     name: snap['name'],
              //                                     img: '${menuprovider.imageurl}${snap['logo_img']}',
              //                                   )),
              //                         );
              //                       },
              //                       child: Container(
              //                         margin: EdgeInsets.all(15),
              //                         width: 335,
              //                         height: 282,
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius:
              //                                   BorderRadius.circular(15.0),
              //                               child: Image.network(
              //                                 '${menuprovider.imageurl}${snap['logo_img']}',
              //                                 height: 200,
              //                               ),
              //                             ),
              //                             SizedBox(
              //                               height: 10,
              //                             ),
              //                             Text(
              //                               '${snap['name']}',
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontSize: 20),
              //                             ),
              //                             SizedBox(
              //                               height: 5,
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   '\$\$',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   '.',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   'Chinese',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   '.',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   'American',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   '.',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   'Deshi food',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                               ],
              //                             ),
              //                             SizedBox(
              //                               height: 5,
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Text(
              //                                   '4.3 ',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star,
              //                                   size: 11,
              //                                   color: Color.fromRGBO(
              //                                       252, 186, 24, 1),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   '200+ Ratings',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Icon(
              //                                   Icons.access_alarm_rounded,
              //                                   size: 11,
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   '25 Min',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Icon(
              //                                   Icons.person,
              //                                   size: 11,
              //                                   color: Color.fromRGBO(
              //                                       134, 134, 134, 1),
              //                                 ),
              //                                 SizedBox(
              //                                   width: 5,
              //                                 ),
              //                                 Text(
              //                                   'Free',
              //                                   style: TextStyle(
              //                                       color: Color.fromRGBO(
              //                                           134, 134, 134, 1),
              //                                       fontSize: 14,
              //                                       fontWeight:
              //                                           FontWeight.w400),
              //                                 ),
              //                               ],
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   );
              //                 }),
              //           )
              //         : Center(child: Text('no resturent registred on this location'),)),
            ],
          ),
        ),
      ),
    );
  }
}
