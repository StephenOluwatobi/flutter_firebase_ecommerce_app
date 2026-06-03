import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: TImages.productImage41,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroungColor:
              THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
    
        /// Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleTextWithVerifiedIcon(
                title: 'Nike',
              ),
              Flexible(
                child: TProductTitleText(
                  title: 'Blue Sports Shoe',
                  maxLines: 1,
                ),
              ),
    
              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall,
                    ),
    
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
