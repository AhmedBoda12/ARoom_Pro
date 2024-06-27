import 'dart:developer';

import 'package:aroom_pro/models/product_model.dart';
import 'package:aroom_pro/widgets/empty_widget.dart';
import 'package:aroom_pro/widgets/product_widgets/product_card.dart';
import 'package:flutter/widgets.dart';

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
        List<ProductModel> filteredProducts = [];
        if (categoryId != null) {
          if (categoryId == 'b4erAEHt6SQ2ZyklR3H4') {
            return ProductCard(
              product: products[index],
            );
          }
          filteredProducts =
              products.where((e) => e.categoryId == categoryId!).toList();
          log(filteredProducts.toString());
          if (filteredProducts.isEmpty) {
            return const EmptyWidget(
                text: 'No products', image: 'assets/aroom_logo.png');
          } else {
            return ProductCard(product: filteredProducts[index]);
          }
        } else {
          return ProductCard(
            product: products[index],
          );
        }
      },
    );
  }
}
