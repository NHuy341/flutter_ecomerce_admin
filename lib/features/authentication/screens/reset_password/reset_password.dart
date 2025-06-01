import 'package:admin/features/authentication/screens/reset_password/responsive_screens/reset_password_desktop_tablet.dart';
import 'package:admin/features/authentication/screens/reset_password/responsive_screens/reset_password_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import '../forget_password/responsive_screens/forget_password_mobile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      userLayout: false,
      desktop: ResetPasswordScreenDesktopTablet(),
      mobile: ResetPasswordScreenMobile(),
    );
  }
}
