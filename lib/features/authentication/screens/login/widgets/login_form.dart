import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/login/login_controller.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/signup/password_configuration/forget_password.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// Email Input Field
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),

              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    TValidator.validatePassword(value),

                obscureText: controller.hidepassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidepassword.value =
                        !controller.hidepassword.value,
                    icon: Icon(
                      controller.hidepassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remenber me and Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remeber Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.rememberMe.value =
                                !controller.rememberMe.value,
                      ),
                    ),

                    const Text(TTexts.rememberMe),
                  ],
                ),

                /// Forget Password Button
                TextButton(
                  onPressed: () =>
                      Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(TTexts.createAccount),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
