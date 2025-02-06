import 'package:flutter/material.dart';

import '../../../../User/view/notifications/notification_screen.dart';
import '../../../../User/view/profile/profile_screen.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Admin Dashboard'),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
          },
        ),
      ],
    );
  }

  // Implementing the preferredSize property
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
