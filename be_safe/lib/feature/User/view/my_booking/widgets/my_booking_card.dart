import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:be_safe/widgets/Card/image_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../constant/text_string.dart';

class MyBookingCard extends StatelessWidget {
  final HotelModel hotelModel;
  final bool isUpcoming; // To distinguish between upcoming and last trips

  const MyBookingCard({
    super.key,
    this.isUpcoming = true,
    required this.hotelModel,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return isUpcoming
        ? Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.blackColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: SizedBox(
                      height: 150,
                      child: ImageSlider(
                        images: hotelModel.imageUrl,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelModel.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(hotelModel.location),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'View Map',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.ratingColor,
                            ),
                            child: Text(
                              hotelModel.rating.toString(),
                              style:
                                  const TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('${hotelModel.rating} review'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.chooseYourRoomBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Breakfast included',
                          style: TextStyle(color: AppColors.blackColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.blackColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: SizedBox(
                    height: 115,
                      width: 150,
                      child: Image(
                        image: NetworkImage(
                          hotelModel.imageUrl.first,
                        ),fit: BoxFit.fitHeight,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelModel.name,maxLines: 1,
                        style: textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(hotelModel.location,style: textTheme.bodyMedium,maxLines: 2,),
                      Text('$checkIn-$checkOut',style: textTheme.bodyMedium,maxLines: 1,),
                      Text(
                        '\$ 400/night',maxLines: 1,
                        style: textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )
    );
  }
}
