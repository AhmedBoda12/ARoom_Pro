import 'package:aroom_pro/Features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final NotificationModel notification;
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
