import 'package:admin/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuCotroller = Get.put(SidebarController());

    return InkWell(
      onTap: () => menuCotroller.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuCotroller.changeHoverItem(route)
          : menuCotroller.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuCotroller.isHovering(route) ||
                      menuCotroller.isActive(route)
                  ? TColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Icon
                Padding(
                  padding: EdgeInsets.only(
                    left: TSizes.lg,
                    top: TSizes.md,
                    bottom: TSizes.md,
                    right: TSizes.md,
                  ),
                  child: menuCotroller.isActive(route)
                      ? Icon(icon, size: 22, color: TColors.white)
                      : Icon(icon,
                          size: 22,
                          color: menuCotroller.isHovering(route)
                              ? TColors.white
                              : TColors.darkGrey),
                ),

                //Text
                if (menuCotroller.isHovering(route) ||
                    menuCotroller.isActive(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.darkerGrey),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
