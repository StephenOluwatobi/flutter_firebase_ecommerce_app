import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/text_field.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter_firebase_ecommerce_app/utils/theme/elevated_button_theme.dart';

class TAppTheme {
  TAppTheme._();

  /// -- Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme:
        TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme:
        TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme:
        TTextFormFieldTheme.lightInputDecorationTheme,
  );

  /// -- Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme:
        TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
