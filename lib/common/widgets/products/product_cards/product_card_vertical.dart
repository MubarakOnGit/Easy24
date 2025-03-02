import 'package:abu_app/utils/constants/colors.dart';
import 'package:abu_app/utils/constants/sizes.dart';
import 'package:abu_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../styles/shadows.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [AppShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color:
            AppHelperFunctions.isDarkMode(context)
                ? AppColors.darkGrey
                : AppColors.white,
      ),
    );
  }
}
