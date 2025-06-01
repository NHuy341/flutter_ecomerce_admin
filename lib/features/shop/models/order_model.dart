import 'package:admin/utils/constants/enums.dart';
import 'package:admin/utils/helpers/helper_functions.dart';

import 'package:flutter/foundation.dart';

class OrderModel {
  final String id;
  final String userId;
  final String docId;
  final OrderStatus status;
  final int totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final DateTime? deliveryDate;

  OrderModel({
    required this.id,
    this.userId = '',
    this.docId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null
      ? THelperFunctions.getFormattedDate(deliveryDate!)
      : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  /// Static function to create an empty order model.
  static OrderModel empty() => OrderModel(
        id: '',
        orderDate: DateTime.now(),
        status: OrderStatus.pending,
        totalAmount: 0,
      );

  // Chuyển object thành Map để gửi lên server hoặc lưu trữ
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'docId': docId,
      'status': describeEnum(status),
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'paymentMethod': paymentMethod,
      'deliveryDate': deliveryDate?.toIso8601String(),
    };
  }
}
