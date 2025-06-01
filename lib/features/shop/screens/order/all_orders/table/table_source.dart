import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../authentication/models/orders_model.dart';

class OrdersRows extends DataTableSource {
  final List<OrderModel> orders;
  final BuildContext context;

  OrdersRows(this.orders, this.context);

  @override
  DataRow getRow(int index) {
    final order = orders[index];
    final formatter = DateFormat('dd/MM/yyyy');

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(order.id)),
        DataCell(Text(order.customerName)),
        DataCell(Text('${order.totalPrice} đ')),
        DataCell(Text(order.status)),
        DataCell(Text(formatter.format(order.createdAt))),
        DataCell(
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (newStatus) async {
              try {
                await FirebaseFirestore.instance
                    .collection('Orders')
                    .doc(order.id)
                    .update({'status': newStatus});

                order.status = newStatus;
                notifyListeners();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Update Status: "$newStatus"')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'pending', child: Text('pending')),
              PopupMenuItem(value: 'processing', child: Text('processing')),
              PopupMenuItem(value: 'shipped', child: Text('shipped')),
              PopupMenuItem(value: 'delivered', child: Text('delivered')),
              PopupMenuItem(value: 'cancelled', child: Text('cancelled')),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orders.length;

  @override
  int get selectedRowCount => 0;
}
