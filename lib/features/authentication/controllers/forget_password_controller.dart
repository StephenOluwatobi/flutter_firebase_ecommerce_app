import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/authentication_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/signup/password_configuration/reset_password.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/http/network_manager.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.LottieAnimation2);

      // Check Internet & Validate
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected || !forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Stop Loader & Redirect
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Check your inbox.');

      Get.to(() => ResetPasswordScreen (email: email.text.trim()));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}