import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/sub_cartegories/sub_categories.dart';


class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize the Controller
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      // 2. Show Loading Indicator while fetching data
      if (categoryController.isLoading.value) {
        // You can replace this with your TCategoryShimmer if you built one
        return const Center(child: CircularProgressIndicator()); 
      }

      // 3. Show "No Data" if the list is empty
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }

      // 4. Show the actual Categories from Firebase
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              isNetworkImage: true, // Crucial: Tells the widget to use a network URL, not an asset
              onTap: () {
                // Navigate to sub-categories (we will pass the category ID here later)
                Get.to(() => const SubCategoriesScreen());
              },
            );
          },
        ),
      );
    });
  }
}