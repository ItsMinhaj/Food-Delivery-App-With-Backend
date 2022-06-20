// ignore_for_file: sort_child_properties_last

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/add_to_cart_controller.dart';
import 'package:food_delivery/controllers/favorite_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_item_list.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:food_delivery/utlis/app_constants.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class RecommendFoodDetails extends StatelessWidget {
  final int pageId;
  const RecommendFoodDetails({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    var cartController = Get.find<AddToCartController>();
    var favController = Get.find<FavoriteController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //AppBar Of Recommended Food Details
          SliverAppBar(
            backgroundColor: AppColors.yellowColor,
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initail);
                  },
                  child: const AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                Row(
                  children: [
                    // Favortie Icon
                    Badge(
                        badgeContent:
                            GetX<FavoriteController>(builder: (favController) {
                          return Text(favController.numberOfItems.toString());
                        }),
                        child: const AppIcon(icon: Icons.favorite)),
                    SizedBox(width: Dimensions.width20),
                    // Cart Icon
                    Badge(
                      badgeContent:
                          GetX<AddToCartController>(builder: (controller) {
                        return Text(controller.totalQuantity.toString(),
                            style: const TextStyle(color: Colors.white));
                      }),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(CartItemListScreen());
                          },
                          child: const AppIcon(
                              icon: Icons.shopping_cart_outlined)),
                    ),
                  ],
                )
              ],
            ),
            bottom: PreferredSize(
                // Header  section
                child: Container(
                  padding: EdgeInsets.only(bottom: Dimensions.height15 / 3),
                  width: double.maxFinite,
                  child: Center(
                      child:
                          BigText(text: product.name, size: Dimensions.text26)),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                preferredSize: Size.fromHeight(Dimensions.height24)),
            expandedHeight: 300,
            // Recommended Image Section
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URI + product.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Recommended Description
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Text(
                product.description,
                style: const TextStyle(height: 1.8, color: Colors.black38),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20 * 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remove quantity
                GestureDetector(
                  onTap: () {
                    cartController.removeQuantity();
                  },
                  child: AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
                GetX<AddToCartController>(builder: (controller) {
                  return BigText(
                      text:
                          "\$ ${product.price}  X  ${controller.numberOfItems}",
                      size: Dimensions.text26);
                }),
                // Add Quantity
                GestureDetector(
                  onTap: () {
                    cartController.addQuantity();
                  },
                  child: AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.height120,
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height30),
                    topRight: Radius.circular(Dimensions.height30))),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Add to cart section
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        top: Dimensions.height20,
                        bottom: Dimensions.height20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            favController.addToFavitem(product);
                          },
                          child:
                              GetX<FavoriteController>(builder: (controller) {
                            return Icon(Icons.favorite,
                                color: controller.isFavorite.value
                                    ? Colors.red
                                    : Colors.grey);
                          }),
                        ),
                      ],
                    ),
                  ),
                  // Add to cart Button
                  GestureDetector(
                    onTap: () {
                      cartController.addToCart(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20)),
                      child: Row(
                        children: [
                          BigText(
                              text:
                                  "\$${cartController.totalAmount} | Add to cart",
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
