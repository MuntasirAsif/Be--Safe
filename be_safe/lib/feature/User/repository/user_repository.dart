import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = "users";

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection(collectionPath).doc(user.userID).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<UserModel?> getUserById(String userID) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionPath).doc(userID).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection(collectionPath).doc(user.userID).update(user.toMap());
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<void> deleteUser(String userID) async {
    try {
      await _firestore.collection(collectionPath).doc(userID).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
