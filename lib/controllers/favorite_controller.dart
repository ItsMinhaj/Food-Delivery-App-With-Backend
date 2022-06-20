import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteItems = <ProductsModel>[].obs;
  var numberOfItems = 0.obs;
  var isFavorite = false.obs;

  addToFavitem(ProductsModel products) {
    if (!favoriteItems.contains(products)) {
      isFavorite(true);
      favoriteItems.add(products);
      numberOfItems++;
    } else {
      isFavorite(false);
      favoriteItems.remove(products);
      numberOfItems--;
    }
    isFavorite.value = false;
  }
}
