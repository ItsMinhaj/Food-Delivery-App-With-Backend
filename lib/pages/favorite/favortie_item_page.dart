import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/favorite_controller.dart';
import 'package:food_delivery/utlis/app_constants.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
import 'package:get/get.dart';

class FavoriteItemPage extends StatelessWidget {
  FavoriteItemPage({Key? key}) : super(key: key);

  final FavoriteController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        title: const Text(
          "Favorite List",
          style: TextStyle(color: Colors.black54),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: favController.favoriteItems.length,
              itemBuilder: (context, index) {
                var cartImage = favController.favoriteItems[index].img;
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
                                "Price: ${favController.favoriteItems[index].price}"),
                            SizedBox(height: Dimensions.height20),
                            InkWell(
                              onTap: () {
                                favController.addToFavitem(
                                    favController.favoriteItems[index]);
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
      ]),
    );
  }
}
