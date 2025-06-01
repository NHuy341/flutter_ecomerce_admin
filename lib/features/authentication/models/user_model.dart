import 'package:admin/utils/constants/enums.dart';
import 'package:admin/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;          // đổi userName -> username (đồng bộ Firestore)
  String email;
  String phoneNumber;
  String avatarUrl;         // đổi profilePicture -> avatarUrl (đồng bộ Firestore)
  AppRole role;
  bool isBanned;            // thêm field isBanned
  int loyaltyPoints;        // thêm field loyaltyPoints
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    required this.email,
    this.phoneNumber = '',
    this.avatarUrl = '',
    this.role = AppRole.user,
    this.isBanned = false,
    this.loyaltyPoints = 0,
    this.createdAt,
    this.updatedAt,
  });

  /// Helper methods
  String get fullName => '$firstName $lastName';
  String get formattedDate => TFormatter.formatDate(createdAt);
  String get formattedUpdatedAtDate => TFormatter.formatDate(updatedAt);
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(email: '');

    /// Static function to split full name into first and last name.
  static List<String> nameParts(String fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name.
  static String generateusername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseusername =
        "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseusername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  // To JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
      'role': role.name,
      'isBanned': isBanned,
      'loyaltyPoints': loyaltyPoints,
      'createdAt': createdAt,
      'updatedAt': updatedAt ?? DateTime.now(),
    };
  }

  // From Firestore snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        avatarUrl: data['avatarUrl'] ?? '',
        role: data['role'] == AppRole.admin.name ? AppRole.admin : AppRole.user,
        isBanned: data['isBanned'] ?? false,
        loyaltyPoints: data['loyaltyPoints'] ?? 0,
        createdAt: data['createdAt']?.toDate(),
        updatedAt: data['updatedAt']?.toDate(),
      );
    } else {
      return empty();
    }
  }
}