import "package:flutter/material.dart";
import "package:flutter_firebase_ecommerce_app/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:flutter_firebase_ecommerce_app/utils/constants/colors.dart";
import "package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart";
import "package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart";
import "package:iconsax/iconsax.dart";

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 15, // Replace with actual order count
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (context, index) => TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// 1 - Icon
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBtwItems / 2),

                /// 2 -Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'processing',
                        style: Theme.of(context).textTheme.bodyLarge!
                            .apply(
                              color: TColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text(
                        '07 Nov 2026',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                /// 3 - Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: TSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.ship),
                      SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium,
                            ),

                            Text(
                              '[#12345f]',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              'shipping date',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium,
                            ),

                            Text(
                              '03 june 2026',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
