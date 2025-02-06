import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String image;
  final String name;
  final String lastSms;
  final String time;
  const ChatCard(
      {super.key,
      required this.image,
      required this.name,
      required this.lastSms,
      required this.time});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
        margin: const EdgeInsets.only(bottom: 8),
        elevation: 4,
      color: colorScheme.surface,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(name),
        subtitle: Text(lastSms),
        trailing: Text(time),
      ),
    );
  }
}
