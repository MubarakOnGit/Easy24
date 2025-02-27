import 'package:abu_app/common/widgets_login_signup/social_buttons.dart';
import 'package:abu_app/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:abu_app/features/authentication/screens/signup_widgets/signup_form.dart';
import 'package:abu_app/utils/constants/colors.dart';
import 'package:abu_app/utils/constants/sizes.dart';
import 'package:abu_app/utils/constants/text_strings.dart';
import 'package:abu_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color, // Theme-aware icon color
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                AppTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              const SizedBox(height: AppSizes.spaceBtwInputFields),

              /// Form
              AppSignupForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Divider
              AppFromDivider(dividerText: AppTexts.orSignInWith.capitalize!),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// Social Buttons
              const AppSocialButtons(),
              const SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
