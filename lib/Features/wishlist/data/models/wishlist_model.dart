// wishlist_model.dart

class WishListItem {
  final String title;
  final String subtitle;
  final String imageUrl;

  WishListItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

// Sample data
final List<WishListItem> wishlistItems = [
  WishListItem(
    title: 'Chair',
    subtitle:
        ' chair with gray color the size is 35*40 cm , Delivery from store Offline',
    imageUrl: 'chair.png',
  ),
  WishListItem(
      title: 'Lamb',
      subtitle:
          'Glass Lamp highly recommened for the palaces and has a unique shade, Delivery Online or Offline',
      imageUrl: 'lamb.png'),
];
