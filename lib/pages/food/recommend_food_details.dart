// ignore_for_file: sort_child_properties_last

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_cart_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/routes_helper.dart';
import 'package:food_delivery/utlis/app_constants.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommendFoodDetails extends StatelessWidget {
  final int pageId;
   RecommendFoodDetails({Key? key, required this.pageId})
      : super(key: key);


  @override
  Widget build(BuildContext context) {

    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];


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
                GetX<RecommendedCartController>(

                  builder: (controller) {
                    return Badge(
                      badgeContent: Text("${controller.totalQuantity}", style: const TextStyle(color: Colors.white)),
                      child: const AppIcon(icon: Icons.shopping_cart_outlined),
                    );
                  }
                )
              ],
            ),
            bottom: PreferredSize(
                // Header Icon section
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
            child: GetX<RecommendedCartController>(

              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.removeQuantity();
                },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(
                        text: "\$ ${product.price}  X  ${controller.numberOfItems.value}", size: Dimensions.text26),
                    GestureDetector(
                      onTap: (){
                        controller.addQuantity();
                },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                );
              }
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
                  // Cart adding, removing section
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
                        Icon(Icons.favorite, color: AppColors.mainColor),
                      ],
                    ),
                  ),
                  // Add to cart section
                  GetX<RecommendedCartController>(

                    builder: (controller) {
                      return GestureDetector(
                        onTap: (){
                          controller.addToCart(product);
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
                                  text: "\$${controller.totalAmount} | Add to cart", color: Colors.white),
                            ],
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
