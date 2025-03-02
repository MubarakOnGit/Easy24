import 'package:abu_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:abu_app/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:abu_app/utils/constants/colors.dart';
import 'package:abu_app/utils/constants/image_strings.dart';
import 'package:abu_app/utils/constants/sizes.dart';
import 'package:abu_app/utils/device/device_utility.dart';
import 'package:abu_app/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/app_rounded_image.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import 'home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100), // Shadow color with opacity
            spreadRadius: 4, // How much the shadow spreads
            blurRadius: 8, // The blur effect of the shadow
            offset: Offset(2, 5), // Horizontal and vertical offset
          ),
        ],
      ),
      drawer: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        color: Colors.white,
        child: ListTileTheme(
          textColor: Colors.black,
          iconColor: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 100),
              ListTile(
                onTap: () {
                  _advancedDrawerController
                      .hideDrawer(); // Close the drawer with animation
                  // Optionally, navigate to HomeScreen if needed
                  // For example:
                  // Get.to(HomeScreen());  // Go to HomeScreen (optional)
                },
                leading: Icon(Icons.double_arrow_rounded),
                title: Text("ABU'S TEA SHOP"),
              ),

              ListTile(
                onTap: () {
                  Get.off(
                    () => NewScreen(
                      advancedDrawerController: _advancedDrawerController,
                    ),
                  );
                },
                leading: Icon(Icons.double_arrow_rounded),
                title: Text('EAZY MEALS'),
              ),

              ListTile(
                onTap: () {},
                leading: Icon(Icons.double_arrow_rounded),
                title: Text('EAZY MART'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.double_arrow_rounded),
                title: Text('EAZY MOTORS'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.double_arrow_rounded),
                title: Text('SETTINGS'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.double_arrow_rounded),
                title: Text('LOGOUT'),
              ),

              Spacer(),
              DefaultTextStyle(
                style: TextStyle(fontSize: 12, color: Colors.grey),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Powerd by EAZY24'),
                ),
              ),
            ],
          ),
        ),
      ),

      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header - Tutorial (Section #3, Video #2)
              AppPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// appbar
                    AppHomeAppBar(ontap: handleMenuButtonPressed, ishome: true),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// searchbar
                    AppSearchContainer(text: 'Search in Shop'),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// category text.
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.defaultSpace),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall!.copyWith(
                                  color:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColors
                                              .dark // Light color in dark mode
                                          : AppColors
                                              .light, // Dark color in light mode
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSizes.spaceBtwItems),

                          /// categories
                          AppHomeCategories(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// body
              Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  children: [
                    /// promo slider
                    AppPromoSlider(
                      banners: [
                        AppImages.banner1,
                        AppImages.banner2,
                        AppImages.banner3,
                      ],
                    ),

                    /// popular products
                    //AppProductCardVertical(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class NewScreen extends StatelessWidget {
  final AdvancedDrawerController advancedDrawerController;

  // ✅ Add the required parameter for the drawer controller
  const NewScreen({super.key, required this.advancedDrawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: const Text('New Screen'),
        ishome: true, // Show the menu icon
        leadingOnPressed: () {
          advancedDrawerController.showDrawer(); // Open drawer
        },
      ),
      body: const Center(child: Text('Welcome to New Screen!')),
    );
  }
}
