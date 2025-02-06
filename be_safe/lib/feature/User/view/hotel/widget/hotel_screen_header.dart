import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class HotelScreenHeader extends StatelessWidget {
  const HotelScreenHeader({
    super.key,
    required this.textTheme,
    required this.dateString,
  });

  final TextTheme textTheme;
  final String dateString;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: ()=>Navigator.pop(context),
                child: const Icon(Icons.arrow_back)),
            const Gap(15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hotel mermaid',
                  style: textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  dateString,
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_pin,
              size: 30,
            ),
            const Gap(2),
            Text(
              'Location',
              style: textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}