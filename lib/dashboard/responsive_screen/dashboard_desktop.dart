import 'package:admin/common/widgets/containers/rounded_container.dart';
import 'package:admin/dashboard/widgets/dashboard_cart.dart';
import 'package:admin/dashboard/widgets/order_status_graph.dart';
import 'package:admin/dashboard/widgets/weekly_sales.dart';
import 'package:admin/features/shop/table/data_table.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),

              const Row(
                children: [
                  Expanded(
                      child: TDashboardCard(
                          title: 'Sales total',
                          subTitle: '\$365.6',
                          stats: 25)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Average Order Value',
                          subTitle: '\$25',
                          stats: 15)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Total Orders', subTitle: '36', stats: 44)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                      child: TDashboardCard(
                          title: 'Visitors', subTitle: '25,035', stats: 2)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// graphs
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        /// Bar graph
                        TWeeklySalesGraph(),

                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// Orders section placeholder
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Recent Orders',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              const SizedBox(height: TSizes.spaceBtwSections),
                              const DashboardOrderTable()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: TSizes.spaceBtwSections),

                  /// Pie chart section placeholder
                  const Expanded(child: OrderStatusPieChart()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
