import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/category/category_model.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/controllers/product_controller.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
// ... other imports

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Products Grid
              FutureBuilder(
                future: controller.fetchProductsForCategory(category.id),
                builder: (context, snapshot) {
                  // Handle loading/error states
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  final products = snapshot.data ?? [];
                  if (products.isEmpty) return const Center(child: Text("No products found!"));

                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}