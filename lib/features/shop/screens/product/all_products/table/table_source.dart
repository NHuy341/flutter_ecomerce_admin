import 'package:admin/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../models/product_model.dart';
import 'package:admin/common/widgets/icons/table_action_icon_buttons.dart';

class ProductsRows extends DataTableSource {
  final List<ProductModel> products = [];

  ProductsRows() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Products').get();
    products.clear();
    for (var doc in snapshot.docs) {
      products.add(ProductModel.fromQuerySnapshot(doc));
    }
    notifyListeners(); // Cập nhật lại UI
  }

  Future<void> deleteProduct(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection('Products')
          .doc(product.id)
          .delete();

      products.remove(product); // Cập nhật danh sách
      notifyListeners(); // Cập nhật UI
      Get.snackbar("Xóa thành công", "Sản phẩm đã được xóa",
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể xóa sản phẩm: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  DataRow? getRow(int index) {
    if (index >= products.length) return null;

    final product = products[index];

    return DataRow2(
      cells: [
        // Product name (không có ảnh nữa)
        DataCell(
          Text(
            product.name,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.primary),
          ),
        ),

        // Số lượng hoặc ID
        DataCell(Text(product.id)),

        // Brand
        DataCell(
          FutureBuilder<DocumentSnapshot>(
            future: product.brandRef.get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Loading...');
              } else if (snapshot.hasError || !snapshot.hasData) {
                return const Text('Unknown');
              } else {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  data['name'] ?? 'No Name',
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.primary),
                );
              }
            },
          ),
        ),

        // Date
        DataCell(Text(product.createdAt.toLocal().toString().split(' ')[0])),

        // Action Buttons
        DataCell(
          TTableActionButtons(
            onEditPressed: () =>
                Get.to(TRoutes.editProduct, arguments: product),
            onDeletePressed: () => deleteProduct(product),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
