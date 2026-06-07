import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.grey,
    this.imageUrl,
    this.applyImageRadius = false,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final String? imageUrl;
  final bool applyImageRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: imageUrl == null ? backgroundColor : null,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        image: imageUrl != null
            ? DecorationImage(
                image: AssetImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: child,
    );
  }
}
