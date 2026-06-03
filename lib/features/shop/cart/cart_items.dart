import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < 2; index++) ...[
          Column(
            children: [
              /// Cart Item
              const TCartItem(),

              if (showAddRemoveButton)
                const SizedBox(height: TSizes.spaceBtwItems),

              /// Add Remove Button Row with total Price
              if (showAddRemoveButton)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// Extra Space
                        SizedBox(width: 70),

                        /// Add Remove Button
                        TProductQunatityWithAddRemove(),
                      ],
                    ),

                    TProductPriceText(price: '365'),
                  ],
                ),
            ],
          ),
          if (index < 1) const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ],
    );
  }
}
