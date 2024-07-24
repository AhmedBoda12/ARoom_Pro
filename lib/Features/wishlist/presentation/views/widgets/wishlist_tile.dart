import 'package:aroom_pro/Features/wishlist/data/models/wishlist_model.dart';
import 'package:flutter/material.dart';

class WishListTile extends StatelessWidget {
  final WishListItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const WishListTile({
    required this.item,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.imageUrl),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}
