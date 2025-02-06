import 'package:flutter/material.dart';

class BookingConditionsWidget extends StatelessWidget {
  const BookingConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Conditions',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('Non Refundable'),
      ],
    );
  }
}
