import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FadeWidget extends StatelessWidget {
  const FadeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
      ),
    );
  }
}
