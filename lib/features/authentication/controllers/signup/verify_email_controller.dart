import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/authentication_repository.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: 'Email sent',
        message: 'A verification email has been sent to your inbox.',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: TImages.LottieAnimation3,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  Future<void> checkEmailVerificationStatus() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: TImages.LottieAnimation3,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () =>
              AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    } else {
      TLoaders.warningSnackBar(
        title: 'Verification pending',
        message:
            'Please verify your email address before continuing.',
      );
    }
  }
}
