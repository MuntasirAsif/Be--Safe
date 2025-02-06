import 'package:flutter/material.dart';

import '../../../../../constant/text_string.dart';
class CheckInOutSection extends StatelessWidget {
  const CheckInOutSection({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("$checkIn: ", style: textTheme.bodyMedium),
            Text("00/00/00",
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Text("$checkOut: ", style: textTheme.bodyMedium),
            Text("00/00/00",
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}