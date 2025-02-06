import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VipVsNormalStat extends StatelessWidget {
  const VipVsNormalStat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Normal vs VIP Bookings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.blue,
                  value: 60, // 60% for normal bookings
                  title: 'Normal 60%',
                  radius: 80,
                  titleStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.orange,
                  value: 40, // 40% for VIP bookings
                  title: 'VIP 40%',
                  radius: 80,
                  titleStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 50,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(width: 12, height: 12, color: Colors.blue),
                const SizedBox(width: 5),
                const Text('Normal Bookings'),
              ],
            ),
            const Text('60%', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(width: 12, height: 12, color: Colors.orange),
                const SizedBox(width: 5),
                const Text('VIP Bookings'),
              ],
            ),
            const Text('40%', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
