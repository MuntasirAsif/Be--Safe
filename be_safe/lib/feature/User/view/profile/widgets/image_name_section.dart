import 'package:flutter/material.dart';

import '../../../../../constant/color_string.dart';
class ImageNameSection extends StatelessWidget {
  final String name;
  final String imageUrl;
  const ImageNameSection({
    super.key,
    required this.textTheme, required this.name, required this.imageUrl,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: AppColors.bgGray,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.unselectOptionMarkerColor),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
              )
            ),
            child: imageUrl==''?Center(child: Text(name.substring(0,1),style: textTheme.displayMedium,)):const SizedBox(),
          ),
          Text(name,style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}