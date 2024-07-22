import 'package:aroom_pro/Features/notifications/data/models/notification_model.dart';
import 'package:aroom_pro/Features/notifications/presentation/views/widgets/custom_checkbox_listtile.dart';
import 'package:aroom_pro/Features/notifications/presentation/views/widgets/notification_tile.dart';
import 'package:aroom_pro/Features/notifications/presentation/views/widgets/section_header.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const String routeName = 'NotificationPage';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> todayNotifications = [
    NotificationModel(
      title: "Order Shipped",
      subtitle: "Your order has been shipped!",
      imageUrl: "assets/shipped.jpg",
      time: "10:30 AM",
      details:
          "Your order has been shipped via DHL. You can track your shipment using the tracking number provided.",
    ),
    NotificationModel(
      title: "Wishlist Update",
      subtitle: "New product added to your wishlist",
      imageUrl: "assets/wishlist.png",
      time: "2:45 PM",
      details:
          "A new product matching your wishlist preferences has been added. Check it out now!",
    ),
  ];

  List<NotificationModel> yesterdayNotifications = [
    NotificationModel(
      title: "Discount Alert",
      subtitle: "Special discount on your favorite items!",
      imageUrl: "assets/discount.jpg",
      time: "4:20 PM",
      details:
          "Enjoy a 20% discount on all items in your favorite categories. Shop now to take advantage of this offer!",
    ),
    NotificationModel(
      title: "Profile Reminder",
      subtitle: "Reminder: Complete your profile",
      imageUrl: "assets/warning.png",
      time: "9:00 AM",
      details:
          "Please complete your profile to enjoy personalized recommendations and better service.",
    ),
  ];

  void _showSettingsOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showDeleteOptions(context),
                child: const Text('Clear Notifications'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Notifications'),
          content: const Text(
              'Do you want to delete all notifications or select specific ones?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _clearAllNotifications();
              },
              child: const Text('Delete All'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSelectNotificationsToDelete(context);
              },
              child: const Text('Select Specific'),
            ),
          ],
        );
      },
    );
  }

  void _showSelectNotificationsToDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Notifications to Delete'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...todayNotifications
                    .map((notification) => CustomCheckboxListTile(
                          notification: notification,
                          onChanged: (bool? value) {
                            setState(() {
                              notification.isSelected = value ?? false;
                            });
                          },
                        )),
                ...yesterdayNotifications
                    .map((notification) => CustomCheckboxListTile(
                          notification: notification,
                          onChanged: (bool? value) {
                            setState(() {
                              notification.isSelected = value ?? false;
                            });
                          },
                        )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteSelectedNotifications();
              },
              child: const Text('Delete Selected'),
            ),
          ],
        );
      },
    );
  }

  void _clearAllNotifications() {
    setState(() {
      todayNotifications.clear();
      yesterdayNotifications.clear();
    });
  }

  void _deleteSelectedNotifications() {
    setState(() {
      todayNotifications.removeWhere((notification) => notification.isSelected);
      yesterdayNotifications
          .removeWhere((notification) => notification.isSelected);
    });
  }

  void _showNotificationDetails(
      BuildContext context, NotificationModel notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(notification.imageUrl, height: 100, width: 100),
              const SizedBox(height: 10),
              Text(notification.subtitle),
              const SizedBox(height: 10),
              Text(
                'Time: ${notification.time}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(notification.details),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notifications',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            GestureDetector(
              onTap: () => _showSettingsOptions(context),
              child: Image.asset(
                'assets/settingsIcon.png',
                height: 27,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          if (todayNotifications.isNotEmpty) ...[
            const SectionHeader(title: 'Today'),
            ...todayNotifications.map((notification) => NotificationTile(
                  notification,
                  onTap: () => _showNotificationDetails(context, notification),
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  isHovered: isHovered,
                )),
          ],
          if (yesterdayNotifications.isNotEmpty) ...[
            const SectionHeader(title: 'Yesterday'),
            ...yesterdayNotifications.map((notification) => NotificationTile(
                  notification,
                  onTap: () => _showNotificationDetails(context, notification),
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  isHovered: isHovered,
                )),
          ],
        ],
      ),
    );
  }
}
