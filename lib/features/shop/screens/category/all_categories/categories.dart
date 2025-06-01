import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/features/shop/screens/category/all_categories/responsive_screens/categories_desktop.dart';
import 'package:admin/features/shop/screens/category/all_categories/responsive_screens/categories_mobile.dart';
import 'package:admin/features/shop/screens/category/all_categories/responsive_screens/categories_tablet.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: CategoriesDesktopScreens(),
      tablet: CategoriesTabletScreens(),
      mobile: CategoriesMobileScreens(),
    );
  }
}
