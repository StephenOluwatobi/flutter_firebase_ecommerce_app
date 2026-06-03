import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    required this.price,
    this.currencySign = '\$',
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String price;
  final String currencySign;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currencySign$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough
                  ? TextDecoration.lineThrough
                  : null,
            )
          : Theme.of(context).textTheme.titleSmall!.apply(
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              decoration: lineThrough
                  ? TextDecoration.lineThrough
                  : null,
            ),
    );
  }
}
