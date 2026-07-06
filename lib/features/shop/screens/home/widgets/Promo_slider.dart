import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/controllers/banner_controller.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  }); // <-- Removed the hardcoded banners list

  @override
  Widget build(BuildContext context) {
    // 1. Inject the Banner Controller instead of the Home Controller
    final controller = Get.put(BannerController());

    // 2. Wrap the entire UI in Obx to listen for Firebase data
    return Obx(() {
      // 3. Handle Loading State
      if (controller.isLoading.value) {
        // You can swap this for a TShimmerEffect later!
        return const Center(child: CircularProgressIndicator());
      }

      // 4. Handle Empty State
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Banners Found!'));
      }

      // 5. Build the UI with the fetched data
      return Column(
        children: [
          CarouselSlider(
            key: ValueKey(controller.banners.length),
            options: CarouselOptions(
              height: 180,
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: controller.banners
                .map(
                  (banner) => TRoundedImage(
                    imageUrl: banner
                        .imageUrl, // <-- Data straight from Firebase
                    isNetworkImage:
                        false, // <-- Tell Flutter to download the image
                    width: double.infinity,
                    fit: BoxFit.contain,
                    borderRadius: TSizes.cardRadiusLg,
                    onPressed: () => Get.toNamed(
                      banner.targetScreen,
                    ), // Routing setup!
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // 6. Navigation Dots
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  TCircularContainer(
                    width: controller.carousalCurrentIndex.value == i
                        ? 20
                        : 6,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor:
                        controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
