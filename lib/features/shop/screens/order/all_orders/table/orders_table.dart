import 'package:admin/features/shop/screens/order/all_orders/table/table_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../authentication/models/orders_model.dart';

class OrdersTable extends StatefulWidget {
  const OrdersTable({super.key});

  @override
  State<OrdersTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<OrdersTable> {
  List<OrderModel> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Orders')
        .orderBy('createdAt', descending: true)
        .get();

    final orders = snapshot.docs
        .map((doc) => OrderModel.fromDocumentSnapshot(doc))
        .toList();

    setState(() {
      _orders = orders;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return PaginatedDataTable2(
      columns: const [
        DataColumn(label: Text('Order ID')),
        DataColumn(label: Text('Customer')),
        DataColumn(label: Text('Total')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Update Status')),
      ],
      source: OrdersRows(_orders, context),
      columnSpacing: 12,
      horizontalMargin: 12,
      rowsPerPage: 5,
      showCheckboxColumn: false,
    );
  }
}
