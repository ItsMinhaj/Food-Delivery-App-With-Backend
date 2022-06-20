import 'package:flutter/cupertino.dart';
import 'package:food_delivery/pages/food/popular_food_details.dart';
import 'package:food_delivery/pages/food/recommend_food_details.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initail = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  //If we want pass some value or parameter during navigation then
  // we can follow this approach.
  static String getPopularFoodPage(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFoodPage(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => const MainFoodPage()),

    // To pass parameter or value to other screen
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters["pageId"];
          return PopularFoodDetails(pageId: int.parse(pageId!));
        }),

    GetPage(
        name: recommendedFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters["pageId"];
          return RecommendFoodDetails(pageId: int.parse(pageId!));
        })
  ];
}
