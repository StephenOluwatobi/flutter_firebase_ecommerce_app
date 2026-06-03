import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
import 'package:flutter_firebase_ecommerce_app/utils/device/device_utility.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/helpers_functions.dart';



class TTabBar extends StatelessWidget implements PreferredSizeWidget {

  /// if you want to add the backgroung color to tabs you have to warp them in material widget.
/// To do that we need [PreferredSize] widget and that's why created custom widget class. [PreferredSize]


  const TTabBar({super.key, required this.tabs});


final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs : tabs,
        isScrollable: true,
        indicatorColor : TColors.primary,
        labelColor: dark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkerGrey,

      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}