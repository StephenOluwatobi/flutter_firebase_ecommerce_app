import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/aii_products/aii_product.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/widgets/Promo_slider.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --Appbar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Search bar
                  const TSearchContainer(
                    text: 'Search in Store',
                    onTap: null,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// -- Heading
                        const TSectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TPromoSlider(
                    banners: [
                      /// -- Promo Slider
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.promoBanner4,
                      TImages.promoBanner5,
                      TImages.promoBanner6,
                      TImages.promoBanner7,
                      TImages.promoBanner8,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Heading
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () =>
                        Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Popular Products
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: 3,
                    itemBuilder: (_, index) =>
                        const TProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
