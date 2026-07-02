import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/widgets/shimmer.dart';
import 'package:get/get.dart'; 
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/text_strings.dart';

import 'package:flutter_firebase_ecommerce_app/features/personalization/controllers/user_controller.dart'; 



class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Initialize the controller to trigger the fetch request
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns the texts to the left nicely
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          
          // 2. Wrap the subtitle with Obx to observe changes
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a loading shimmer effect while fetching
              // (If you haven't built TShimmerEffect yet, you can temporarily use: return const CircularProgressIndicator(); )
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              // Display the actual User's Full Name
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: TColors.white,
                  fontSizeFactor: 1.5,
                ),
              );
            }
          }),
        ],
      ),
      actions: [
        TCartCounterIcon(onPressed: () {}, iconColor: TColors.white),
      ],
    );
  }
}