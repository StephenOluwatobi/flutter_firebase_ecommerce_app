import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sport shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedContainer(
                width: double.infinity,

                imageUrl: TImages.promoBanner4,
                applyImageRadius: true,
              ),

              SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-categories List
              Column(
                children: [
                  /// Heading
                  TSectionHeading(
                    title: 'Sport Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
