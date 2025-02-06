import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../model/user_model.dart';
import '../repository/user_repository.dart';

class UserController with ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  List<UserModel> _users = [];
  UserModel? _currentUser;

  List<UserModel> get users => _users;
  UserModel? get currentUser => _currentUser;

  // Show a SnackBar message
  void _showMessage(BuildContext context, String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Create a new user
  Future<void> createUser(UserModel user, BuildContext context) async {
    if (kDebugMode) {
      print(user.toString());
    }
    try {
      await _userRepository.createUser(user);
      _users.add(user);
      notifyListeners(); // Notify listeners about the change
      _showMessage(context, 'Account created successfully!');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _showMessage(context, 'Failed to create user: $e', isError: true);
    }
  }

  // Fetch a user by ID
  Future<void> fetchUserById(String userID,) async {
    try {
      _currentUser = await _userRepository.getUserById(userID);
      if (kDebugMode) {
        print(currentUser?.name);
      }
      notifyListeners(); // Notify listeners about the change
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Fetch all users
  Future<void> fetchAllUsers() async {
    try {
      _users = await _userRepository.getAllUsers();
      notifyListeners(); // Notify listeners about the change
    } catch (e) {
      print(e);
    }
  }

  // Update a user
  Future<void> updateUser(UserModel user, BuildContext context) async {
    try {
      await _userRepository.updateUser(user);
      int index = _users.indexWhere((u) => u.userID == user.userID);
      if (index != -1) {
        _users[index] = user; // Update the local list
      }
      notifyListeners(); // Notify listeners about the change
      _showMessage(context, 'Information updated successfully!');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _showMessage(context, 'Failed to update information: $e', isError: true);
    }
  }

  // Delete a user
  Future<void> deleteUser(String userID, BuildContext context) async {
    try {
      await _userRepository.deleteUser(userID);
      _users.removeWhere((user) => user.userID == userID); // Remove from the local list
      notifyListeners(); // Notify listeners about the change
      _showMessage(context, 'Account deleted successfully!');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _showMessage(context, 'Failed to delete account: $e', isError: true);
    }
  }
}
