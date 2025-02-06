import 'package:flutter/material.dart';
class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String dateTime;
  const NotificationCard({super.key, required this.title, required this.subtitle, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        title: Text(
          title,
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
        ),
        subtitle: Text(
          subtitle,
          maxLines: 2,
        ),
        trailing: Column(
          children: [
            Text(dateTime),
          ],
        ),
      ),
    );
  }
}
