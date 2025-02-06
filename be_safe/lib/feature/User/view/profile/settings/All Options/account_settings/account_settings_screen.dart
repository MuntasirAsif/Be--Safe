import 'package:flutter/material.dart';

import '../../widgets/profile_information_widget.dart';
import 'disable_delete_account_section.dart';

class AccountSettingsScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  const AccountSettingsScreen({super.key, required this.imageUrl, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Information Section
            ProfileInfo(imageUrl: imageUrl, name: name, email: email,),
            const SizedBox(height: 30),

            // Disable and Delete Account Section
            DisableDeleteAccountSection(),

            const Spacer(), // Pushes buttons to the bottom of the screen
          ],
        ),
      ),
    );
  }
}




