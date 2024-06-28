import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    this.onPressed,
  });

  final String title;
  final IconData icon;
  final bool isActive;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: onPressed,
        style: ListTileStyle.drawer,
        selected: isActive,
        selectedColor: Theme.of(context).colorScheme.onPrimary,
        iconColor: Colors.black,
        selectedTileColor:
            isActive ? Theme.of(context).primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(
          icon,
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
