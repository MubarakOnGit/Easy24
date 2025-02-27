import 'package:abu_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:abu_app/features/authentication/screens/signup_widgets/signup.dart';
import 'package:abu_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections,
        ),

        child: Column(
          children: [
            ///email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.profile_circle,
                  color:
                      Theme.of(
                        context,
                      ).hintColor, // Keep the hint color for the icon
                ),
                labelText: AppTexts.email,
                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(
                        context,
                      ).hintColor, // Label color when not focused
                ),
                floatingLabelStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(
                        context,
                      ).primaryColor, // Label color when focused
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.security_safe,
                  color: Theme.of(context).hintColor,
                ),
                labelText: AppTexts.password,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                suffixIcon: Icon(Iconsax.eye_slash), // Theme-aware style
                floatingLabelStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(
                        context,
                      ).primaryColor, // Label color when focused
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),

            /// remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(
                      AppTexts.rememberMe,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                /// forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(AppTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            ///sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: Text(AppTexts.signIn),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            /// create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color:
                        Theme.of(context).hintColor, // Theme-aware border color
                  ),
                ),
                child: Text(
                  AppTexts.createAccount,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
