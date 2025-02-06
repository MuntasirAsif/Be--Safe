import 'package:be_safe/widgets/Card/image_slider.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:flutter/material.dart';

class AllHotelCard extends StatelessWidget {
  final HotelModel hotelModel;

  const AllHotelCard({super.key, required this.hotelModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with VIP Access Badge
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ImageSlider(images: hotelModel.imageUrl,),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: hotelModel.vipStatus?const Text(
                        'VIP Access',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ):const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Hotel Name and Location
          Text(
            hotelModel.location,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Text(
            hotelModel.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Rating
          Text(
            '${hotelModel.rating}/10 Exceptional (${hotelModel.reviews} reviews)',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          // Price and Discount
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'BDT${hotelModel.price}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'BDT',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.info_outline, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            hotelModel.priceInfo,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          // Discount Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              hotelModel.discount,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
