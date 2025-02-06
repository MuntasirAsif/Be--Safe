import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/color_string.dart';
import '../../../../../constant/text_string.dart';

class HotelRoomInfo extends StatelessWidget {
  final String hotelName;
  final String location;
  final String rating;
  const HotelRoomInfo({
    super.key,
    required this.hotelName,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final device = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          location,
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          '$rating-Star Hotel',
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        Gap(device.height * 0.03),
        Text("$yourRoom: Business Class", style: textTheme.bodyLarge),
        Text(nonRefundable,
            style: textTheme.bodyMedium!
                .copyWith(color: AppColors.labelTextColor)),
      ],
    );
  }
}
