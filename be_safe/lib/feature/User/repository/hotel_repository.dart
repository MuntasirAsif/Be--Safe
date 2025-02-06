import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/hotel_model.dart';

class HotelRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = "hotels"; // Firestore collection name

  // Create a new hotel entry in Firestore
  Future<void> createHotel(HotelModel hotel) async {
    try {
      await _firestore.collection(collectionPath).doc(hotel.hotelId).set(hotel.toMap());
    } catch (e) {
      throw Exception('Failed to create hotel: $e');
    }
  }

  // Retrieve hotel data by hotel ID
  Future<HotelModel?> getHotelById(String hotelId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionPath).doc(hotelId).get();
      if (doc.exists) {
        return HotelModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch hotel: $e');
    }
  }

  // Retrieve all hotels from the Firestore collection
  Future<List<HotelModel>> getAllHotels() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) {
        return HotelModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch hotels: $e');
    }
  }

  // Update an existing hotel entry in Firestore
  Future<void> updateHotel(HotelModel hotel) async {
    try {
      await _firestore.collection(collectionPath).doc(hotel.hotelId).update(hotel.toMap());
    } catch (e) {
      throw Exception('Failed to update hotel: $e');
    }
  }

  // Delete a hotel entry from Firestore
  Future<void> deleteHotel(String hotelId) async {
    try {
      await _firestore.collection(collectionPath).doc(hotelId).delete();
    } catch (e) {
      throw Exception('Failed to delete hotel: $e');
    }
  }
}
