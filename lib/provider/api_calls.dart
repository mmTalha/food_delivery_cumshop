import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/Tabbar_screens/models/menu_models.dart';
import 'package:food_app/Tabbar_screens/models/menu_models.dart';
import 'package:food_app/Tabbar_screens/models/menu_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class api_calls with ChangeNotifier {
  var url = 'http://dnpprojects.com/demo/comshop/api/';
 var menus = Menus();





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
    print(gettoken
    );
    print(datas);

    notifyListeners();
  }





  Future  menu( ) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    // var data = {
    //   'lat': lat,
    //   'lon': long,
    // };
    final gettoken = prefs.getString('new');
    final longtitude  = prefs.getDouble('longtitude');
    final latitude  = prefs.getDouble('latitude');
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
    var datas = (jsonDecode(response.body));
    print(datas);
    return datas;
  }
}
