import 'package:admin/common/widgets/layouts/templates/site_layout.dart';
import 'package:admin/features/authentication/screens/forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:admin/features/authentication/screens/forget_password/responsive_screens/forget_password_mobile.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      userLayout: false,
      desktop: ForgetPasswordScreenDesktopTablet(),
      mobile: ForgetPasswordScreenMobile(),
    );
  }
}
