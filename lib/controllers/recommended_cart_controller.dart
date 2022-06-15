import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class RecommendedCartController extends GetxController {
  var recommendedCartItems = <ProductsModel>[].obs;
  var numberOfItems = 0.obs;
  var totalQuantity = 0.obs;

  double get totalAmount =>
      recommendedCartItems.fold(0, (sum, item) => sum + item.price!);
  //int get numberOfItems => recommendedCartItems.length;

  addToCart(ProductsModel products) {
    recommendedCartItems.add(products);
    totalQuantity.value = totalQuantity.value + numberOfItems.value;
    numberOfItems.value = 0;

    // Get.snackbar("Cart List", "Item added to cart");
  }

  addQuantity() {
    numberOfItems.value++;
  }

  removeQuantity() {
    if (numberOfItems.value < 1) {
      Get.snackbar("Cart", "you can't reduce more!");
    } else {
      numberOfItems.value--;
    }
  }
}
