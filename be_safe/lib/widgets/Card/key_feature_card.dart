import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constant/color_string.dart';

class KeyFeatureCard extends StatelessWidget {
  final String title;
  const KeyFeatureCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: AppColors.grayIconBg, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            beckIcon(title),
            color: AppColors.blackColor,
          ),
          const Gap(5),
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  IconData beckIcon(String title) {
    switch (title.toLowerCase()) {
      case 'free wifi':
        return Icons.wifi;
      case 'free parking':
        return Icons.local_parking;
      case 'free breakfast':
        return Icons.emoji_food_beverage_outlined;
      case 'tv':
        return Icons.tv;
      case 'dressing table':
        return Icons.table_bar_outlined;
      case 'free soap':
        return Icons.soap;
      case 'hair drawer':
        return Icons.cleaning_services;
      default:
        return Icons.check_circle;
    }
  }
}
