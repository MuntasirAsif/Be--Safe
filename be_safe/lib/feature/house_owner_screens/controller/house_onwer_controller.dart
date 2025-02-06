import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/house_owner_model.dart';
import '../repository/house_onwer_repository.dart';


// Create a StateNotifier for house owners
class HouseOwnerNotifier extends StateNotifier<List<HouseOwnerModel>> {
  final HouseOwnerRepository _repository;

  HouseOwnerNotifier(this._repository) : super([]);

  // Fetch all house owners
  Future<void> fetchHouseOwners() async {
    try {
      final owners = await _repository.getHouseOwners();
      state = owners; // Update the state
    } catch (e) {
      // Handle errors (e.g., log them or show a message)
      print('Error fetching house owners: $e');
    }
  }

  // Add a new house owner
  Future<void> addHouseOwner(HouseOwnerModel houseOwner) async {
    try {
      await _repository.addHouseOwner(houseOwner);
      await fetchHouseOwners(); // Refresh the list
    } catch (e) {
      print('Error adding house owner: $e');
    }
  }

  // Update an existing house owner
  Future<void> updateHouseOwner(String documentId, HouseOwnerModel houseOwner) async {
    try {
      await _repository.updateHouseOwner(documentId, houseOwner);
      await fetchHouseOwners(); // Refresh the list
    } catch (e) {
      print('Error updating house owner: $e');
    }
  }

  // Delete a house owner
  Future<void> deleteHouseOwner(String documentId) async {
    try {
      await _repository.deleteHouseOwner(documentId);
      await fetchHouseOwners(); // Refresh the list
    } catch (e) {
      print('Error deleting house owner: $e');
    }
  }
}

// Create a provider for HouseOwnerNotifier
final houseOwnerProvider = StateNotifierProvider<HouseOwnerNotifier, List<HouseOwnerModel>>((ref) {
  final repository = HouseOwnerRepository();
  return HouseOwnerNotifier(repository);
});
