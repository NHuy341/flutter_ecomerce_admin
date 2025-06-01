import 'package:flutter/material.dart';

import '../../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../category/all_categories/widgets/table_header.dart';
import '../table/data_source.dart';
import '../table/data_table.dart';

class CustomerDesktopScreen extends StatelessWidget {
  const CustomerDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              const TBreadcrumbWithHeading(
                  heading: 'Customers', breadcrumbItems: ['Customers']),
              const SizedBox(height: TSizes.spaceBtwSections),

              TRoundedContainer(
                child: Column(
                  children: [
                    // Table Header
                    const TTableHeader(
                      buttonText: 'Add',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Table
                    CustomerTable(),
                  ],
                ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}
