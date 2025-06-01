import 'package:admin/features/shop/screens/category/create_category/responsive_screens/create_category_desktop.dart';
import 'package:admin/features/shop/screens/category/create_category/responsive_screens/create_category_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';
import 'responsive_screens/create_category_tablet.dart';

class CreateCategoriesScreen extends StatelessWidget {
  const CreateCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: CreateCategoryDesktopScreen(),
      tablet: CreateCategoryTabletScreen(),
      mobile: CreateCategoryMobileScreen(),
    );
  }
}
