import 'package:aroom_pro/Features/notifications/presentation/views/widgets/section_header.dart';
import 'package:aroom_pro/Features/wishlist/presentation/views/widgets/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:aroom_pro/Features/wishlist/data/models/wishlist_model.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  void _showDeleteOptions(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text(
              'Are you sure you want to delete this item from your wishlist?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  wishlistItems.removeAt(index);
                });
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          if (wishlistItems.isNotEmpty) ...[
            const SectionHeader(title: 'Your Wishlist'),
            ...wishlistItems.map(
              (item) => WishListTile(
                item: item,
                onTap: () {
                  // Show item details or any other action
                },
                onDelete: () {
                  final index = wishlistItems.indexOf(item);
                  _showDeleteOptions(context, index);
                },
              ),
            ),
          ],
          if (wishlistItems.isEmpty)
            const Center(child: Text('No items in your wishlist')),
        ],
      ),
    );
  }
}
