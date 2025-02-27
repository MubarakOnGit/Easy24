import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../signup/verify_email.dart';
import '../widgets/terms_conditions_checkbox.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: Theme.of(context).hintColor,
                    ),
                    labelText: AppTexts.firstName,
                    labelStyle:
                        Theme.of(
                          context,
                        ).textTheme.bodyMedium, // Theme-aware style
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
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: Theme.of(context).hintColor,
                    ),
                    labelText: AppTexts.lastName,
                    labelStyle:
                        Theme.of(
                          context,
                        ).textTheme.bodyMedium, // Theme-aware style
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
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Iconsax.direct,
                color: Theme.of(context).hintColor,
              ),
              labelText: AppTexts.username,
              labelStyle:
                  Theme.of(context).textTheme.bodyMedium, // Theme-aware style
              floatingLabelStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color:
                    Theme.of(context).primaryColor, // Label color when focused
              ),
            ),
          ),

          /// Email
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Iconsax.profile_circle,
                color: Theme.of(context).hintColor,
              ),
              labelText: AppTexts.email,
              labelStyle:
                  Theme.of(context).textTheme.bodyMedium, // Theme-aware style
              floatingLabelStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color:
                    Theme.of(context).primaryColor, // Label color when focused
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Iconsax.call,
                color: Theme.of(context).hintColor,
              ),
              labelText: AppTexts.phoneNo,
              labelStyle:
                  Theme.of(context).textTheme.bodyMedium, // Theme-aware style
              floatingLabelStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color:
                    Theme.of(context).primaryColor, // Label color when focused
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Iconsax.lock,
                color: Theme.of(context).hintColor,
              ),
              labelText: AppTexts.password,
              labelStyle:
                  Theme.of(context).textTheme.bodyMedium, // Theme-aware style
              floatingLabelStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color:
                    Theme.of(context).primaryColor, // Label color when focused
              ),
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox
          const AppTermsAndConditionCheckbox(),
          const SizedBox(height: AppSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
