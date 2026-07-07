import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/product/product_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Observable states
  final isLoading = false.obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  
  // Repository Injection
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    // THE TRIGGER: This runs immediately when the controller is injected on the HomeScreen
    fetchFeaturedProducts(); 
  }

  /// --- Fetch Featured Products for the Home Screen ---
  Future<void> fetchFeaturedProducts() async {
    try {
      // 1. Start Loader
      isLoading.value = true;

      // 2. Fetch Products from the Repository (Strictly Typed)
      final List<ProductModel> products = await productRepository.getFeaturedProducts();

      // 3. Assign Products to the observable list cleanly
      featuredProducts.assignAll(products);

    } catch (e) {
      // Print the error so you can debug it in the console!
      print('Error fetching featured products: ${e.toString()}');
    } finally {
      // 4. Stop Loader
      isLoading.value = false;
    }
  }

  /// --- Fetch products for a specific category ---
  Future<List<ProductModel>> fetchProductsForCategory(String categoryId) async {
    try {
      final List<ProductModel> products = await productRepository.getProductsForCategory(categoryId);
      return products;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}