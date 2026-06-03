import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/home/home.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:  TAppBar(title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
    actions: [
      TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
    ],
    ),
    body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())],
      ),),
    ),
    );
  }
}