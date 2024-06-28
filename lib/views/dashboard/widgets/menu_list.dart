import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });
  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        children: children,
      ),
    );
  }
}
