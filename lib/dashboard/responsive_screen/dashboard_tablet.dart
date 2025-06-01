import 'package:admin/common/widgets/containers/rounded_container.dart';
import 'package:admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:admin/dashboard/widgets/dashboard_cart.dart';
import 'package:admin/dashboard/widgets/order_status_graph.dart';
import 'package:admin/dashboard/widgets/weekly_sales.dart';
import 'package:admin/utils/constants/colors.dart';
import 'package:admin/utils/constants/sizes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:admin/features/shop/table/data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),

              const Row(
                children: [
                  Expanded(child: TDashboardCard(title: 'Sales total', subTitle: '\$365.6', stats: 25)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(child: TDashboardCard(title: 'Average Order Value', subTitle: '\$25', stats: 15)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const Row(
                children: [
                  Expanded(child: TDashboardCard(title: 'Total Orders', subTitle: '36', stats: 44)),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(child: TDashboardCard(title: 'Visitors', subTitle: '25,035', stats: 2)),
                ],
              ),
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
  // @override
  // Widget build(BuildContext context) {
  //   final DashboardController controller = Get.put(DashboardController());

  //   return Scaffold(
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.all(30),
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               controller: controller.searchTextController,
  //               onChanged: (query) => controller.searchQuery(query),
  //               decoration: const InputDecoration(
  //                 hintText: 'Search',
  //                 prefix: Icon(Iconsax.search_normal),
  //               ),
  //             ),
  //             const SizedBox(height: TSizes.spaceBtwSections),

  //             // Expanded giúp phần bảng co giãn hợp lý trong màn hình
  //             Expanded(
  //               child: Obx(() {
  //                 return TPaginatedDataTable(
  //                   // Sort
  //                   sortAscending: controller.sortAscending.value,
  //                   sortColumnIndex: controller.sortColumnIndex.value,

  //                   columns: [
  //                     DataColumn2(label: Text('Column 1')),
  //                     DataColumn(
  //                       label: const Text('Column 2'),
  //                       onSort: (columnIndex, ascending) =>
  //                           controller.sortById(columnIndex, ascending),
  //                     ),
  //                     DataColumn(label: Text('Column 3')),
  //                     DataColumn(
  //                       label: Text('Column 4'),
  //                       onSort: (columnIndex, ascending) =>
  //                           controller.sortById(columnIndex, ascending),
  //                     ),
  //                   ],
  //                   source: MyData(),
  //                 );
  //               }),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}


// class MyData extends DataTableSource {
//   final DashboardController controller = Get.find();

//   @override
//   DataRow? getRow(int index) {
//     final data = controller.filteredDataList[index];
//     final rowId = data['Column1'] ?? ''; // giả sử duy nhất

//     return DataRow2(
//       selected: controller.selectedRowIds.contains(rowId),
//       onSelectChanged: (value) {
//         if (value == true) {
//           controller.selectedRowIds.add(rowId);
//         } else {
//           controller.selectedRowIds.remove(rowId);
//         }
//         notifyListeners();
//       },
//       cells: [
//         DataCell(Text(data['Column1'] ?? '')),
//         DataCell(Text(data['Column2'] ?? '')),
//         DataCell(Text(data['Column3'] ?? '')),
//         DataCell(Text(data['Column4'] ?? '')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => controller.filteredDataList.length;

//   @override
//   int get selectedRowCount => controller.selectedRowIds.length;
// }



// class DashboardController extends GetxController {
//   var dataList = <Map<String, String>>[].obs;
//   var filteredDataList = <Map<String, String>>[].obs;
//   RxSet<String> selectedRowIds = <String>{}.obs;

//   final sortColumnIndex = 1.obs;
//   RxBool sortAscending = true.obs;

//   final searchTextController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchDummyData();
//   }

//   void sortById(int sortColumnIndex, bool ascending) {
//     sortAscending.value = ascending;
//     filteredDataList.sort((a, b) {
//       String valA = a['Column1']?.toLowerCase() ?? '';
//       String valB = b['Column1']?.toLowerCase() ?? '';
//       return ascending ? valA.compareTo(valB) : valB.compareTo(valA);
//     });
//     this.sortColumnIndex.value = sortColumnIndex;
//   }

//   void searchQuery(String query) {
//     final filtered = dataList
//         .where((item) =>
//             item['Column1']!.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     filteredDataList.assignAll(filtered);
//     // Không cần reset selectedRowIds nếu muốn giữ trạng thái khi lọc
//   }

//   void fetchDummyData() {
//     dataList.clear();
//     filteredDataList.clear();
//     selectedRowIds.clear();

//     final dummy = List.generate(
//       36,
//       (index) => {
//         'Column1': 'Data ${index + 1} - 1', // giá trị duy nhất
//         'Column2': 'Data ${index + 1} - 2',
//         'Column3': 'Data ${index + 1} - 3',
//         'Column4': 'Data ${index + 1} - 4',
//       },
//     );

//     dataList.assignAll(dummy);
//     filteredDataList.assignAll(dummy);
//   }
// }

