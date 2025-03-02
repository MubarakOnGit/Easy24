import 'package:abu_app/features/authentication/screens/login/login.dart';
import 'package:abu_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// function to show relevant screen
  void screenRedirect() async {
    // local storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnboardingScreen());
  }

  /// [EmailAuthentication] sing in

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
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// re-authenticate
  // Add re-authenticate logic here if needed

  /// email verification
  // Add email verification logic here if needed

  /// forgot password
  // Add forgot password logic here if needed

  //-------------------------------------------------

  /// Google authentication
  // Add Google authentication logic here if needed

  /// Facebook authentication
  // Add Facebook authentication logic here if needed

  //-------------------------------------------------

  /// valid for any authentication

  /// delete user - remove auth and firebase account
}

class AppFirebaseException implements Exception {
  final String code;

  AppFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'unavailable':
        return 'The server is currently unavailable. Please try again later.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is malformed.';
      default:
        return 'A Firebase error occurred. Please try again.';
    }
  }
}

class AppFormatException implements Exception {
  const AppFormatException();

  String get message => 'Invalid data format.';
}

class AppPlatformException implements Exception {
  final String code;

  AppPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return 'Network error. Please check your internet connection.';
      case 'device_not_supported':
        return 'This feature is not supported on your device.';
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}

class AppFirebaseAuthException implements Exception {
  final String code;

  AppFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-credential':
        return 'The supplied auth credential is incorrect or expired.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password provided.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      default:
        return 'An authentication error occurred. Please try again.';
    }
  }
}
