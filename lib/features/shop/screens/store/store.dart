import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/tabbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/brand/aii_brand.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Featured Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () =>
                            Get.to(() => const AllBrandScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),

                      /// -- Brands GRID
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- TABS
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
