import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/dashboard/responsive_screen/dashboard_desktop.dart';
import 'package:admin/dashboard/responsive_screen/dashboard_mobile.dart';
import 'package:admin/dashboard/responsive_screen/dashboard_tablet.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DashboardDesktopScreen(),
      tablet: DashboardTabletScreen(),
      mobile: DashboardMobileScreen(),
    );
  }
}
