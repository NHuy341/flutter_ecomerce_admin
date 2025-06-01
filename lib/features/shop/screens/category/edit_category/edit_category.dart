import 'package:admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_desktop.dart';
import 'package:admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_mobile.dart';
import 'package:admin/features/shop/screens/category/edit_category/responsive_screens/edit_category_tablet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../models/category_model.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;

    // Kiểm tra category.id có hợp lệ không
    if (category == null || category.id.isEmpty) {
      Get.snackbar('Error', 'Category ID is invalid or missing');
      return const SizedBox();
    }

    return TSiteTemplate(
      desktop: EditCategoryDesktopScreen(category: category),
      tablet: EditCategoryTabletScreen(category: category),
      mobile: EditCategoryMobileScreen(category: category),
    );
  }
}
