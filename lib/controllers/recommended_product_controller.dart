import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/model/popular_product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProdcutList();
    if (response.statusCode == 200) {
      debugPrint("got data ");
      _recommendedProductList = [];
      _recommendedProductList
          .addAll(Products.fromJson(response.body).productList);
      _isLoaded = true;
      update();
    } else {}
  }
}
