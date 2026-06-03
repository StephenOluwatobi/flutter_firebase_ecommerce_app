import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/common/styles/spacing_styles.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/text_strings.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.PaddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
