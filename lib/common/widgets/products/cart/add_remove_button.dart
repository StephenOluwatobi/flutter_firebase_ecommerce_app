import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductQunatityWithAddRemove extends StatelessWidget {
  const TProductQunatityWithAddRemove({super.key});

  @override
  Widget build(BuildContext context) {
    return
    
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),
        Text('1', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),

        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,

          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
