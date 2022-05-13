import 'dart:convert';

import 'package:food_app/models/categories_model.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class get_categories extends api_calls{

  Future<Categories>    getcategories( ) async {
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.get(
      Uri.parse(
        '${url}getCategories',
      ),
      headers: userHeader,
    );
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);
      var categories = Categories.fromJson(data);
      print(categories);
      return categories;

    } else {
      return data;
    }
  }
}