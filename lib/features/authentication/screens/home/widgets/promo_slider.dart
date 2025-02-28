import 'package:abu_app/features/controller/home_controller.dart';
import 'package:abu_app/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/app_rounded_image.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            autoPlay: true, // Enables automatic sliding
            autoPlayInterval: Duration(
              seconds: 3,
            ), // Adjust time between slides
            autoPlayAnimationDuration: Duration(
              milliseconds: 1000,
            ), // Smooth transition
            autoPlayCurve: Curves.easeInOut, // Animation effect
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => AppRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  AppCircularContainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor:
                        controller.carousalCurrentIndex.value == i
                            ? AppColors.primary
                            : Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
