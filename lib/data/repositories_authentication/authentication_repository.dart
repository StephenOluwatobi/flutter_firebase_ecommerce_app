import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_firebase_ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_firebase_ecommerce_app/navigation_menu.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:flutter_firebase_ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ==========================================
  // ADDED: Get Authenticated User Data
  // ==========================================
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(email: _auth.currentUser?.email),
        );
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);

      if (deviceStorage.read('IsFirstTime') != true) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const OnBoardingScreen());
      }
    }
  }

  /*------------------------------------ Email & Password Authentication ------------------------------*/

  /// [EmailAuthentication] - REGISTER
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
/// [ReAuthenticate] - RE-AUTHENTICATE USER
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      
      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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
  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  /// [EmailVerification] - SEND EMAIL
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await googleSignIn
          .authenticate();

      // idToken still comes from .authentication (now synchronous, no await needed)
      final String? idToken = googleUser.authentication.idToken;

      // accessToken now comes from the authorization client
      const scopes = ['email', 'profile'];
      final authorization = await googleUser.authorizationClient
          .authorizeScopes(scopes);
      final String accessToken = authorization.accessToken;

      if (idToken == null) {
        throw 'Google authentication failed: Missing idToken.';
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      if (e.toString().toLowerCase().contains('canceled')) {
        return null;
      }
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Logout] - SIGN OUT
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await deviceStorage.erase();
      await screenRedirect();
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

  /// [PasswordReset] - SEND RESET EMAIL
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }
  
}
