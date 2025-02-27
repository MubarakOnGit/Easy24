import 'package:abu_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:abu_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true, // Automatically add a back button
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Use a back arrow icon
            color: Theme.of(context).iconTheme.color, // Theme-aware icon color
          ),
          onPressed: () => Get.back(), // Navigate back
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// heading , description
            Text(
              AppTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              AppTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: AppSizes.spaceBtwSections * 1.5),

            /// Text field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.profile_circle,
                  color: Theme.of(context).hintColor,
                ),
                labelText: AppTexts.email,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
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
            const SizedBox(height: AppSizes.spaceBtwSections),

            /// submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
                child: Text(AppTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
