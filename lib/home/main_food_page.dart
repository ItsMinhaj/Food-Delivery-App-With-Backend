import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bangladesh", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(
                          text: "Munshiganj",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
