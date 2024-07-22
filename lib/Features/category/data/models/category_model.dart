import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String? categoryName;
  final IconData? icon;

  CategoryModel({
    required this.id,
    this.categoryName,
    this.icon,
  });

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    return CategoryModel(
        id: doc.id,
        categoryName: doc['CategoryName'],
        icon: getIconData(doc['CategoryIcon']));
  }

  static Map<String, IconData> iconMap = {
    'bed': Icons.bed,
    'table': Icons.table_bar,
    'sofa': Icons.chair,
    'Storage': Icons.curtains_closed_outlined,
  };

  static IconData? getIconData(String iconString) {
    return iconMap[iconString];
  }

  Map<String, dynamic> toFirestore() => {
        'categoryName': categoryName,
        'icon': icon,
      };
}
