import 'package:be_safe/widgets/Card/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../model/hotel_model.dart';
import '../../../../../model/house_owner_model.dart';

class HouseOwnerCard extends StatelessWidget {
  final HouseOwnerModel houseOwner;
  final List<HotelModel> hotels;

  const HouseOwnerCard({super.key, required this.houseOwner, required this.hotels});

  @override
  Widget build(BuildContext context) {
    // Find the hotel that matches the house owner's hotelId
    HotelModel? matchingHotel = hotels.firstWhere(
          (hotel) => hotel.hotelId == houseOwner.hotelId,
      orElse: () => HotelModel(
        location: 'Unknown',
        name: 'Unknown Hotel',
        imageUrl: [],
        rating: 0,
        reviews: 0,
        price: '0',
        priceInfo: '',
        discount: '',
        vipStatus: false,
        localBookingOfferPercentage: '',
        payLater: false,
        hotelCategory: '',
        hotelId: '',
        totalRooms: 0,
        bookedRooms: 0,
        isRegistered: false,
        keyFeatures: ['Free Wifi', 'TV', 'Free parking'],
        breakfastAvailable: false,
        description: 'No details available.',
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ExpansionTile(
          title: Text(
            matchingHotel.name.isNotEmpty ? matchingHotel.name : 'Unknown Hotel',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            matchingHotel.location.isNotEmpty ? matchingHotel.location : 'Unknown Location',
            style: const TextStyle(color: Colors.grey),
          ),
          leading: SizedBox(
            height: 60,
            width: 90,
            child: matchingHotel.imageUrl.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(matchingHotel.imageUrl.first, fit: BoxFit.cover),
            )
                : Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.hotel, size: 40, color: Colors.grey),
            ), // Placeholder for no image
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hotel Images:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: ImageSlider(images: matchingHotel.imageUrl),
                  ),
                  const Gap(5),
                  Text(matchingHotel.description),
                  _buildHotelDetail('Rating:', matchingHotel.rating.toString()),
                  _buildHotelDetail('Price/night:', '${matchingHotel.price}৳'),
                  _buildHotelDetail('Rooms:', '${matchingHotel.bookedRooms}/${matchingHotel.totalRooms}'),
                  const SizedBox(height: 16),
                  const Text('Owner Details:', style: TextStyle(fontWeight: FontWeight.bold)),
                  _buildOwnerDetailRow('Owner Name:', houseOwner.ownerName),
                  _buildOwnerDetailRow('Phone No:', houseOwner.phoneNumber),
                  _buildOwnerDetailRow('NID No:', houseOwner.nidNumber),
                  const SizedBox(height: 8),
                  const Text('NID Image:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: houseOwner.ownerDocImageUrl.map((url) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              url,
                              height: 150,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (!matchingHotel.isRegistered) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle Accept action
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Accept'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Decline action
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Decline'),
                        ),
                      ],
                    ),
                  ] else ...[
                    ElevatedButton(
                      onPressed: () {
                        // Handle Delete Registration action
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Delete Registration'),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildOwnerDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
