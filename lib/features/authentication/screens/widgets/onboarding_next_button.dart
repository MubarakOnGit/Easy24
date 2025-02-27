import 'package:abu_app/features/authentication/controllers_onboarding/onboarding.controllers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        child: Icon(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? Colors
                      .white // Opposite for light theme
                  : Colors.black, // Opposite for dark theme
          Iconsax.arrow_right_3,
          size: 25,
        ),
      ),
    );
  }
}
