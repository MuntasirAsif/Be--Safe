import 'package:be_safe/feature/admin/view/house_owner/widgets/house_owner_card.dart';
import 'package:flutter/material.dart';
import '../../../../model/hotel_model.dart';
import '../../../../model/house_owner_model.dart';
import '../../../User/repository/hotel_repository.dart';
import '../../../house_owner_screens/repository/house_onwer_repository.dart';

class HouseOwnerRequestScreen extends StatefulWidget {
  const HouseOwnerRequestScreen({super.key});

  @override
  State<HouseOwnerRequestScreen> createState() => _HouseOwnerRequestScreenState();
}

class _HouseOwnerRequestScreenState extends State<HouseOwnerRequestScreen> {

  late Future<List<HouseOwnerModel>> houseOwnersFuture;
  late Future<List<HotelModel>> hotelsFuture;

  HotelRepository hotelRepository = HotelRepository();
  HouseOwnerRepository houseOwnerRepository = HouseOwnerRepository();

  @override
  void initState() {
    super.initState();
    houseOwnersFuture = houseOwnerRepository.getHouseOwners();
    hotelsFuture = hotelRepository.getAllHotels();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House Owner Requests'),
      ),
      body: FutureBuilder<List<HouseOwnerModel>>(
        future: houseOwnersFuture,
        builder: (context, houseOwnerSnapshot) {
          if (houseOwnerSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (houseOwnerSnapshot.hasError) {
            return Center(child: Text('Error: ${houseOwnerSnapshot.error}'));
          } else if (!houseOwnerSnapshot.hasData || houseOwnerSnapshot.data!.isEmpty) {
            return const Center(child: Text('No house owners found.'));
          } else {
            return FutureBuilder<List<HotelModel>>(
              future: hotelsFuture,
              builder: (context, hotelSnapshot) {
                if (hotelSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (hotelSnapshot.hasError) {
                  return Center(child: Text('Error: ${hotelSnapshot.error}'));
                } else if (!hotelSnapshot.hasData || hotelSnapshot.data!.isEmpty) {
                  return const Center(child: Text('No hotels found.'));
                } else {
                  final houseOwners = houseOwnerSnapshot.data!;
                  final hotels = hotelSnapshot.data!;

                  return ListView.builder(
                    itemCount: houseOwners.length,
                    itemBuilder: (context, index) {
                      final houseOwner = houseOwners[index];
                      final unregisteredHotels = hotels
                          .where((hotel) =>
                      hotel.isRegistered == false && hotel.hotelId == houseOwner.hotelId)
                          .toList();

                      if (unregisteredHotels.isNotEmpty) {
                        return HouseOwnerCard(
                          houseOwner: houseOwner,
                          hotels: unregisteredHotels,
                        );
                      } else {
                        return const SizedBox(); // Return an empty widget if no unregistered hotels
                      }
                    },
                  );
                }
              },
            );
          }
        },
      ),    );
  }
}
