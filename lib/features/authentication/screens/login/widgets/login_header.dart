import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginHeader extends StatelessWidget {
  const AppLoginHeader({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.all(AppSizes.defaultSpace),
      padding: const EdgeInsets.only(right: 125.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Image(
          //  height: 150,
          // image: AssetImage(
          //   dark ? AppImages.darkAppLogo : AppImages.darkAppLogo,
          //  ),
          // ),
          const SizedBox(height: 150),
          Text(
            'Login to your account',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          //const SizedBox(height: 1),
          //Text(
          //AppTexts.loginSubTitle,
          //style: Theme.of(context).textTheme.bodyMedium,
          //),
        ],
      ),
    );
  }
}
