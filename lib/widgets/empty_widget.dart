import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Text(text),
        ],
      ),
    );
  }
}
