import 'package:flutter/material.dart';

class TopReasonToBook extends StatelessWidget {
  const TopReasonToBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Reason to Book',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 50,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'TOP RATED LOCATION\nGuest rate the location 4.8/5',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
