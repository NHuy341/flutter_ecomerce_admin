import 'package:admin/features/shop/screens/customer/all_customers/table/data_source.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/data_table/paginated_data_table.dart';
import '../../../../controllers/customer/customer_controller.dart';

class CustomerTable extends StatelessWidget {
  final CustomerController controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.users.isEmpty) {
        return const Center(child: Text('No customers found'));
      }

      return TPaginatedDataTable(
        minWidth: 700,
        columns: const [
          DataColumn2(label: Text('Customer')),
          DataColumn2(label: Text('Email')),
          DataColumn2(label: Text('Phone Number')),
          DataColumn2(label: Text('Registered')),
          DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: CustomerRows(),
      );
    });
  }
}
