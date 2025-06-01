import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String customerName;
  final List<Map<String, dynamic>> items;
  final String payMethod;
  final int totalPrice;
  String status;
  final DateTime createdAt;
  final Map<String, dynamic> shippingInfo;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.items,
    required this.payMethod,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    required this.shippingInfo,
  });

  factory OrderModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final shippingInfo = data['shippingInfo'] ?? {};

    return OrderModel(
      id: doc.id,
      customerName: shippingInfo['name'] ?? 'Unknown',
      items: List<Map<String, dynamic>>.from(data['items'] ?? []),
      payMethod: data['payMethod'] ?? '',
      totalPrice: data['totalPrice'] ?? 0,
      status: data['status'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      shippingInfo: Map<String, dynamic>.from(data['shippingInfo'] ?? {}),
    );
  }
}