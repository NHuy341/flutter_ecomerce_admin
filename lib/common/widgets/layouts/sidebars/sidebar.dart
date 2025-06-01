import 'package:admin/common/widgets/images/t_circular_image.dart';
import 'package:admin/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:admin/routes/routes.dart';
import 'package:admin/utils/constants/image_strings.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(right: BorderSide(color: TColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              TCircularImage(
                width: 100,
                height: 100,
                image: TImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),

                    //Menu Items
                    const TMenuItem(
                      route: TRoutes.dashboard,
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),
                    const TMenuItem(
                      route: TRoutes.categories,
                      icon: Iconsax.category_2,
                      itemName: 'Categories',
                    ),
                    const TMenuItem(
                      route: TRoutes.products,
                      icon: Iconsax.shopping_bag,
                      itemName: 'Products',
                    ),
                    const TMenuItem(
                      route: TRoutes.customers,
                      icon: Iconsax.profile_2user,
                      itemName: 'Customer',
                    ),
                    const TMenuItem(
                      route: TRoutes.orders,
                      icon: Iconsax.airplane,
                      itemName: 'Order',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
