import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/widgets/buttom_add_to_cart_widget.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/ratings/rating_share_widget.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const TProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Rating
                  const TRatingAndShare(),

                  /// - Price Title, Stock, & Brand
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Attributes
                  const TProductAttribute(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// -- Description
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'A project description is a foundational document outlining a projects goals, scope, deliverables, and execution strategy. It acts as a strategic blueprint that aligns project teams and stakeholders, defines success metrics, and provides clear direction throughout the project lifecycle  ',

                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      const Expanded(
                        child: TSectionHeading(
                          title: 'Reviews(200)',
                          showActionButton: false,
                        ),
                      ),

                      IconButton(
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                        onPressed: () => Get.to(
                          () => const ProductReviewsScreen(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
