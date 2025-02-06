import 'package:be_safe/constant/color_string.dart';
import 'package:flutter/material.dart';

import '../../../../constant/text_string.dart';
import '../../../../widgets/Card/place_card.dart';

class DiscoverYourFavouritePlace extends StatelessWidget {
  const DiscoverYourFavouritePlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: device.width*0.015),
            child: Text(discoverYourNewFavouritePlaces,style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),)),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PlaceCard(image: 'https://d2u0ktu8omkpf6.cloudfront.net/48a7a18ef2989364a42ef81dd25cc492f5bf85d88122b25a.jpg', location: "Sundorban", address: 'Satkhira Division, Bangladesh',),
              PlaceCard(image: 'https://mediaim.expedia.com/destination/1/5ce11f681635ca2ebe2ce691b1aa0ea9.jpg', location: "Sylhet", address: 'Sylhet Division, Bangladesh',),
              PlaceCard(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Midway_to_Konglak_Hill%2C_Khagrachari%2C_Bangladesh.jpg/1280px-Midway_to_Konglak_Hill%2C_Khagrachari%2C_Bangladesh.jpg', location: "Khagrachari", address: 'Khagrachari Division, Bangladesh',),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: AppColors.baseColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text(seeAll,style: textTheme.bodyMedium!.copyWith(color: AppColors.whiteColor),)),
          ),
        )
      ],
    );
  }
}