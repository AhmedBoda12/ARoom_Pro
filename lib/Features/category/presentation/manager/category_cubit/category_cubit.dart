import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<CategoryModel> categories = [];
  Future<void> loadCategories() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('Categories').orderBy('CreatedAt').get();
      categories =
          snapshot.docs.map((doc) => CategoryModel.fromFirestore(doc)).toList();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
