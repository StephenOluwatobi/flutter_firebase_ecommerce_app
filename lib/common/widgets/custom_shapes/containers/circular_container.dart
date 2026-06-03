import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.child,
    this.backgroundColor = TColors.white,
    this.height = 400,
    this.padding = 0,
    this.margin,
    this.radius = 400,
    this.icon,
    this.color = TColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final IconData? icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child ?? (icon != null ? Icon(icon, color: color) : null),
    );
  }
}
