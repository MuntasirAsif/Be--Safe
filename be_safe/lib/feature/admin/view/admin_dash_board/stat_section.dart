import 'package:flutter/material.dart';
import 'widgets/vip_vs_normal_stat.dart';
import 'widgets/income_stat.dart';
import 'widgets/percentage_change_stat.dart';

class StatSection extends StatelessWidget {
  const StatSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        VipVsNormalStat(),
        SizedBox(height: 20),
        IncomeStat(),
        SizedBox(height: 20),
        PercentageChangeStat(),
      ],
    );
  }
}
