import 'package:aroom_pro/Features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.categoryName,
  });
  final ProductModel product;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: const Alignment(0, 0),
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: const Color(0xff4C4B39EF),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName,
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 17,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton.filled(
            color: Theme.of(context).colorScheme.primary,
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              elevation: 4,
            ),
            onPressed: () {},
            icon: const Icon(Icons.add_shopping_cart),
          ),
        ),
        Positioned(
          bottom: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: product.image.path,
                  fit: BoxFit.cover,
                  height: 220,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
