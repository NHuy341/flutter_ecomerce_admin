import 'package:admin/app.dart';
import 'package:admin/common/widgets/responsive/responsive_design.dart';
import 'package:admin/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:admin/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:admin/common/widgets/responsive/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.userLayout = true,
  });

  /// Widget for desktop layout
  final Widget? desktop;

  /// Widget for tablet layout
  final Widget? tablet;

  /// Widget for mobile layout
  final Widget? mobile;

  final bool userLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TResponsiveWidget(
        //destop
        desktop: userLayout
            ? DesktopLayout(
                body: desktop,
              )
            : desktop ?? Container(),

        //tablet
        tablet: userLayout
            ? TabletLayout(
                body: tablet ?? desktop,
              )
            : tablet ?? desktop ?? Container(),

        //mobile
        mobile: userLayout
            ? MobileLayout(
                body: mobile ?? desktop,
              )
            : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
