part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class Productloaded extends ProductState {
  final List<ProductModel> products;
  Productloaded(this.products);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
