import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};

  void addItem(ProductsModel product, int quantity) {
    _items.putIfAbsent(
      product.id!,
      () {
        print("Adding item to the cart" +
            product.id!.toString() +
            " Quantity" +
            quantity.toString());
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
  }
}
