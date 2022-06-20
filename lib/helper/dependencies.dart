import 'package:food_delivery/controllers/add_to_cart_controller.dart';
import 'package:food_delivery/controllers/favorite_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/utlis/app_constants.dart';
import 'package:get/get.dart';

class Dependency {
  static Future<void> init() async {
    //First load Api Client dependency
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    // Second we have to load Repo dependcy
    Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => CartRepo());

    //finally have to load Controller dependency
    Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
    Get.lazyPut(
        () => RecommendedProductController(recommendedProductRepo: Get.find()));
    Get.lazyPut(() => AddToCartController());
    Get.lazyPut(() => FavoriteController());
  }
}
