import 'package:flutter/material.dart';

class PercentageChangeStat extends StatelessWidget {
  const PercentageChangeStat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Percentage Change (Compared to Last Month)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Income Increase:'),
            Text('+15%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bookings Charge:'),
            Text('-5%', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
