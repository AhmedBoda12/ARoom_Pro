import 'dart:io';

import 'package:aroom_pro/Features/product/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;

  Future<void> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('Products')
          .orderBy('CreatedAt', descending: true)
          .get();
      List<ProductModel> products =
          await Future.wait(snapshot.docs.map((doc) async {
        ProductModel product = ProductModel.fromFirestore(doc);
        try {
          final imageUrl = await _fireStorage
              .ref('ProductsImages/${product.id}.png')
              .getDownloadURL();
          return ProductModel(
            id: product.id,
            name: product.name,
            price: product.price,
            createdAt: product.createdAt,
            image: File(imageUrl),
            categoryId: product.categoryId,
          );
        } catch (err) {
          return product;
        }
      }).toList());

      emit(Productloaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
