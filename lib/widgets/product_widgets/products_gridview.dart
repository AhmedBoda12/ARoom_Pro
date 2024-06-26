import 'package:aroom_pro/models/product_model.dart';
import 'package:aroom_pro/widgets/product_widgets/product_card.dart';
import 'package:flutter/widgets.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({
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
        return ProductCard(
          product: products[index],
        );
      },
    );
  }
}
