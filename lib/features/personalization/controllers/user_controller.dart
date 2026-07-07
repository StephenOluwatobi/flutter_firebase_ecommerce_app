import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/authentication_repository.dart';
import 'package:flutter_firebase_ecommerce_app/data/repositories_authentication/user/user_repository.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/re_auth_user_login_form.dart';
import 'package:flutter_firebase_ecommerce_app/features/personalization/models/user_model.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_firebase_ecommerce_app/utils/helpers/cloudinary_service.dart';
import 'package:flutter_firebase_ecommerce_app/utils/http/network_manager.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_firebase_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  final cloudinaryService = CloudinaryService();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record from Firestore
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final userDetails = await userRepository.fetchUserDetails();
      user(userDetails);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> uploadUserProfilePicture() async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery, 
      imageQuality: 70, 
      maxHeight: 512, 
      maxWidth: 512
    );
    
    if (image != null) {
      TFullScreenLoader.openLoadingDialog('Uploading...', TImages.LottieAnimation1);

      // CALL YOUR NEW SERVICE METHOD HERE
      final imageUrl = await CloudinaryService.uploadFile(image.path);

      if (imageUrl != null) {
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
      }
      
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'Profile picture updated.');
    }
  } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(
          userCredential.user!.displayName ?? '',
        );
        final username = UserModel.generateUsername(
          userCredential.user!.displayName ?? '',
        );

        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1
              ? nameParts.sublist(1).join(' ')
              : "",
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(newUser);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  // ==========================================================
  // DELETE ACCOUNT LOGIC
  // ==========================================================

  /// Delete Account Warning Popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.LottieAnimation1);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          // If Google User, sign in with Google credential first
          await auth.signInWithGoogle();
          await deleteUser();
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Create this helper to avoid repeating the deletion code
  Future<void> deleteUser() async {
    await userRepository.removeUserRecord(user.value.id);
    await AuthenticationRepository.instance.authUser?.delete();
    TFullScreenLoader.stopLoading();
    AuthenticationRepository.instance.logout();
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing...',
        'assets/images/animations/141594-animation-of-docer.json',
      );

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await userRepository.removeUserRecord(user.value.id);
      await AuthenticationRepository.instance.authUser?.delete();

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.logout();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }
}
