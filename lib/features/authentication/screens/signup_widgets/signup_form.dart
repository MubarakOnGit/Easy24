import 'package:abu_app/features/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../signup/verify_email.dart';
import '../widgets/terms_conditions_checkbox.dart';

class AppSignupForm extends StatelessWidget {
  const AppSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// first , ast name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          AppValidator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          AppValidator.validateEmptyText('Last name', value),
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
            controller: controller.username,
            validator:
                (value) => AppValidator.validateEmptyText('Username', value),
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
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
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
            controller: controller.phoneNumber,
            validator: (value) => AppValidator.validatePhoneNumber(value),
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
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.lock,
                  color: Theme.of(context).hintColor,
                ),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.value =
                              !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
                labelText: AppTexts.password,
                labelStyle:
                    Theme.of(context).textTheme.bodyMedium, // Theme-aware style
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

          const SizedBox(height: AppSizes.spaceBtwInputFields),

          /// Terms & Conditions Checkbox
          const AppTermsAndConditionCheckbox(),
          const SizedBox(height: AppSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
