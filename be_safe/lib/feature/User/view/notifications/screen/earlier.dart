import 'package:flutter/material.dart';

import '../card/notification_card.dart';

class Earlier extends StatelessWidget {
  const Earlier({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationCard(
              title: 'Supper Offer',
              subtitle: 'Get 60% off in our first booking',
              dateTime: 'Sun, 12:40 pm',
            ),
            NotificationCard(
              title: 'Supper Offer',
              subtitle: 'Get 60% off in our first booking',
              dateTime: 'Sun, 12:40 pm',
            ),
            NotificationCard(
              title: 'Supper Offer',
              subtitle: 'Get 60% off in our first booking',
              dateTime: 'Sun, 12:40 pm',
            ),
          ],
        ),
      ),
    );
  }
}
