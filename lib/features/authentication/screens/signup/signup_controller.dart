import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/authentication_repository.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/user/user_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/models/user_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/http/network_manager.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // 1. Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information',
        TImages.LottieAnimation2,
      );

      // 2. Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading(); 
        return;
      }

      // 3. Check Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); 
        return;
      }

      // 4. Privacy Policy Check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading(); 
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you have to read and accept the privacy policy & terms of use.',
        );
        return;
      }

      // 5. Register user in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // 6. Save Authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // 7. Send Email Verification
      await AuthenticationRepository.instance.sendEmailVerification();

      // 8. Stop Loading
      TFullScreenLoader.stopLoading();

      // 9. Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continue.',
      );

      // 10. Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      
    } catch (e) {
      // 11. Stop loading in case of any error
      TFullScreenLoader.stopLoading();
      
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}