import 'package:aroom_pro/constants/app_colors.dart';
import 'package:aroom_pro/constants/defaults.dart';
import 'package:aroom_pro/constants/ghaps.dart';
import 'package:aroom_pro/views/dashboard/widgets/feedback_item.dart';
import 'package:aroom_pro/views/dashboard/widgets/section_title.dart';
import 'package:flutter/material.dart';

class RecentFeedback extends StatelessWidget {
  const RecentFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDefaults.borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppDefaults.padding * 0.75),
      child: Column(
        children: [
          gapH8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Recent Feedback",
              color: AppColors.secondaryPaleYellow,
            ),
          ),
          gapH16,
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return FeedbackItem(
                name: 'Name',
                username: 'Email',
                time: '1h',
                product: 'Product Name',
                comment: 'Comment',
                imageSrc:
                    'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
                onProfilePressed: () {},
                onProductPressed: () {},
              );
            },
          ),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "View all",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
