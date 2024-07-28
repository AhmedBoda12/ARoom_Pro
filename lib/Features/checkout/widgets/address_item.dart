import 'package:flutter/material.dart';

class addressitem extends StatelessWidget {
  const addressitem({
    super.key,
    required this.location,
    required this.onpressed,
    required this.image,
  });
  final String location;
  final VoidCallback onpressed;

  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: const Offset(0, 0.5),
              ),
            ],
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 100,
          height: 150,
        ),
        title: const Text('Home'),
        subtitle: Text(location),
        visualDensity: const VisualDensity(vertical: 2),
        onTap: onpressed);
  }
}
