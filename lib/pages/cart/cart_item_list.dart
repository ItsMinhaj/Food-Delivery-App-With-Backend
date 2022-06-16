import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_cart_controller.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:get/get.dart';

import '../../utlis/app_constants.dart';

class CartItemListScreen extends StatelessWidget {
  CartItemListScreen({Key? key}) : super(key: key);

  final RecommendedCartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: const Text(
          "Cart Item Lists",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.recommendedCartItems.length,
                itemBuilder: (context, index) {
                  var cartImage =
                      cartController.recommendedCartItems[index].product.img;
                  return Card(
                    color: AppColors.mainColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            AppConstants.BASE_URL +
                                AppConstants.UPLOAD_URI +
                                cartImage!,
                            width: Dimensions.width120 - Dimensions.width20,
                            height: Dimensions.height100 - Dimensions.height20,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              Text(
                                  "Quantity: ${cartController.recommendedCartItems[index].quantity}"),
                              SizedBox(height: Dimensions.height20),
                              InkWell(
                                onTap: () {
                                  cartController.deleteCartItem(cartController
                                      .recommendedCartItems[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: Dimensions.height20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  return Text(
                      "Total Quantity: ${cartController.totalQuantity.value.toString()}");
                }),
                Obx(() {
                  return Text("Total Amount: \$${cartController.totalAmount}");
                }),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.iconColor2,
              ),
              onPressed: () {},
              child: const Text("Make Payement")),
          SizedBox(height: Dimensions.height20)
        ],
      ),
    );
  }
}
