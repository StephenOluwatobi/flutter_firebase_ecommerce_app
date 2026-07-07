import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product; // Now this card is "product-aware"

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /* Navigate to detail screen */
      },
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            /// -- Thumbnail --
            TRoundedImage(
              imageUrl: product.thumbnail,
              //  Automatically switches between network and local assets
              isNetworkImage: product.thumbnail.contains('http'),
              applyImageRadius: true,
              fit: BoxFit.cover,
            ),

            /// -- Details --
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  TBrandTitleTextWithVerifiedIcon(
                    title: product.brandName,
                  ),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TProductPriceText(
                    price: product.price.toString(),
                  ), // Dynamic price
                  const Icon(Icons.add, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
