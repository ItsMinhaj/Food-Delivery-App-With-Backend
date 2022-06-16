import 'package:food_delivery/model/cart_list_item_model.dart';
import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class RecommendedCartController extends GetxController {
  var recommendedCartItems = <CartListItemModel>[].obs;
  var numberOfItems = 0.obs;
  var totalQuantity = 0.obs;
  var totalAmount = 0.obs;

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

  addToCart(ProductsModel products) {
    final index = recommendedCartItems
        .indexWhere((element) => element.product == products);

    // if recommendedCartItem index is zero or greater than zero that means product already in the list,
    // so we will only update the quantity
    if (index >= 0) {
      recommendedCartItems[index] = CartListItemModel(
          product: products,
          quantity: numberOfItems.value +
              recommendedCartItems[index]
                  .quantity); // previous item + current items
    } else {
      recommendedCartItems.add(
          CartListItemModel(product: products, quantity: numberOfItems.value));
    }

    totalQuantity.value = totalQuantity.value + numberOfItems.value;

    totalAmount.value =
        totalAmount.value + ((products.price!) * numberOfItems.value);
    numberOfItems.value = 0;

    // Get.snackbar("Cart List", "Item added to cart");
  }

  initQuantity() {
    numberOfItems.value = 0;
  }
}
