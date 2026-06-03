import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/ratings/ratings.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/ratings/rating_progress_indicator.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/product_reviews/user_review_card.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: TAppBar(title: const Text('Reviews & Ratings')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings & Reviews will be shown here'),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 2.4),
              Text('2.4 out of 5'),
              SizedBox(height: TSizes.spaceBtwItems),

              /// User Ratings Ratings
              UserReviewCard(),
              SizedBox(height: TSizes.spaceBtwItems),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
