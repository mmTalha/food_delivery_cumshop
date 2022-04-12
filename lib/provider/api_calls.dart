import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/menu_models.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class api_calls with ChangeNotifier {
  var url = 'http://dnpprojects.com/demo/comshop/api/';
  var imageurl =
      'https://dnpprojects.com/demo/comshop/public/storage/restaurant/logo/';
  String Address = 'search';
  String locate = '';
  List list = [];

  void login(email, password) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var data = {
      'email': email,
      'password': password,
    };
    var userHeader = {"Accept": "application/json"};
    final response = await http.post(
      Uri.parse(
        '${url}login?email=${email}&password=${password}',
      ),
      headers: userHeader,
    );
    var datas = (jsonDecode(response.body));
    var token = datas['data']['token'];
    final token1 = prefs.setString('new', token);
    final gettoken = prefs.getString('new');
    print(gettoken);
    print(datas);

    notifyListeners();
  }

  Future menuitems() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getRestuarant/${latitude}/${longtitude}',
      ),
      headers: userHeader,
    );
    var datas = json.decode(response.body);

    return datas;
  }

  Future details_product(id) async {

    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getsingleRest/$id',
      ),
      headers: userHeader,
    );

    var datas = jsonDecode(response.body);


   
    return datas;
  }
  Future deatils_varient(id) async {

    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}productDetail/$id',
      ),
      headers: userHeader,
    );

    var datas = jsonDecode(response.body);

    // print(datas);

    return datas;
  }
  Future add_to_cart(product_id,restaurant_id,variant_id,price,quantity) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}addCart?product_id=$product_id&restaurant_id=$restaurant_id&variant_id=$variant_id&price=$price&quantity=$quantity',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);
    notifyListeners();
    return datas;
  }
  Future get_cart( ) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}ShowAllCart',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);

    return datas;
  }

}
