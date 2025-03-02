import 'package:abu_app/bindings/general_bindings.dart';
import 'package:abu_app/utils/constants/colors.dart';
import 'package:abu_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import 'features/authentication/screens/onboarding/onboarding.dart';

/// use this class to setup themes , bindings , animations...

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Change MaterialApp to GetMaterialApp
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AbuAppTheme.lightTheme,
      darkTheme: AbuAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
