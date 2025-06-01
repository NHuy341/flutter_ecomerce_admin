import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final DocumentReference categoryRef;
  final DocumentReference brandRef;
  final String name;
  final String description;
  final bool isFeatured;
  final String status;
  final List<String> imagesUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.categoryRef,
    required this.brandRef,
    required this.name,
    required this.description,
    required this.status,
    required this.isFeatured,
    required this.imagesUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  static ProductModel empty() {
    final fakeRef = FirebaseFirestore.instance.collection('fake').doc('none');
    return ProductModel(
      id: '',
      categoryRef: fakeRef,
      brandRef: fakeRef,
      name: '',
      description: '',
      status: '',
      isFeatured: false,
      imagesUrl: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data == null) return ProductModel.empty();

    return ProductModel(
      id: doc.id,
      categoryRef: data['idCategory'] as DocumentReference,
      brandRef: data['idBrand'] as DocumentReference,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      status: data['status'] ?? '',
      imagesUrl: List<String>.from(data['imagesUrl'] ?? []),
      createdAt: data['createdAt'] is Timestamp
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: data['updatedAt'] is Timestamp
          ? (data['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> doc) {
    final data = doc.data() as Map<String, dynamic>;
    if (data.isEmpty) return ProductModel.empty();

    return ProductModel(
      id: doc.id,
      categoryRef: data['idCategory'] as DocumentReference,
      brandRef: data['idBrand'] as DocumentReference,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      status: data['status'] ?? '',
      imagesUrl: List<String>.from(data['imagesUrl'] ?? []),
      createdAt: data['createdAt'] is Timestamp
          ? (data['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: data['updatedAt'] is Timestamp
          ? (data['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCategory': categoryRef,
      'idBrand': brandRef,
      'name': name,
      'description': description,
      'isFeatured': isFeatured,
      'status': status,
      'imagesUrl': imagesUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
