import 'package:abu_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import 'features/authentication/screens/onboarding/onboarding.dart';

/// use this class to setup themes , bindings , animations...

class Abu extends StatelessWidget {
  const Abu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Change MaterialApp to GetMaterialApp
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AbuAppTheme.lightTheme,
      darkTheme: AbuAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
