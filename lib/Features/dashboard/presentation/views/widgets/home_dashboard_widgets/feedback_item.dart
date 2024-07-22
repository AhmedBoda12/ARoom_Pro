import 'package:aroom_pro/core/utils/app_colors.dart';
import 'package:aroom_pro/core/utils/defaults.dart';
import 'package:aroom_pro/core/utils/ghaps.dart';
import 'package:flutter/material.dart';

class FeedbackItem extends StatefulWidget {
  const FeedbackItem({
    super.key,
    required this.name,
    required this.username,
    required this.time,
    required this.product,
    required this.comment,
    required this.imageSrc,
    this.onProfilePressed,
    this.onProductPressed,
  });

  final String name, username, time, product, comment, imageSrc;

  final Function()? onProfilePressed, onProductPressed;
  @override
  State<FeedbackItem> createState() => _FeedbackItemState();
}

class _FeedbackItemState extends State<FeedbackItem> {
  bool isProfileHovered = false;
  bool isProductHovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding * 0.5,
        vertical: AppDefaults.padding * 0.75,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: widget.onProfilePressed,
                onHover: (value) {
                  setState(() {
                    isProfileHovered = value;
                  });
                },
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(widget.imageSrc),
                ),
              ),
              gapW8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: widget.onProfilePressed,
                                onHover: (value) {
                                  setState(() {
                                    isProfileHovered = value;
                                  });
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: "${widget.name} ",
                                    style: TextStyle(
                                      color: isProfileHovered
                                          ? AppColors.primary
                                          : Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "@${widget.username}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: isProfileHovered
                                              ? AppColors.primary
                                              : AppColors.textGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              gapH4,
                              InkWell(
                                onTap: widget.onProductPressed,
                                onHover: (value) {
                                  setState(() {
                                    isProductHovered = value;
                                  });
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: "On ",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: AppColors.textGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product,
                                        style: TextStyle(
                                          color: isProductHovered
                                              ? AppColors.primary
                                              : Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .color,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        gapW8,
                        Text(
                          widget.time,
                          style: const TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    gapH16,
                    Text(
                      widget.comment,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
