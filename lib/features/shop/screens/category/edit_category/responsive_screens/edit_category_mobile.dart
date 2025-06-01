import 'package:admin/features/shop/screens/category/edit_category/widgets/edit_category_form.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/category_model.dart';

class EditCategoryMobileScreen extends StatelessWidget {
  const EditCategoryMobileScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Category'),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs (optional trên mobile có thể không dùng hoặc làm đơn giản hơn)
            const TBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              heading: 'Update Category',
              breadcrumbItems: [TRoutes.categories, 'Update Category'],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Form
            EditCategoryForm(category: category),
          ],
        ),
      ),
    );
  }
}
