import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/screens/checkout/widget/billing_address_section.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/screens/checkout/widget/billing_amount_section.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/screens/checkout/widget/billing_payment_section.dart';
import 'package:flutter_firebase_ecommerce_app/features/shop/cart/cart_items.dart';
import 'package:flutter_firebase_ecommerce_app/navigation_menu.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Item in cart
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon Text Field
              TCouponCode(),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Biling Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),

                    /// Divider
                    Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Method
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      ///
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Successful',
              subtitle: 'Your order has been placed successfully.',
              onPressed: () => Get.offAll(() => NavigationMenu()),
            ),
          ),
          child: Text('Checkout\$365'),
        ),
      ),
    );
  }
}
