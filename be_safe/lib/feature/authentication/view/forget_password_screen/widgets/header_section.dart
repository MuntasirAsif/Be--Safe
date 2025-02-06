import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key, required this.title, required this.subtitle,
  });

  final String title ;
  final String subtitle ;

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 55,
            child: Icon(
              Icons.person,
              size: 60,
            ), // Add your avatar image
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: device.width*0.05),
          child: Column(
            children: [
              Text(
                title,
                style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,),
              ),
              Gap(device.height * 0.02),
              Text(
                subtitle,
                style: textTheme.titleLarge!.copyWith(),textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}