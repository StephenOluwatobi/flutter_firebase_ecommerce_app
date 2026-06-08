import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/brand/brand_product.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80.0,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
