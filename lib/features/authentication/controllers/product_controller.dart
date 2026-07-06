import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/product/product_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  /// Fetch products for a specific category
  Future<List<ProductModel>> fetchProductsForCategory(String categoryId) async {
    try {
      isLoading.value = true;
      final products = await productRepository.getProductsForCategory(categoryId);
      return products;
    } catch (e) {
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}