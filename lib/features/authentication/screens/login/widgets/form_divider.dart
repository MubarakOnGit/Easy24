import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/text_strings.dart';

class AppFromDivider extends StatelessWidget {
  const AppFromDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          //AppTexts.orSignInWith.capitalize!,
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
