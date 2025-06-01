import 'package:admin/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String imageUrl;
  String parentCate;
  bool isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.parentCate,
    required this.isFeatured,
    this.createdAt,
    this.updatedAt,
  });

  String get formattedDate => TFormatter.formatDate(createdAt);
  String get formattedUpdateDate => TFormatter.formatDate(createdAt);

  /// Empty helper
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        imageUrl: '',
        parentCate: '',
        isFeatured: false,
      );

  /// From Firestore
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() != null) {
      final data = doc.data()!;
      final parentCateField = data['parentCate'];

      String parentCateValue = '';
      if (parentCateField is DocumentReference) {
        parentCateValue = parentCateField.id;
      } else if (parentCateField is String) {
        parentCateValue = parentCateField;
      }

      return CategoryModel(
        id: doc.id,
        name: data['name'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        parentCate: parentCateValue,
        isFeatured: data['isFeatured'] ?? false,
        createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
        updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
      );
    } else {
      return CategoryModel.empty();
    }
  }

  /// To JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'parentCate': parentCate,
      'isFeatured': isFeatured,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  CategoryModel copyWith({
    String? name,
    String? imageUrl,
    String? parentCate,
    bool? isFeatured,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      parentCate: parentCate ?? this.parentCate,
      isFeatured: isFeatured ?? this.isFeatured,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
