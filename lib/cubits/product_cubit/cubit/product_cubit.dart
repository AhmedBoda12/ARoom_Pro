import 'package:aroom_pro/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await _firebaseFirestore
          .collection('Products')
          .orderBy('CreatedAt', descending: true)
          .get();
      List<ProductModel> products =
          snapshot.docs.map((doc) => ProductModel.fromFirestore(doc)).toList();
      emit(Productloaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
