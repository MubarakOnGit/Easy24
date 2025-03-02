import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class AppShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withAlpha(50),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  ); // BoxShadow

  static final horizontalProductShadow = BoxShadow(
    color: AppColors.darkGrey.withAlpha(50),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  ); // BoxShadow
}
