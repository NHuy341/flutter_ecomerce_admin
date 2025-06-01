import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/features/shop/screens/order/all_orders/responsive_screens/orders_desktop.dart';
import 'package:admin/features/shop/screens/order/all_orders/responsive_screens/orders_mobile.dart';
import 'package:admin/features/shop/screens/order/all_orders/responsive_screens/orders_tablet.dart';
import 'package:flutter/widgets.dart';


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: OrdersDesktopScreen(),
      tablet: OrdersTabletScreen(),
      mobile: OrdersMobileScreen(),
    );
  }
}
