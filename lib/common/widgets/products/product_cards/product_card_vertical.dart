import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/styles/shadows.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_details/widgets/product_detail.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {Get.to(() => const ProductDetailScreen());},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(
            TSizes.productImageRadius,
          ),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [

            /// --- Thumbnail, Wishlist Button, Discount Tag
            
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark
                  ? TColors.darkContainer
                  : TColors.light,
              child: Stack(
                children: [
                  
                  /// -- Thumbnail Image
                  
                  const TRoundedImage(
                    imageUrl: TImages.productImage38,
                    applyImageRadius: true,
                  ),

                  /// --Sales Tag
                  /// 
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(
                        0.8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '20% OFF',
                        style: Theme.of(context).textTheme.labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),

            // Todo: Add Spacer() here to keep the height of each Box some in case 1 or 2 lines of Headings
            Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: const TProductPriceText(
                    price: '35.0',
                    isLarge: true,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(
                        TSizes.productImageRadius,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: TSizes.iconLg * 1.2,
                    width: TSizes.iconLg * 1.2,
                    child: const Center(
                      child: Icon(Iconsax.add, color: TColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


