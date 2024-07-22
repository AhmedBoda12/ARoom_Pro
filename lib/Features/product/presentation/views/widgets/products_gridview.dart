import 'package:aroom_pro/Features/category/presentation/manager/category_cubit/category_cubit.dart';
import 'package:aroom_pro/Features/product/data/models/product_model.dart';
import 'package:aroom_pro/core/widgets/empty_widget.dart';
import 'package:aroom_pro/Features/product/presentation/views/widgets/product_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({
    super.key,
    required this.products,
    this.categoryId,
  });
  final List<ProductModel> products;
  final String? categoryId;
  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const EmptyWidget(
          text: 'There is no products', image: 'assets/aroom_logo.png');
    } else {
      List<ProductModel> filteredProducts =
          products.where((e) => e.categoryId == categoryId!).toList();
      if (categoryId == 'b4erAEHt6SQ2ZyklR3H4') {
        return ProductGridviewBuilder(
          products: products,
        );
      } else if (filteredProducts.isEmpty) {
        return const EmptyWidget(
            text: 'There is no products', image: 'assets/aroom_logo.png');
      } else {
        return ProductGridviewBuilder(products: filteredProducts);
      }
    }
  }
}

class ProductGridviewBuilder extends StatelessWidget {
  const ProductGridviewBuilder({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final categories = BlocProvider.of<CategoryCubit>(context)
            .categories
            .where((e) => e.id == products[index].categoryId)
            .toList();

        return ProductCard(
          product: products[index],
          categoryName: categories[0].categoryName!,
        );
      },
    );
  }
}
