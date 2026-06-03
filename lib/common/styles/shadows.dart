import 'package:flutter/material.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
  );
  
  static final horizontalProductShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 50,
    offset: const Offset(2, 0),
  );
}