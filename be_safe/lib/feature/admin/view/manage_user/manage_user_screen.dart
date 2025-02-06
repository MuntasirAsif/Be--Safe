import 'dart:async';

import 'package:be_safe/feature/User/repository/user_repository.dart';
import 'package:be_safe/feature/admin/view/manage_user/widget/user_card.dart';
import 'package:flutter/material.dart';
import '../../../../model/user_model.dart';

class ManageUserScreen extends StatefulWidget {
  const ManageUserScreen({super.key});

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  late Future<List<UserModel>> users;

  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    users = userRepository.getAllUsers(); // Initialize the Future
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<UserModel>>(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found.'));
            } else if (snapshot.hasData) {
              final userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: userList[index],
                    onEdit: () {
                    },
                    onDelete: () {
                    },
                  );
                },
              );
            } else {
              // Handle any other unexpected state
              return const Center(child: Text('Unexpected error occurred.'));
            }
          },
        ),
      ),
    );
  }
}
