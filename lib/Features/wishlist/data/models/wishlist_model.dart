class WishListItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final double price; // Add a price field
  final String details; // Add a details field
  final String? productUrl; // Add an optional product URL field

  WishListItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.price,
    required this.details,
    this.productUrl,
  });
}
