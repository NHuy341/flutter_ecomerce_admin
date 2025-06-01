import 'package:admin/features/shop/controllers/category/category_controller.dart';
import 'package:admin/features/shop/models/category_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/data_table/paginated_data_table.dart';
import 'table_source.dart';

class CaterogyTable extends StatelessWidget {
  const CaterogyTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      Text(controller.filteredItems.length.toString());
      Text(controller.selectedRows.length.toString());

      return TPaginatedDataTable(
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        minWidth: 700,
        columns: [
          DataColumn2(
              label: const Text('Category'),
              onSort: (columnIndex, ascending) =>
                  controller.sortByName(columnIndex, ascending)),
          DataColumn2(
              label: Text('Parent Category'),
              onSort: (columnIndex, ascending) =>
                  controller.sortByParentName(columnIndex, ascending)),
          DataColumn2(label: Text('Featured')),
          DataColumn2(label: Text('Date')),
          DataColumn2(label: Text('Action'), fixedWidth: 100),
        ],
        source: CategoryRows(),
      );
    });
  }
}
