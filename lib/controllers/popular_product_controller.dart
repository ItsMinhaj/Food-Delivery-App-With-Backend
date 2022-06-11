import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      debugPrint("got data ");
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).productList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // Increase
      _quantity = checkQuantity(_quantity + 1);
    } else {
      // Decrease
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Order Summary", "",
          messageText: const Text(
            "You can,t reduce more!",
            style: TextStyle(),
          ));
      return 0;
    }
    //A single customer can't be ordered more than 20 at a time.
    else if (quantity > 20) {
      Get.snackbar("Order Summary", "",
          messageText: const Text(
            "Your order limit is exceeded!",
            style: TextStyle(),
          ));
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductsModel productsModel) {
    _cart.addItem(productsModel, _quantity);
  }
}
