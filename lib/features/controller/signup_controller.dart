import 'package:abu_app/common/widgets/loaders/loaders.dart';
import 'package:abu_app/data/repositories_authentication/authentication_repository.dart';
import 'package:abu_app/data/repositories_authentication/user/user_repository.dart';
import 'package:abu_app/utils/constants/image_strings.dart';
import 'package:abu_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repositories_authentication/user/user_model.dart';
import '../../network_manager.dart';
import '../authentication/screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// signup
  void signup() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        //AppImages.processing,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      //  Privacy Policy Check
      if (!privacyPolicy.value) {
        AppLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'in order to create account, you must have to read and accept the Privacy Policy & Terms of Use. ',
        );
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save Authenticated user data in the Firebase Fire store
      final user = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(
        user,
      ); // Pass 'user' here instead of 'newUser'

      // remove loader
      AppFullScreenLoader.stopLoading();

      // Show Success Message
      AppLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify emil to continue',
      );
      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Show some Generic Error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
