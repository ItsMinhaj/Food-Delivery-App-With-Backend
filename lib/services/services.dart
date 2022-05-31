import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/model/popular_food_model.dart';
import 'package:food_delivery/utlis/api_url.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<PopularFoodModel?> PopularFood() async {
    final response = await http.get(Uri.parse(popularFoodUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint(data.toString());
      return PopularFoodModel.fromJson(data);
    } else {
      throw "something went wrong";
    }
  }
}
