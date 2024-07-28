import 'package:aroom_pro/Features/notifications/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:aroom_pro/Features/wishlist/data/models/wishlist_model.dart';
import 'package:aroom_pro/Features/wishlist/presentation/views/widgets/wishlist_tile.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final List<WishListItem> wishlistItems = [
    WishListItem(
      title: 'Chair',
      subtitle: 'Gray chair',
      imageUrl: 'assets/chair.png',
      price: 1200,
      details: 'A comfortable gray chair with a modern design, perfect for any living room.',
      productUrl: 'https://example.com/chair', // Example URL
    ),
    WishListItem(
      title: 'Lamp',
      subtitle: 'Glass Lamp',
      imageUrl: 'assets/lamb.png',
      price: 120,
      details: 'A stylish glass lamp with a unique shade, ideal for adding a touch of elegance.',
      productUrl: 'https://example.com/lamp', // Example URL
    ),
  ];

  void _showProductDetails(BuildContext context, WishListItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: ${item.price.toStringAsFixed(2)} LE', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              Text(item.details, style: const TextStyle(fontSize: 18)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product page is under development.'),
                  ),
                );
              },
              child: const Text('Visit Product'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _removeItem(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  void _addToCart(WishListItem item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.title} added to cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          if (wishlistItems.isNotEmpty) ...[
            const SectionHeader(title: 'Favourites'),
            ...wishlistItems.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final item = entry.value;
                return WishListTile(
                  item: item,
                  onTap: () {
                    _showProductDetails(context, item);
                  },
                  onRemove: () {
                    _removeItem(index); // Directly remove the item
                  },
                  onAddToCart: () {
                    _addToCart(item);
                  },
                );
              },
            ).toList(),
          ],
          if (wishlistItems.isEmpty)
            const Center(child: Text('No items in your wishlist')),
        ],
      ),
    );
  }
}
