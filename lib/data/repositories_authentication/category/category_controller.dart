import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_model.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_repository.dart';
import 'package:get/get.dart';

import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  
  // RxLists to observe changes and redraw UI automatically
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Load category data from Firestore
  Future<void> fetchCategories() async {
    try {
      // Start the loader
      isLoading.value = true;

      // Fetch categories from the repository
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter to only show Featured & Parent categories (where parentId is empty)
      featuredCategories.assignAll(
        allCategories
            .where((category) => category.isFeatured && category.parentId.isEmpty)
            .take(8) // Limit to 8 for the home screen UI
            .toList(),
      );

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop the loader regardless of success or failure
      isLoading.value = false;
    }
  }
}