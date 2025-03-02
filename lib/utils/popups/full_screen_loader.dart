import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class AppFullScreenLoader {
  /// Open a full-screen loading dialog with a given text.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  /// - text: The text to be displayed in the loading dialog.
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder:
          (_) => PopScope(
            canPop: false, // Disable popping with the back button
            child: Container(
              color:
                  AppHelperFunctions.isDarkMode(Get.context!)
                      ? AppColors.dark
                      : AppColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(), // Replaced animation with a loader
                  const SizedBox(height: 20),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          AppHelperFunctions.isDarkMode(Get.context!)
                              ? AppColors.white
                              : AppColors.dark,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  /// Stop the currently open dialog.
  static stopLoading() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
