import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utlis/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProdcutList() async {
    return await apiClient.fetchData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
