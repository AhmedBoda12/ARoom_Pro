import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? country;
  final String? phoneNumber;
  final String? address;
  final String? isbanned;
  final String? role;
  final String? profilePictureUrl;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    this.fullName,
    required this.email,
    this.country,
    this.phoneNumber,
    this.address,
    this.isbanned,
    required this.role,
    this.profilePictureUrl,
    this.createdAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      fullName: doc['name'],
      email: doc['email'],
      country: doc['country'],
      phoneNumber: doc['phoneNumber'],
      address: doc['address'],
      isbanned: doc['isbanned'],
      role: doc['role'],
      profilePictureUrl: doc['profilePictureUrl'],
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
        'name': fullName ?? '',
        'email': email ?? '',
        'country': country ?? '',
        'phoneNumber': phoneNumber ?? '',
        'address': address ?? '',
        'isbanned': isbanned ?? '',
        'role': role ?? '',
        'profilePictureUrl': profilePictureUrl ?? '',
        'createdAt': Timestamp.now(),
      };
}
