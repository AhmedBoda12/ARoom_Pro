import 'package:aroom_pro/views/dashboard/widgets/overview_tabs.dart';
import 'package:aroom_pro/views/dashboard/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/defaults.dart';
import '../../../constants/ghaps.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SectionTitle(title: "Overview"),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppDefaults.borderRadius)),
                  border: Border.all(width: 2, color: AppColors.highlightLight),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding, vertical: 0),
                  style: Theme.of(context).textTheme.labelLarge,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(AppDefaults.borderRadius)),
                  underline: const SizedBox(),
                  value: "All time",
                  items: const [
                    DropdownMenuItem(
                      value: "All time",
                      child: Text("All time"),
                    ),
                    DropdownMenuItem(
                      value: "This year",
                      child: Text("This year"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          gapH24,
          const OverviewTabs(),
        ],
      ),
    );
  }
}
