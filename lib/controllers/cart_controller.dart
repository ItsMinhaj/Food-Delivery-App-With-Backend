import 'package:flutter/cupertino.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductsModel product, int quantity) {
    var totalQuantity = 0;
    // if product item already added to the cart and you want to increase or decrease quantity of that item.
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;
          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        },
      );
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    }
    // If product is not added already then it will be ex
    else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            debugPrint(
                "Adding item to the cart id ${product.id!} Quantity$quantity");
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
            );
          },
        );
      } else {
        Get.snackbar("Attention", "You can't add 0 item to the cart");
      }
    }
  }

  bool existInCart(ProductsModel productsModel) {
    if (_items.containsKey(productsModel.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });
    return totalQuantity;
  }
}
