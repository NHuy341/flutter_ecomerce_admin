import 'package:admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_desktop.dart';
import 'package:admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_mobile.dart';
import 'package:admin/features/shop/screens/customer/customer_detail/responsive_screens/customer_detail_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = Get.arguments;
    return TSiteTemplate(
      desktop: CustomerDetailDesktopScreen(customer: customer),
      tablet: CustomerDetailTabletScreen(customer: customer),
      mobile: CustomerDetailMobileScreen(customer: customer),
    );
  }
}
