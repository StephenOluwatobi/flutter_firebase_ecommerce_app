import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);

    if (deviceStorage.read('IsFirstTime') != true) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException().message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }
}
