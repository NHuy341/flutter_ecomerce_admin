import 'package:admin/common/widgets/containers/rounded_container.dart';
import 'package:admin/dashboard/widgets/dashboard_cart.dart';
import 'package:admin/dashboard/widgets/order_status_graph.dart';
import 'package:admin/dashboard/widgets/weekly_sales.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:admin/features/shop/table/data_table.dart';
import 'package:flutter/material.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),

              const TDashboardCard(title: 'Sales total', subTitle: '\$365.6', stats: 25),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TDashboardCard(title: 'Average Order Value', subTitle: '\$25', stats: 15),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TDashboardCard(title: 'Total Orders', subTitle: '36', stats: 44),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TDashboardCard(title: 'Visitors', subTitle: '25,035', stats: 2),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// graphs
              const TWeeklySalesGraph(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Orders section placeholder
              TRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent Orders', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const DashboardOrderTable()
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Pie chart section placeholder
              const OrderStatusPieChart(),
            ],
          ),
        ),
      ),
    );
  }
}
