import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';
import '../../../../../model/user_model.dart';

class UserCard extends StatefulWidget {
  final UserModel user;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UserCard({
    super.key,
    required this.user,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: isDarkMode?colorScheme.surface:AppColors.bgGray,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue[100],
                    backgroundImage: widget.user.profileImageUrl.isNotEmpty
                        ? NetworkImage(widget.user.profileImageUrl)
                        : null,
                    child: widget.user.profileImageUrl.isEmpty
                        ? Text(widget.user.name[0].toUpperCase(), style: const TextStyle(fontSize: 22,color: Colors.black))
                        : null,
                  ),
                  const SizedBox(width: 16),
                  // User Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(widget.user.email),
                        Text("Role: ${widget.user.role}", style: const TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  // Action Buttons
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: widget.onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
            ),
            // Expanded Details
            if (_isExpanded) ...[
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const SizedBox(height: 4),
              Text(widget.user.mobileNumber),
              const SizedBox(height: 4),
              Text(widget.user.address, style: const TextStyle(color: Colors.grey)),
              Text("Status: ${widget.user.sellerStatus}", style: const TextStyle(fontWeight: FontWeight.w500)),

            ],
          ],
        ),
      ),
    );
  }
}
