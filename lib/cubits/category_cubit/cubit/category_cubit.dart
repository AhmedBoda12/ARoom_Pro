import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadCategories() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('Categories').orderBy('CreatedAt').get();
      List<CategoryModel> categories =
          snapshot.docs.map((doc) => CategoryModel.fromFirestore(doc)).toList();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
