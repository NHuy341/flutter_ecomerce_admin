import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/features/shop/screens/product/all_products/responsive_screens/products_desktop.dart';
import 'package:admin/features/shop/screens/product/all_products/responsive_screens/products_mobile.dart';
import 'package:admin/features/shop/screens/product/all_products/responsive_screens/products_tablet.dart';
import 'package:flutter/widgets.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: ProductsDesktopScreen(),
      tablet: ProductsTabletScreen(),
      mobile: ProductsMobileScreen(),
    );
  }
}
