import 'package:abu_app/common/styles/spacing_styles.dart';
import 'package:abu_app/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:abu_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:abu_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:abu_app/common/widgets_login_signup/social_buttons.dart';
import 'package:abu_app/utils/constants/text_strings.dart';
import 'package:abu_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight,
          child: AppLoginScreen(dark: dark),
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}

class AppLoginScreen extends StatelessWidget {
  const AppLoginScreen({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// logo , title , sub title
        AppLoginHeader(dark: dark),

        /// form
        AppLoginForm(),

        /// divider
        AppFromDivider(dividerText: AppTexts.orSignInWith.capitalize!),
        //const SizedBox(width: 200),
        Divider(color: Colors.transparent, thickness: 2),

        /// footer
        AppSocialButtons(),
      ],
    );
  }
}
