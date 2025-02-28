import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppVerticalImageText extends StatelessWidget {
  const AppVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            /// circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ??
                    (AppHelperFunctions.isDarkMode(context)
                        ? AppColors.black
                        : AppColors.white), // White background in light mode
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors
                              .light // Light icon in dark mode
                          : AppColors.dark, // Dark icon in light mode
                ),
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            SizedBox(
              width: 56, // Set the width of the container to 55
              child: Center(
                child: Text(
                  title, // The text to display
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors
                                .dark // Light text in dark mode
                            : AppColors.light, // Dark text in light mode
                  ),
                  maxLines: 1, // Allow only one line for the text
                  overflow:
                      TextOverflow
                          .ellipsis, // Truncate the text with an ellipsis if it overflows
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
