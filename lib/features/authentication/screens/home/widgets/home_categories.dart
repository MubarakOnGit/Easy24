import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return AppVerticalImageText(
            image: AppImages.teaIcon,
            title: 'TEA',
            onTap: () {},
          );
        },
      ),
    );
  }
}
