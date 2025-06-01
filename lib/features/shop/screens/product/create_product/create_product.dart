import 'package:admin/features/shop/screens/product/create_product/responsive_screens/create_products_desktop.dart';
import 'package:admin/features/shop/screens/product/create_product/responsive_screens/create_products_mobile.dart';
import 'package:admin/features/shop/screens/product/create_product/responsive_screens/create_products_tablet.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: CreateProductsDesktopScreen(),
      tablet: CreateProductsTabletScreen(),
      mobile: CreateProductsMobileScreen(),
    );
  }
}
