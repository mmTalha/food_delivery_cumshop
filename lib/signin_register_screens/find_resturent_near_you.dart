import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/dashboard.dart';
import 'package:food_app/Tabbar_screens/tabbar_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class find_resturent extends StatelessWidget {
    find_resturent({Key? key}) : super(key: key);







  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
     print(Address);
  }
    String Address = 'search';
  @override
  Widget build(BuildContext context) {
    final menu = Provider.of<api_calls>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Find restaurants near you ',
            style: TextStyle(color: Colors.black, fontSize: 24),
          )),
          Center(
              child: Text(
            'Please enter your location or allow acess',
            style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
          )),
          Center(
              child: Text(
            ' to find restaurants near you.',
            style: TextStyle(
                color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
          )),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () async{
                Position position = await _getGeoLocationPosition();
                final _prefs = SharedPreferences.getInstance();
                final SharedPreferences prefs = await _prefs;
                final latitude  = prefs.setDouble('latitude',position.latitude);
                final longitude  = prefs.setDouble('longtitude',position.longitude);
                final latlong  = prefs.getDouble('longtitude');
                GetAddressFromLatLong(position);
                print(latlong);
                 menu.menu();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => tabbar(latitude: position.longitude,longtitude: position.latitude,)),
                );
              },
              child: Container(
                  height: 50,
                  width: 310,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(252, 186, 24, 1),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_location_outlined,
                        color: Color.fromRGBO(252, 186, 24, 1),
                      ),
                      Text(
                        'User Current Location',
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color:  Color.fromRGBO(242, 242, 242, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 310,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_location),
                  prefixStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter a New Address',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color:  Color.fromRGBO(242, 242, 242, 1),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color:  Color.fromRGBO(242, 242, 242, 1),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),
        ],
      ),
    );
  }
}
