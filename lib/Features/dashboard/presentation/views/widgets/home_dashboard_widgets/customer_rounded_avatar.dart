import 'package:aroom_pro/core/utils/defaults.dart';
import 'package:flutter/cupertino.dart';

class CustomerRoundedAvatar extends StatelessWidget {
  const CustomerRoundedAvatar({
    super.key,
    this.height = 55,
    this.width = 55,
    this.radius = AppDefaults.borderRadius,
    required this.imageSrc,
  });

  final double height, width, radius;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: AssetImage(imageSrc),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
