import 'package:be_safe/feature/User/view/notifications/card/notification_card.dart';
import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

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
