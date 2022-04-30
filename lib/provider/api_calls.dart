import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/resturent_model.dart';
import 'package:food_app/provider/cartprovider.dart';
import 'package:food_app/signin_register_screens/find_resturent_near_you.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class api_calls with ChangeNotifier {
  var lat;
  var long;
  String locate = '';
  bool isvalue = false;
  var url = 'http://dnpprojects.com/demo/comshop/api/';
  var imageurl =
      'https://dnpprojects.com/demo/comshop/public/storage/restaurant/logo/';
  bool cartvalue = false;
  bool isdelete = false;


   login(email, password, BuildContext context) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var data = {
      'email': email,
      'password': password,
    };
    var userHeader = {"Accept": "application/json"};

    final response = await http.post(
      Uri.parse(
        '${url}login?email=$email&password=$password',
      ),
      headers: userHeader,
    );

    if (response.statusCode == 200) {
      isvalue = false;
      var datas = (jsonDecode(response.body));

      var token = datas['data']['token'];
      final token1 = prefs.setString('new', token);
      final gettoken = prefs.getString('new');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => find_resturent()),
      );
      isvalue = false;
      print(gettoken);
      print(datas);
    }
    else if(response.statusCode==404)
    {
      isvalue = false;
      _rotateDialog(context);
    }
    else if(response.statusCode==500)

    {
      isvalue = false;
      _rotateDialog(context);
    }
    else {

      print(isvalue);
      _rotateDialog(context);

      var datas = (jsonDecode(response.body));
      print(datas);
      isvalue = false;
      return ;
    }

    notifyListeners();
    print(isvalue);
    return;
  }

  Future menuitems() async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    print(longtitude);
    print(latitude);
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
    var data = json.decode(response.body);
    if (data.toString().contains('Not Found')) {
      return null ;
    }
    else {
      print(data);
      return data;
    }
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
      return datas;


  }

  void add_to_cart(
      product_id, restaurant_id, variant_id, price, quantity) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    notifyListeners();
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

  Future get_cart() async {
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
    print('getcart_listening');
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return data;
    } else {
      return int.parse(data['message']);
    }
  }

  void delete_cart(id) async {
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
        '${url}destroyCart/$id',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      var datas = jsonDecode(response.body);
      print(datas);
      notifyListeners();
      print('deltecart_listening');
      Timer(Duration(seconds: 1), () {
        isdelete = false;
      });
      return datas;
    }
  }

  void update_cart(id, val) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${url}updateCart/$id?quantity=$val',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);

    notifyListeners();
    print('deltecart_listening');
    Timer(Duration(seconds: 1), () {
      cartvalue = false;
    });
    return datas;
  }

  void checkout_screen(vatvalue, payment, sub_total, vat_value, total_price,
      method, restaurant_id, special_instruction) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    final longtitude = prefs.getDouble('longtitude');
    final latitude = prefs.getDouble('latitude');
    List<Placemark> placemarks =
        await placemarkFromCoordinates(longtitude!, latitude!);
    Placemark place = placemarks[0];
    print(place.name);
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };

    final response = await http.post(
      Uri.parse(
        '${url}checkout/$vatvalue/$payment/$latitude/$longtitude?sub_total=$sub_total&vat_value=$vat_value&total_price=$total_price&payment_method=$method&restaurant_id=$restaurant_id&special_instructions=$special_instruction&address=${place.name}',
      ),
      headers: userHeader,
    );
    var datas = jsonDecode(response.body);
    print(datas);
    print(longtitude);
    notifyListeners();
    print('checkout_screen_listening');
  }
}

Widget _dialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Error"),
    content: const Text("Incorrect Password or Email "),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Okay"))
    ],
  );
}

void _rotateDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      return _dialog(ctx);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
