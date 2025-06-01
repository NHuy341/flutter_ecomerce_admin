import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/data_table/paginated_data_table.dart';
import '../../../../../../utils/device/device_utility.dart';
import 'table_source.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key});

  Future<ProductsRows> loadProducts() async {
    final rows = ProductsRows();
    await rows.fetchProducts(); // Đảm bảo dữ liệu được load trước
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductsRows>(
      future: loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final source = snapshot.data!;
          return TPaginatedDataTable(
            minWidth: 1000,
            columns: [
              DataColumn2(
                label: const Text('Product'),
                fixedWidth: !TDeviceUtils.isDesktopScreen(context) ? 300 : 400,
              ),
              const DataColumn2(label: Text('ID')),
              const DataColumn2(label: Text('Brand')),
              const DataColumn2(label: Text('Date')),
              const DataColumn2(label: Text('Action'), fixedWidth: 100),
            ],
            source: source,
          );
        }
      },
    );
  }
}
