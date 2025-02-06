import 'package:be_safe/feature/User/view/profile/settings/All%20Options/account_settings/widget/account_action_button.dart';
import 'package:be_safe/widgets/bottom_bar/bottom_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../controller/user_controller.dart';

class DisableDeleteAccountSection extends StatelessWidget {
  final UserController _userController = UserController();

  DisableDeleteAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // Disable Account Button (Assuming implementation for disabling is done)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AccountActionButton(
              label: 'Disable Account',
              color: Colors.amber,
              icon: Icons.delete_forever,
              onPressed: () {
                _showDisableDialog(context, user, fireStore, auth);              },
            ),
            AccountActionButton(
              label: 'Delete Account',
              color: Colors.redAccent,
              icon: Icons.delete_forever,
              onPressed: () {
                _showDeleteDialog(context, user);
              },
            ),
          ],
        ),
      ],
    );
  }


  void _showDisableDialog(BuildContext context, User? user, FirebaseFirestore firestore, FirebaseAuth auth) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Disable Account'),
          content: const Text(
              'Are you sure you want to temporarily disable your account for 7 days? This action will be undone after 7 days.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Disable'),
              onPressed: () async {
                if (user != null) {
                  // Update 'disabled' status in Firestore
                  await firestore.collection('users').doc(user.uid).update({
                    'isDisabled': true, // Add a disabled field (optional)
                    'disabledUntil': DateTime.now().add(const Duration(days: 7)),
                  });

                  // Sign the user out (temporarily disabled)
                  await auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomBarWidget()));
                  // Show confirmation and close the dialog
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account disabled. You will be signed out.')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }



  // Show delete account dialog
  void _showDeleteDialog(BuildContext context, User? user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to permanently delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                if (user != null) {
                  try {

                    await user.delete();
                    await _userController.deleteUser(user.uid,context);

                    // After deleting the account, show confirmation and pop dialog
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account deleted successfully.')),
                    );
                  } catch (e) {
                    // Handle errors during account deletion
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
