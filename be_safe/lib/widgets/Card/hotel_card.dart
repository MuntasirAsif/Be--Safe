import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../model/hotel_model.dart';

class HotelCard extends StatefulWidget {
  final HotelModel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Background color based on theme
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow, // Shadow color based on theme
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      widget.hotel.imageUrl.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors
                            .localDealBg, // Local deal background color based on theme
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'LOCAL DEAL',
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors
                              .localDealFontColor, // Text color based on theme
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.hotel.localBookingOfferPercentage}% Off',
                      style: const TextStyle(
                        color: AppColors
                            .localDealFontColor, // Offer color based on theme
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Limited time offer',
                      style: TextStyle(
                        color:
                            colorScheme.onSurface, // Text color based on theme
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'BDT ',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: colorScheme
                            .onSurface, // Text color based on theme
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'BDT ${paymentPrice(double.parse(widget.hotel.price), widget.hotel.discount)}',
                      style: textTheme.titleLarge!.copyWith(color: AppColors.localDealFontColor,)
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8,bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Perice per night',style: textTheme.bodySmall,),
                    const Gap(100),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors
                            .chooseYourRoomBg, // Button background color based on theme
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'See more',
                        style: textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.hotel.name,
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: AppColors.iconColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      widget.hotel.location,
                      style: const TextStyle(
                        color: AppColors.iconColor, // Text color based on theme
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Features Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check,
                        color: AppColors.localDealFontColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'widget.hotel.keyOpportunities',
                      style: TextStyle(
                        color: colorScheme
                            .onSurface, // Text color based on theme
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                widget.hotel.payLater
                    ? Row(
                        children: [
                          const Icon(Icons.check,
                              color: AppColors.localDealFontColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Pay Later Available',
                            style: TextStyle(
                              color: colorScheme
                                  .onSurface, // Text color based on theme
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(Icons.dangerous_outlined,
                              color: colorScheme.error, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Pay Later Is Not Available',
                            style: TextStyle(
                              color: colorScheme
                                  .onSurface, // Text color based on theme
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 4),
                // Ratings Section
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors
                            .ratingColor, // Rating background color based on theme
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.hotel.rating.toString(),
                        style: TextStyle(
                          color: colorScheme
                              .onSecondary, // Rating text color based on theme
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.hotel.reviews} Rating | ${widget.hotel.hotelCategory}-Star Hotel',
                      style: TextStyle(
                        color:
                            colorScheme.onSurface, // Text color based on theme
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String paymentPrice(double oldPrice, String offerPercentage) {
    double price = oldPrice - (oldPrice * int.parse(offerPercentage) / 100);
    return price.toStringAsFixed(2);
  }
}
