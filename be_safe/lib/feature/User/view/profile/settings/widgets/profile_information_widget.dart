import 'package:flutter/material.dart';
class ProfileInfo extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  const ProfileInfo({super.key, required this.imageUrl, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                imageUrl), // Sample profile image
          ),
          title: Text(name),
          subtitle: Text(email),
        ),
      ],
    );
  }
}