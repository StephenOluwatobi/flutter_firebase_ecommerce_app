import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                ),
                items:
                    [
                          "Name",
                          "Higher Price",
                          "Lower Price",
                          "Sale",
                          "Newest",
                          "Popularity",
                        ]
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              TGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) =>
                    const TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
