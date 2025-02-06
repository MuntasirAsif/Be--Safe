import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../model/house_owner_model.dart';

class HouseOwnerRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  

  // Add a new house owner
  Future<void> addHouseOwner(HouseOwnerModel houseOwner) async {
    final user = firebaseAuth.currentUser;
    final uid = user!.uid;
    try {
      await _firestore.collection('houseOwners').doc(uid).set(houseOwner.toJson());
    } catch (e) {
      throw Exception('Failed to add house owner: $e');
    }
  }

  // Get a list of house owners
  Future<List<HouseOwnerModel>> getHouseOwners() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('houseOwners').get();
      return querySnapshot.docs.map((doc) {
        return HouseOwnerModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get house owners: $e');
    }
  }

  //Get house owner by Id
  Future<HouseOwnerModel?> getHouseOwnerById(String id) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore.collection('houseOwners').doc(id).get();
      if (docSnapshot.exists) {
        return HouseOwnerModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get house owner by ID: $e');
    }
  }

  // Update an existing house owner
  Future<void> updateHouseOwner(String documentId, HouseOwnerModel houseOwner) async {
    try {
      await _firestore.collection('houseOwners').doc(documentId).update(houseOwner.toJson());
    } catch (e) {
      throw Exception('Failed to update house owner: $e');
    }
  }

  // Delete a house owner
  Future<void> deleteHouseOwner(String documentId) async {
    try {
      await _firestore.collection('houseOwners').doc(documentId).delete();
    } catch (e) {
      throw Exception('Failed to delete house owner: $e');
    }
  }
}
