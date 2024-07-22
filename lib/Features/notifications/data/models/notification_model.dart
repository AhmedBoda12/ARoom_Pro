class NotificationModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String time;
  final String details;
  bool isSelected;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.time,
    required this.details,
    this.isSelected = false,
  });
}
