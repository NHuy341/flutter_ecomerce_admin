import 'package:admin/common/widgets/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

import '../../layouts/headers/header.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      appBar: THeader(scaffoldKey: scaffoldKey),
      body: body ?? Container(),
    );
  }
}
