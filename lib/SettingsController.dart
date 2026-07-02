import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/authentication_repository.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  // This handles the logout process
  Future<void> logout() async {
    try {
      // 1. Trigger the logout logic in your repository
      await AuthenticationRepository.instance.logout();
    } catch (e) {
      // Handle any unexpected errors
    }
  }
}