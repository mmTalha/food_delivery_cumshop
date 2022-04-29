import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/dashboard.dart';
import 'package:food_app/Tabbar_screens/tabbar_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/provider/locations.dart';
import 'package:food_app/widgets/inherited_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class find_resturent extends StatelessWidget {
  find_resturent({Key? key}) : super(key: key);

  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locationservices_provider = Provider.of<cartprovider>(context);
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
              onTap: () {
                locationservices_provider.currentlocation(context);
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
          Consumer<api_calls>(builder: (context, provider, child) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 242, 242, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 310,
              child: GooglePlaceAutoCompleteTextField(
                  textEditingController: address,
                  googleAPIKey: "AIzaSyBhrmU2VaNQP3P27wetiynn6UR_qfN47Xg",
                  inputDecoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_location),
                    prefixStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter a New Address',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                  debounceTime: 800,
                  // default 600 ms,
                  isLatLngRequired: true,
                  // if you required coordinates from place detail
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    // this method will return latlng with place detail
                    print("placeDetails" +
                        prediction.lat.toString() +
                        prediction.lng.toString());
                    provider.lat = prediction.lat;
                    provider.long = prediction.lng;
                    print(provider.lat);
                    print(provider.long);
                    print(address.text);
                  },
                  itmClick: (Prediction prediction) async {
                    final _prefs = SharedPreferences.getInstance();
                    final SharedPreferences prefs = await _prefs;
                    final latitude = prefs.setDouble(
                        'latitude', double.parse('${provider.lat}'));
                    final longitude = prefs.setDouble(
                        'longtitude', double.parse('${provider.long}'));
                    // final longtitude1 = prefs.getString('longtitude');
                    // print(longtitude1);

                    address.text = prediction.description!;
                    address.selection = TextSelection.fromPosition(
                        TextPosition(offset: prediction.description!.length));
                  }),
            );
          }),
          SizedBox(
            height: 25,
          ),
          Center(
            child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                height: 45,
                width: 160,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromRGBO(252, 186, 24, 1),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InheritedDataProvider(
                                  child: tabbar(),
                                  data: address.text,
                                )),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
