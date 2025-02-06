import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.image,
    required this.location,
    required this.address,
  });

  final String image;
  final String location;
  final String address;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.symmetric(horizontal: device.width * 0.015, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Uses background color from the theme
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow, // Adapts shadow color to the theme
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onBackground, // Adapt the text color
                  ),
                  maxLines: 1,
                ),
                Text(
                  address,
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurface, // Adapt the text color
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
