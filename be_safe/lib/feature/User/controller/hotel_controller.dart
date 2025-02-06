import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/hotel_model.dart';
import '../repository/hotel_repository.dart';

// Define the provider for the HotelRepository
final hotelRepositoryProvider = Provider<HotelRepository>((ref) {
  return HotelRepository();
});

// StateNotifier to manage hotel state
class HotelController extends StateNotifier<List<HotelModel>> {
  final HotelRepository hotelRepository;
  HotelController(this.hotelRepository) : super([]) {
    fetchAllHotels(); // Fetch all hotels when the controller is first created
  }

  // Fetch all hotels and update state
  Future<void> fetchAllHotels() async {
    try {
      final hotels = await hotelRepository.getAllHotels();
      state = hotels;
    } catch (e) {
      // Handle errors or log them as needed
      print('Error fetching hotels: $e');
    }
  }

  // Fetch a single hotel by ID
  Future<HotelModel?> fetchHotelById(String hotelId) async {
    try {
      return await hotelRepository.getHotelById(hotelId);
    } catch (e) {
      print('Error fetching hotel by ID: $e');
      return null;
    }
  }

  // Create a new hotel
  Future<void> createHotel(HotelModel hotel) async {
    try {
      await hotelRepository.createHotel(hotel);
      fetchAllHotels(); // Refresh hotel list after adding a new hotel
    } catch (e) {
      print('Error creating hotel: $e');
    }
  }

  // Update an existing hotel
  Future<void> updateHotel(HotelModel hotel) async {
    try {
      await hotelRepository.updateHotel(hotel);
      fetchAllHotels(); // Refresh hotel list after updating
    } catch (e) {
      print('Error updating hotel: $e');
    }
  }

  // Delete a hotel by ID
  Future<void> deleteHotel(String hotelId) async {
    try {
      await hotelRepository.deleteHotel(hotelId);
      fetchAllHotels(); // Refresh hotel list after deletion
    } catch (e) {
      print('Error deleting hotel: $e');
    }
  }
}

// Define the provider for the HotelController
final hotelControllerProvider =
StateNotifierProvider<HotelController, List<HotelModel>>((ref) {
  final hotelRepository = ref.read(hotelRepositoryProvider);
  return HotelController(hotelRepository);
});
