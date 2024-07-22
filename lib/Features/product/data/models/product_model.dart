import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String name;
  String categoryId;
  String price;
  File image;
  DateTime createdAt;

  ProductModel(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.price,
      required this.image,
      required this.createdAt});

  factory ProductModel.fromFirestore(DocumentSnapshot doc) => ProductModel(
        id: doc.id,
        name: doc['Name'],
        categoryId: doc['CategoryId'],
        price: doc['Price'].toString(),
        image: File(doc['ImagePath']),
        createdAt: (doc['CreatedAt'] as Timestamp).toDate(),
      );
}
