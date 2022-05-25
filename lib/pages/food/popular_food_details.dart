import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:food_delivery/widgets/expandable_text.dart';

import '../../utlis/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Popular Food Details Image Section
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.poplularFoodImageHeight,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/food0.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          // App Icon
          Positioned(
            top: Dimensions.height15,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          // Popular Text Container
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.poplularFoodImageHeight - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side", size: Dimensions.text26),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.height15))),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "4.6"),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "1287"),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          icon: Icons.circle,
                          iconColor: AppColors.iconColor1,
                          text: "Normal",
                          color: AppColors.textColor),
                      IconAndText(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: "1.75km",
                          color: AppColors.textColor),
                      IconAndText(
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: "Normal",
                          color: AppColors.textColor),
                    ],
                  ),
                  SizedBox(height: Dimensions.height30),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  // Expandable Text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim vitae ex quis pretium. Aliquam erat volutpat. Curabitur a nisi vel mi condimentum condimentum. Maecenas vitae libero id nibh luctus pellentesque ac aliquam ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed at eros a nisi ullamcorper eleifend ac ut leo. Nam aliquam vulputate bibendum.
                    
                    Nam congue velit id risus dapibus suscipit. Etiam pulvinar ultrices pellentesque. Vestibulum ut ante libero. Nulla dui quam, sollicitudin nec metus et, tristique porta urna. Morbi pulvinar elit eu dolor semper, ac dictum odio aliquam. Etiam condimentum vestibulum est. Maecenas suscipit leo dui, ac dictum est tristique et. Mauris condimentum consequat diam eget aliquet.
                    
                    Vivamus lacinia vitae tortor vel vestibulum. Aliquam ut orci volutpat, vulputate dui at, laoreet neque. Quisque dictum odio nec ipsum blandit iaculis. In in facilisis tellus, ac porttitor quam. Maecenas nec quam gravida ligula tincidunt volutpat ultricies sed ex. Maecenas non laoreet quam, id venenatis neque. Cras gravida ipsum sed porta consequat. Fusce aliquet sapien ac gravida iaculis. Ut sem purus, rhoncus nec tincidunt ac, ornare eget lectus. Etiam in nunc sit amet tellus fringilla hendrerit. Nunc tincidunt odio non nulla lacinia, et consequat ligula pretium.''',
                        style: TextStyle(color: AppColors.textColor),
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 3,
                        linkColor: AppColors.mainColor,
                      ),
                    ),
                  )
                  // const ExpandableTextWidget(
                  //     text:
                  //         "Lorem ipsum dolor sit amet, consectetur adsffffffffffffffff asdfsadf adipiscing elit. Donec dignissim vitae ex quis pretium. Aliquam erat volutpat. Curabitur a nisi vel mi condimentum condimentum. Maecenas vitae libero id nibh luctus pellentesque ac aliquam ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed at eros a nisi ullamcorper eleifend ac ut leo. Nam aliquam vulputate bibendum...")
                ],
              ),
            ),
          ),
        ],
      ),
      // BottomNavigation Bar section
      bottomNavigationBar: Container(
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
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.remove, color: AppColors.signColor),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: "0"),
                    SizedBox(width: Dimensions.width10 / 2),
                    Icon(Icons.add, color: AppColors.signColor)
                  ],
                ),
              ),
              // Add to cart section
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20,
                    bottom: Dimensions.height20),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  children: [
                    BigText(text: "\$10 | Add to cart", color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
