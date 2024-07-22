import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  static const String routeName = 'NotificationPage';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> todayNotifications = [
    NotificationItem(
      title: "Order Shipped",
      subtitle: "Your order has been shipped!",
      imageUrl: "assets/shipped.jpg",
      time: "10:30 AM",
      details:
          "Your order has been shipped via DHL. You can track your shipment using the tracking number provided.",
    ),
    NotificationItem(
      title: "Wishlist Update",
      subtitle: "New product added to your wishlist",
      imageUrl: "assets/wishlist.png",
      time: "2:45 PM",
      details:
          "A new product matching your wishlist preferences has been added. Check it out now!",
    ),
  ];

  List<NotificationItem> yesterdayNotifications = [
    NotificationItem(
      title: "Discount Alert",
      subtitle: "Special discount on your favorite items!",
      imageUrl: "assets/discount.jpg",
      time: "4:20 PM",
      details:
          "Enjoy a 20% discount on all items in your favorite categories. Shop now to take advantage of this offer!",
    ),
    NotificationItem(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showDeleteOptions(context),
                child: Text('Clear Notifications'),
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
          title: Text('Delete Notifications'),
          content: Text(
              'Do you want to delete all notifications or select specific ones?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _clearAllNotifications();
              },
              child: Text('Delete All'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSelectNotificationsToDelete(context);
              },
              child: Text('Select Specific'),
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
          title: Text('Select Notifications to Delete'),
          content: Container(
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
              child: Text('Delete Selected'),
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

  @override
  Widget build(BuildContext context) {
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
            SectionHeader(title: 'Today'),
            ...todayNotifications
                .map((notification) => NotificationTile(notification))
                .toList(),
          ],
          if (yesterdayNotifications.isNotEmpty) ...[
            SectionHeader(title: 'Yesterday'),
            ...yesterdayNotifications
                .map((notification) => NotificationTile(notification))
                .toList(),
          ],
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  final NotificationItem notification;

  const NotificationTile(this.notification, {super.key});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _isHovered = false;

  void _showNotificationDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.notification.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.notification.imageUrl,
                  height: 100, width: 100),
              SizedBox(height: 10),
              Text(widget.notification.subtitle),
              SizedBox(height: 10),
              Text(
                'Time: ${widget.notification.time}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10),
              Text(widget.notification.details),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _showNotificationDetails(context),
        child: Container(
          decoration: BoxDecoration(
            color: _isHovered ? Colors.grey[200] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(widget.notification.imageUrl),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.notification.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      widget.notification.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                _isHovered ? Icons.keyboard_arrow_right : Icons.arrow_right,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckboxListTile extends StatelessWidget {
  final NotificationItem notification;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxListTile({
    required this.notification,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(notification.title),
      subtitle: Text(notification.subtitle),
      value: notification.isSelected,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white, // Color of the check mark
      activeColor: Colors.orange, // Color of the checkbox when selected
      tileColor: notification.isSelected
          ? Colors.orange[50]
          : null, // Background color when selected
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String time;
  final String details;
  bool isSelected;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.time,
    required this.details,
    this.isSelected = false,
  });
}
