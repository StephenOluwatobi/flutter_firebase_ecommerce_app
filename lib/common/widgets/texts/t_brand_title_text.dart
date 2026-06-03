import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
final Color? color;
final String title;
final int maxLines;
final TextAlign? textAlign;
final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
          ? Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
          ? Theme.of(
              context,
            ).textTheme.bodyLarge!.apply(color: color)
          : brandTextSize == TextSizes.large
          ? Theme.of(
              context,
            ).textTheme.titleLarge!.apply(color: color)
          : Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
