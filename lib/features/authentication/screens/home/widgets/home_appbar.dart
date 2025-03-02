import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/products_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppHomeAppBar extends StatelessWidget {
  bool ishome;
  VoidCallback? ontap;
  AppHomeAppBar({super.key, required this.ishome, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      ishome: ishome,
      leadingOnPressed: ontap,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.grey),
          ),
        ],
      ),
      actions: [
        AppCartCounterIcon(onPressed: () {}, iconColor: AppColors.white),
      ],
    );
  }
}
