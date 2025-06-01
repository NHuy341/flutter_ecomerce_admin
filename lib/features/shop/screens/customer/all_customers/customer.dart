import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/features/shop/screens/customer/all_customers/responsive_screens/customer_desktop.dart';
import 'package:admin/features/shop/screens/customer/all_customers/responsive_screens/customer_mobile.dart';
import 'package:admin/features/shop/screens/customer/all_customers/responsive_screens/customer_tablet.dart';
import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: CustomerDesktopScreen(),
      tablet: CustomerTabletScreen(),
      mobile: CustomerMobileScreen(),
    );
  }
}
